<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\Form;
use DNSCHumanResource\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class FormPolicy
{
    use HandlesAuthorization;

    public function delete(User $user, Form $form)
    {
        if ($user->isAdmin() && !$form->isRestricted()) {
            return true;
        }
        return false;
    }
}
