<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
 */

$factory->define(DNSCHumanResource\Models\Form::class, function (Faker\Generator $faker) {
    return [
        'name'        => $faker->name,
        'description' => $faker->email,
        'path'        => str_random(10),
        'type'        => str_random(10),
    ];
});
