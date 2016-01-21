<?php

namespace DNSCHumanResource\Traits;

use DNSCHumanResource\Models\Notification;

trait Notificationable
{

    public function getNotificationLink()
    {
        if ($this->isNotificationRelationSet()) {
            return $this->getNotificationUrl() . $this->{$this->getNotificationRelation()}->{$this->getNotificationFindBy()};
        }
        return $this->getNotificationUrl() . $this->{$this->getNotificationFindBy()};
    }

    public function getNotificationRelation()
    {
        return $this->notification['relation'];
    }

    public function getNotificationUrl()
    {
        return $this->notification['url'];
    }

    public function getNotificationFindBy()
    {
        return $this->notification['findBy'];
    }

    public function isNotificationRelationSet()
    {
        return isset($this->notification['relation']);
    }

    public function notifications()
    {
        return $this->morphMany(Notification::class, 'object');
    }

}
