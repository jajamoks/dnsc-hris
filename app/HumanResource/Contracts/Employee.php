<?php namespace DNSCHumanResource\HumanResource\Contracts;

interface Employee
{

    // Get all employees

    public function all();

    // Get a specified employee based on the id given

    public function get($id);

}
