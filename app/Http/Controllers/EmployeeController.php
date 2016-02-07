<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\FormWriters\WritePersonalDataSheet;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Http\Requests\PDSFormRequest;
use DNSCHumanResource\HumanResource\Services\EmployeeService;
use DNSCHumanResource\Models\Department;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\EmployeeAddress;
use DNSCHumanResource\Models\EmployeeChild;
use DNSCHumanResource\Models\EmployeeCivilService;
use DNSCHumanResource\Models\EmployeeEducation;
use DNSCHumanResource\Models\EmployeeNonAcademic;
use DNSCHumanResource\Models\EmployeeOrganization;
use DNSCHumanResource\Models\EmployeeParent;
use DNSCHumanResource\Models\EmployeeSkill;
use DNSCHumanResource\Models\EmployeeSpouse;
use DNSCHumanResource\Models\EmployeeTrainingProgram;
use DNSCHumanResource\Models\EmployeeVoluntaryWork;
use DNSCHumanResource\Models\EmployeeWorkExperience;
use DNSCHumanResource\Models\Position;
use DNSCHumanResource\Models\User;
use DNSCHumanResource\Repositories\EmployeeRepository;
use DNSCHumanResource\Repositories\TrainingRepository;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    protected $employee;

    protected $employeeRepository;

    protected $employeeService;

    public function __construct(EmployeeRepository $employeeRepository, EmployeeService $employeeService)
    {
        $this->middleware('employee', ['except' => ['index', 'create', 'store']]);
        $this->middleware('admin', ['only' => 'index']);
        $this->employeeRepository = $employeeRepository;
        $this->employeeService = $employeeService;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        if (!auth()->user()->employee) {
            $action = '/employee';
            return view('employee.create')->with(compact('action'));
        }
        return redirect()->to('/');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit(Request $request, User $user)
    {
        $employee = $this->employeeRepository->forUser($user)->first();
        if ($request->user()->can('update', $employee)) {
            $action = '/employee/' . $user->username;
            return view('employee.create')->with(compact('employee', 'action'));
        }
        flash()->error('You are not allowed to edit this profile.');
        return redirect()->back();
    }

    public function export(User $user)
    {
        $employee = $this->employeeRepository->forUser($user)->first();
        if ($employee) {
            write_form(new WritePersonalDataSheet($employee));
            // return response()->download('files/PersonalDataSheets/' . $employee->file);
        }
        flash()->error('Personal Data Sheet not found!');
        return redirect()->back();
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $departments = Department::department()->get();
        $institutes = Department::institute()->get();
        $positions = Position::all();
        return view('employee.index')->with(compact('departments', 'institutes', 'positions'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show(Request $request, User $user, TrainingRepository $trainingRepository)
    {
        $employee = $this->employeeRepository->forUser($user)->with('personnel_performance', 'employee_qce')->first();

        if ($request->user()->can('show', $employee)) {

            $approvals = collect();

            $approvals->push($employee->approval_heirarchy ? $employee->approval_heirarchy->recommending_approval : null);

            $approvals->push($employee->approval_heirarchy ? $employee->approval_heirarchy->approved_by : null);

            $rating = $employee->personnel_performance;

            $qce = $employee->employee_qce;

            $trainings = $trainingRepository->forEmployee($employee);

            return view('employee.' . config('hris.profile-design'))->with(compact('user', 'employee', 'rating', 'qce', 'approvals', 'trainings'));
        }
        flash()->error('You are not allowed to view the requested profile!');
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(PDSFormRequest $request)
    {
        if ($request->validateEmployee($request->all())->fails()) {
            flash()->error('Validation error!');
            return redirect()->back();
        }

        $this->employee = auth()->user()->employee()->save(new Employee($this->employeeService->getEmployee($request)));

        $this->employee->utility()->create([]);

        foreach ($this->employeeService->getEmployeeAddress($request) as $address) {
            $this->employee->employee_address()->save(new EmployeeAddress($address));
        }
        $spouse = $this->employeeService->getEmployeeSpouse($request);

        if (!$request->validateSpouse($spouse)->fails()) {
            $this->employee->employee_spouse()->save(new EmployeeSpouse($spouse));
        }
        foreach ($this->employeeService->getEmployeeChildren($request) as $child) {
            $this->employee->employee_child()->save(new EmployeeChild($child));
        }
        foreach ($this->employeeService->getEmployeeParents($request) as $parent) {
            $this->employee->employee_parents()->save(new EmployeeParent($parent));
        }
        foreach ($this->employeeService->getEmployeeEducation($request) as $education) {
            $this->employee->employee_educations()->save(new EmployeeEducation($education));
        }
        foreach ($this->employeeService->getEmployeeCivilService($request) as $civil_service) {
            $this->employee->employee_civil_services()->save(new EmployeeCivilService($civil_service));
        }
        foreach ($this->employeeService->getEmployeeWorkExperience($request) as $work_experience) {
            $this->employee->employee_work_experiences()->save(new EmployeeWorkExperience($work_experience));
        }
        foreach ($this->employeeService->getEmployeeVoluntaryWork($request) as $voluntary_work) {
            $this->employee->employee_voluntary_works()->save(new EmployeeVoluntaryWork($voluntary_work));
        }
        foreach ($this->employeeService->getEmployeeTrainingPrograms($request) as $training_program) {
            $this->employee->employee_training_programs()->save(new EmployeeTrainingProgram($training_program));
        }
        foreach ($this->employeeService->getEmployeeSkill($request) as $skill) {
            $this->employee->employee_skills()->save(new EmployeeSkill($skill));
        }
        foreach ($this->employeeService->getEmployeeNonAcademic($request) as $non_academic) {
            $this->employee->employee_non_academics()->save(new EmployeeNonAcademic($non_academic));
        }
        foreach ($this->employeeService->getEmployeeOrganization($request) as $organization) {
            $this->employee->employee_organizations()->save(new EmployeeOrganization($organization));
        }

        flash()->success('You have successfully filled up your personal data sheet.');
        return redirect()->to('/employee/' . $this->employee->user->username);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(PDSFormRequest $request, User $user)
    {
        $employee = $user->employee;
        $this->employee = $employee;

        if ($request->user()->cannot('update', $employee)) {
            flash()->error('You are now allowed to update this profile.');
            return redirect()->back();
        }

        if ($request->validateEmployee($request->all())->fails()) {
            return redirect()->back()->withErrors($request)->withInput();
        }

        $this->employeeService->setEmployee($employee);
        $this->employee->update($this->employeeService->getEmployee($request));

        foreach ($this->employeeService->getEmployeeAddress($request) as $address) {
            $employee_address = EmployeeAddress::find($address['employee_address_id']);
            $employee_address->update($address);
        }

        $spouse = $this->employeeService->getEmployeeSpouse($request);
        if (!$request->validateSpouse($spouse)->fails()) {
            if (null === $this->employee->employee_spouse) {
                $this->employee->employee_spouse()->save(new EmployeeSpouse($spouse));
            } else {
                $this->employee->employee_spouse->update($spouse);
            }
        }

        $this->saveModelData(new EmployeeChild, 'employee_child', $this->employeeService->getEmployeeChildren($request));

        foreach ($this->employeeService->getEmployeeParents($request) as $parent) {
            $employee_parent = EmployeeParent::find($parent['employee_parent_id']);
            if ($employee_parent) {
                $employee_parent->update($parent);
            }
        }

        $this->saveModelData(new EmployeeEducation, 'employee_educations', $this->employeeService->getEmployeeEducation($request));
        $this->saveModelData(new EmployeeCivilService, 'employee_civil_services', $this->employeeService->getEmployeeCivilService($request));
        $this->saveModelData(new EmployeeWorkExperience, 'employee_work_experiences', $this->employeeService->getEmployeeWorkExperience($request));
        $this->saveModelData(new EmployeeVoluntaryWork, 'employee_voluntary_works', $this->employeeService->getEmployeeVoluntaryWork($request));
        $this->saveModelData(new EmployeeTrainingProgram, 'employee_training_programs', $this->employeeService->getEmployeeTrainingPrograms($request));
        $this->saveModelData(new EmployeeSkill, 'employee_skills', $this->employeeService->getEmployeeSkill($request));
        $this->saveModelData(new EmployeeNonAcademic, 'employee_non_academics', $this->employeeService->getEmployeeNonAcademic($request));
        $this->saveModelData(new EmployeeOrganization, 'employee_organizations', $this->employeeService->getEmployeeOrganization($request));

        // $this->dispatch(new WritePersonalDataSheet($this->employee));

        flash()->success('PDS Successfully updated!');

        return redirect()->to('/employee/' . $this->employee->user->username);
    }

    public function summary(Request $request)
    {
        $users = User::has('employee')->orderBy('username')->get();
        if ($users->isEmpty()) {
            flash()->error('Employee is empty.');
            return redirect()->back();
        }
        write_form(new \DNSCHumanResource\FormWriters\WriteEmployeeSummary($users));
    }

    protected function saveModelData($model, $relation, $datas)
    {
        $this->employee->$relation()->delete();
        if ($datas) {
            foreach ($datas as $data) {
                $this->employee->$relation()->create($data);
            }
        }
        return true;
    }
}
