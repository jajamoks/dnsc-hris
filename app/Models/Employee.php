<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{

    use Notificationable;

    protected $fillable = [
        'cs_id',
        'surname',
        'first_name',
        'middle_name',
        'name_extension',
        'birthday',
        'birthplace',
        'sex',
        'civil_status',
        'citizenship',
        'height',
        'weight',
        'blood_type',
        'gsis_id',
        'pagibig_id',
        'philhealth',
        'sss_id',
        'cellphone_number',
        'agency_employee_number',
        'tin',
        'photo',
        'community_tax_cert_no',
        'community_tax_issued_at',
        'community_tax_issued_on',
    ];

    protected $appends = ['full_name'];

    protected $notification = ['url' => '/employee/', 'findBy' => 'username', 'relation' => 'user'];

    // protected $with = ['user'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($employee) {
            $employee->leave_credit()->save(new EmployeeLeaveCredit);
            $employee->accumulated_leave()->save(new EmployeeAccumulatedLeave);
            $employee->notifications()->create([
                'sent_to' => getAdmin()->id,
                'sent_by' => $employee->user->id,
                'subject' => 'Personal Data Sheet',
                'message' => trans('notification.employee-created', ['name' => $employee->fullName()]),
                'icon' => 'user',
                'color' => 'purple',
            ]);
        });

        static::updated(function ($employee) {
            $employee->notifications()->create([
                'sent_to' => getAdmin()->id,
                'sent_by' => $employee->user->id,
                'subject' => 'Personal Data Sheet',
                'message' => trans('notification.employee-updated', ['name' => $employee->fullName()]),
                'icon' => 'user',
                'color' => 'purple',
            ]);
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function department()
    {
        return $this->user->department;
    }

    public function employee_address()
    {
        return $this->hasMany(EmployeeAddress::class);
    }

    public function employee_child()
    {
        return $this->hasMany(EmployeeChild::class);
    }

    public function employee_civil_services()
    {
        return $this->hasMany(EmployeeCivilService::class);
    }

    public function employee_educations()
    {
        return $this->hasMany(EmployeeEducation::class);
    }

    public function employee_non_academics()
    {
        return $this->hasMany(EmployeeNonAcademic::class);
    }

    public function employee_organizations()
    {
        return $this->hasMany(EmployeeOrganization::class);
    }

    public function employee_parents()
    {
        return $this->hasMany(EmployeeParent::class);
    }

    public function employee_reference()
    {
        return $this->hasMany(EmployeeReference::class);
    }

    public function employee_skills()
    {
        return $this->hasMany(EmployeeSkill::class);
    }

    public function employee_spouse()
    {
        return $this->hasOne(EmployeeSpouse::class);
    }

    public function employee_training_programs()
    {
        return $this->hasMany(EmployeeTrainingProgram::class);
    }

    public function employee_voluntary_works()
    {
        return $this->hasMany(EmployeeVoluntaryWork::class);
    }

    public function employee_work_experiences()
    {
        return $this->hasMany(EmployeeWorkExperience::class)->orderBy('date_from', 'desc');
    }

    public function employee_leaves()
    {
        return $this->hasMany(EmployeeLeave::class);
    }

    public function employee_special_leaves()
    {
        return $this->hasMany(EmployeeSpecialLeave::class);
    }

    public function employee_qce()
    {
        return $this->hasOne(EmployeeQCE::class);
    }

    public function approval_heirarchy()
    {
        return $this->hasOne(EmployeeApprovalHeirarchy::class);
    }

    public function utility()
    {
        return $this->hasOne(EmployeeUtility::class);
    }

    public function trainings()
    {
        return $this->belongsToMany(Training::class, 'training_participants', 'employee_id', 'training_id')->withPivot('include_in_pds');
    }

    public function training_participants()
    {
        return $this->hasMany(TrainingParticipant::class);
    }

    public function travel_orders()
    {
        return $this->hasMany(TravelOrder::class);
    }

    public function leave_credit()
    {
        return $this->hasOne(EmployeeLeaveCredit::class);
    }

    public function accumulated_leave()
    {
        return $this->hasOne(EmployeeAccumulatedLeave::class);
    }

    public function personnel_performance()
    {
        return $this->hasOne(EmployeePersonnelPerformance::class);
    }

    public function personnel_leave_card()
    {
        return $this->hasMany(EmployeePersonnelLeaveCard::class);
    }

    public function todos()
    {
        return $this->hasMany(Todo::class);
    }

    public function regular_leave_recommending_approvals()
    {
        return $this->hasMany(EmployeeLeave::class, 'recommending_approval_id')->where('status', 'filed');
    }

    public function regular_leave_approved_by()
    {
        return $this->hasMany(EmployeeLeave::class, 'approved_by_id')->where('status', 'recommended');
    }

    public function special_leave_recommending_approvals()
    {
        return $this->hasMany(EmployeeSpecialLeave::class, 'recommending_approval_id')->where('status', 'filed');
    }

    public function special_leave_approved_by()
    {
        return $this->hasMany(EmployeeSpecialLeave::class, 'approved_by_id')->where('status', 'recommended');
    }

    public function travel_order_recommending_approvals()
    {
        return $this->hasMany(TravelOrder::class, 'recommending_approval_id')->where('status', 'filed');
    }

    public function travel_order_financed_by()
    {
        return $this->hasMany(TravelOrder::class, 'finance_director_id')->where('status', 'recommended');
    }

    public function travel_order_approved_by()
    {
        return $this->hasMany(TravelOrder::class, 'approved_by_id')->where('status', 'approved');
    }

    public function canApproveRegularLeave()
    {
        return !$this->regular_leave_recommending_approvals->isEmpty() or !$this->regular_leave_approved_by->isEmpty() or $this->user->isAdmin();
    }

    public function canApproveSpecialLeave()
    {
        return !$this->special_leave_recommending_approvals->isEmpty() or !$this->special_leave_approved_by->isEmpty() or $this->user->isAdmin();
    }

    public function canApproveTravelOrder()
    {
        return !$this->travel_order_recommending_approvals->isEmpty() or !$this->travel_order_approved_by->isEmpty() or !$this->travel_order_financed_by->isEmpty();
    }

    public function salaryGrade()
    {
        return $this->employee_work_experiences->last();
    }

    public function noPhoto()
    {
        return $this->photo == null;
    }

    public function isMale()
    {
        if (isset($this->sex)) {
            return $this->sex == 'male';
        }
        return $this->sex == 'male';
    }

    public function isFemale()
    {
        if (isset($this->sex)) {
            return $this->sex == 'female';
        }
        return false;
    }

    public function isStatus($status)
    {
        return $status == $this->civil_status;
    }

    public function fullName()
    {
        return $this->first_name . ' ' . $this->middle_name . ' ' . $this->surname;
    }

    public function getUsernameAttribute()
    {
        return (String) $this->user->username;
    }

    public function getFullNameAttribute()
    {
        return (String) $this->fullName();
    }

    public function withSickLeaveCredit()
    {

    }

    public function withVacationLeaveCredit()
    {

    }

}
