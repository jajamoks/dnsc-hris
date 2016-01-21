<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->string('cs_id', 32)->unique()->nullable();
            $table->string('first_name', 45);
            $table->string('middle_name', 45)->nullable();
            $table->string('surname', 45);
            $table->string('name_extension', 10)->nullable();
            $table->date('birthday');
            $table->string('birthplace')->nullable();
            $table->enum('sex', ['male', 'female']);
            $table->string('civil_status', 45);
            $table->string('citizenship', 45);
            $table->double('height', 4, 2)->nullable();
            $table->double('weight', 4, 2)->nullable();
            $table->string('blood_type', 2)->nullable();
            $table->string('gsis_id', 45)->unique()->nullable();
            $table->string('pagibig_id', 45)->unique()->nullable();
            $table->string('philhealth', 45)->unique()->nullable();
            $table->string('sss_id', 45)->unique()->nullable();
            $table->string('cellphone_number', 15)->nullable();
            $table->string('agency_employee_number', 45)->unique()->nullable();
            $table->string('tin', 45)->unique()->nullable();
            $table->string('photo')->nullable();
            $table->string('file')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('employees');
    }
}
