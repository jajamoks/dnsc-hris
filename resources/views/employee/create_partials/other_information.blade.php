<div class="row">
    <div class="col-md-4">
        @section('special_skills_panel_content')
            @if ( !isset($employee) or $employee->employee_skills->isEmpty())
                <div id="specialSkillsHobby" class="form-horizontal parent">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="hidden" name="skills_id[]"/>
                            <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                            <input type="text" class="form-control" name="employee_skills_hobby[]" placeholder="New skills..." />
                        </div>
                    </div>
                </div>
            @else
                @foreach ($employee->employee_skills as $skill)
                    <div id="specialSkillsHobby" class="form-horizontal parent">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="hidden" name="skills_id[]" value="{{ $skill->id }}"/>
                                <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                                <input type="text" class="form-control" name="employee_skills_hobby[]" placeholder="New skills..." value="{{ $skill->skill }}"/>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        @endsection

        @include('employee.create_partials.pds-panel', [
            'panel_body_id' => 'skills-panel',
            'clone_element' => 'specialSkillsHobby',
            'title' => 'Skills',
            'as' => 'special_skills'
        ])
    </div>
    <div class="col-md-4">
        @section('non_academic_panel_content')
            @if ( !isset($employee) or $employee->employee_non_academics->isEmpty())
                <div id="nonAcademic" class="form-horizontal parent">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                            <input type="text" class="form-control" name="employee_non_academic[]" placeholder="New non-academic distinction..."/>
                        </div>
                    </div>
                </div>
            @else
                @foreach ($employee->employee_non_academics as $non_academic)
                    <div id="nonAcademic" class="form-horizontal parent">
                        <div class="form-group">
                            <input type="hidden" name="non_academic_id[]" value="{{ $non_academic->id }}"/>
                            <div class="input-group">
                                <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                                <input type="text" class="form-control" name="employee_non_academic[]" placeholder="New non-academic distinction..." value="{{ $non_academic->name }}"/>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        @endsection

        @include('employee.create_partials.pds-panel', [
            'panel_body_id' => 'non-academic-panel',
            'clone_element' => 'nonAcademic',
            'title' => 'Non Academic',
            'as' => 'non_academic'
        ])
    </div>
    <div class="col-md-4">
        @section('organization_panel_content')
            @if ( !isset($employee) or $employee->employee_organizations->isEmpty())
                <div id="membershipInAssociationOrganization" class="form-horizontal parent">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                            <input type="text" class="form-control" name="employee_organization[]" placeholder="New organization..."/>
                        </div>
                    </div>
                </div>
            @else
                @foreach ($employee->employee_organizations as $organization)
                    <div id="membershipInAssociationOrganization" class="form-horizontal parent">
                        <input type="hidden" name="organization_id[]" value="{{ $organization->id }}"/>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon remove"><i class="fa fa-remove"></i></span>
                                <input type="text" class="form-control" name="employee_organization[]" placeholder="New organization..." value="{{ $organization->name }}"/>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        @endsection

        @include('employee.create_partials.pds-panel', [
            'panel_body_id' => 'organization-panel',
            'clone_element' => 'membershipInAssociationOrganization',
            'title' => 'Membership in Association Organization',
            'as' => 'organization'
        ])
    </div>
</div>
