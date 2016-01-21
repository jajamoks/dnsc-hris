<?php

namespace DNSCHumanResource\Http\Requests;

use DNSCHumanResource\Http\Requests\Request;

class PersonalDataSheetRequest extends Request
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
            'employee.first_name'             => 'required',
            'employee.surname'                => 'required',
            'employee.birthday'               => 'required',
            'employee.sex'                    => 'required',
            'employee.civil_status'           => 'required',
            'employee.citizenship'            => 'required',
            'employee_address.*.address'      => 'required',
            'employee_address.*.zip_code'     => 'required',
            'employee_address.*.address_type' => 'required',
            'employee_spouse.first_name'      => 'required_with:employee_spouse.last_name',
            'employee_spouse.last_name'       => 'required_with:employee_spouse.first_name',
            'employee_child.*.name'           => 'required_with:employee_child.*.birthday',
            'employee_child.*.birthday'       => 'required_with:employee_child.*.name',
            'employee_parents.*.relationship' => 'required',
            'employee_parents.*.first_name'   => 'required',
            'employee_parents.*.last_name'    => 'required',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'employee.first_name.required'             => 'We need to know your first name',
            'employee.surname.required'                => 'Please provide your last name',
            'employee.birthday.required'               => 'When is your birthday? You missed it while filling up.',
            'employee.sex.required'                    => 'We need to determine your gender. Please fill it up.',
            'employee.civil_status.required'           => 'It seems you missed your civil status',
            'employee.citizenship.required'            => 'We need your citizenship, kindly input it.',
            'employee_address.*.address.required'      => 'Please provide your address',
            'employee_address.*.zip_code.required'     => 'Please provide your zip code',
            'employee_spouse.first_name.required_with' => 'Spouse first name is required with its last name',
            'employee_spouse.last_name.required_with'  => 'Spouse last name is required with its first name',
        ];
    }
}
