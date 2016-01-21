<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Http\Requests\PersonalDataSheetRequest;
use DNSCHumanResource\HumanResource\Services\EmployeeService;
use DNSCHumanResource\Jobs\WritePersonalDataSheet;
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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

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
        $this->employeeService    = $employeeService;
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
            $this->dispatch(new WritePersonalDataSheet($employee));
            return response()->download('files/PersonalDataSheets/' . $employee->file);
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
        $institutes  = Department::institute()->get();
        $positions   = Position::all();
        return view('employee.index')->with(compact('departments', 'institutes', 'positions'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show(Request $request, User $user)
    {
        $employee = $this->employeeRepository->forUser($user)->with('personnel_performance', 'employee_qce')->first();

        if ($request->user()->can('show', $employee)) {
            $rating = $employee->personnel_performance;
            $qce    = $employee->employee_qce;
            return view('employee.' . config('hris.profile-design'))->with(compact('user', 'employee', 'rating', 'qce'));
        }
        flash()->error('The requested profile is not available!');
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(PersonalDataSheetRequest $request)
    {
        // Persist the employee data to employee table and assign it to employee property
        $this->employee = auth()->user()->employee()->create($request->employee);

        // Create employee address
        foreach ($request->employee_address as $address) {
            $this->employee->employee_address()->create($address);
        }

        // Create employee spouse
        $this->employee->employee_spouse()->create($request->employee_spouse);

        // Store employee children
        foreach (hris_array_map($request->employee_child) as $child) {
            $this->employee->employee_child()->create($child);
        }

        foreach ($request->employee_parents as $parent) {
            $this->employee->employee_parents()->create($parent);
        }

        foreach (hris_array_map($request->employee_educations) as $education) {
            $this->employee->employee_educations()->create($education);
        }

        foreach (hris_array_map($request->employee_civil_services) as $civil_service) {
            $this->employee->employee_civil_services()->create($civil_service);
        }

        foreach (hris_array_map($request->employee_work_experiences) as $work_experience) {
            $this->employee->employee_work_experiences()->create($work_experience);
        }

        foreach (hris_array_map($request->employee_voluntary_works) as $voluntary_work) {
            $this->employee->employee_voluntary_works()->create($voluntary_work);
        }

        foreach (hris_array_map($request->trainings) as $training) {
            $this->employee->trainings()->create($training);
        }

        foreach (hris_array_map($request->employee_skills) as $skill) {
            $this->employee->employee_skills()->create($skill);
        }

        foreach (hris_array_map($request->employee_non_academics) as $non_academic) {
            $this->employee->employee_non_academics()->create($non_academic);
        }

        foreach (hris_array_map($request->employee_organizations) as $organization) {
            $this->employee->employee_organizations()->create($organization);
        }

        flash('You have successfully filled up your Personal Data Sheet!');
        return redirect('/employee/' . $this->employee->user->username);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(PDSFormRequest $request, User $user)
    {
        $employee       = $user->employee;
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
        if (!auth()->user()->isAdmin()) {
            return redirect()->to('/employee/' . $this->employee->user->username);
        }
        return redirect()->to('/employee/' . $this->employee->user->username);
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
