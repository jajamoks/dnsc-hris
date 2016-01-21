<?php

namespace DNSCHumanResource\Http\Requests;

use DNSCHumanResource\Http\Requests\Request;
use Validator;

class PDSFormRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [

        ];
    }

    public function validateEmployee($data)
    {
        return Validator::make($data, [
            'employee_photo' => 'image:jpeg,jpg,png|max:1500',
        ]);
    }

    public function validateAddress($data)
    {
        return Validator::make($data, [
            'address' => 'required', 'address_type' => 'required',
        ]);
    }

    public function validateSpouse($data)
    {
        return Validator::make($data, [
            'first_name' => 'required', 'last_name' => 'required',
        ]);
    }

    public function validateParent($data)
    {
        return Validator::make($data, [
            'first_name' => 'required', 'last_name' => 'required', 'relationship' => 'required',
        ]);
    }

    public function validateChild($data)
    {
        return Validator::make($data, [
            'name' => 'required', 'birthday' => 'required',
        ]);
    }

    public function validateEmployeeEducation($data)
    {
        return Validator::make($data, [
            'level'  => 'required',
            'school' => 'required',
        ]);
    }

    public function validateCivilServiceEligibility($data)
    {
        return Validator::make($data, [
            'career_service'    => 'required',
            'rating'            => 'required',
            'examination_place' => 'required',
        ]);
    }

    public function validateWorkExperience($data)
    {
        return Validator::make($data, [
            'date_from'      => 'required',
            'position_title' => 'required',
            'company'        => 'required',
        ]);
    }

    public function validateVoluntaryWork($data)
    {
        return Validator::make($data, [
            'organization_name'    => 'required',
            'organization_address' => 'required',
            'date_from'            => 'required',
            'date_to'              => 'required',
        ]);
    }

    public function validateTrainingProgram($data)
    {
        return Validator::make($data, [
            'title' => 'required',
        ]);
    }

    public function validateSkill($data)
    {
        return Validator::make($data, [
            'skill' => 'required',
        ]);
    }

    public function validateNonAcademic($data)
    {
        return Validator::make($data, [
            'name' => 'required',
        ]);
    }

    public function validateOrganizations($data)
    {
        return Validator::make($data, [
            'name' => 'required',
        ]);
    }
}
