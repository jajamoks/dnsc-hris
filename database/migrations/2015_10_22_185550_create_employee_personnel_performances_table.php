<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeePersonnelPerformancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_personnel_performances', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employee_id')->unsigned()->unique();
            $table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
            $table->double('strategic_function', 5, 2);
            $table->double('core_function', 5, 2);
            $table->double('average', 5, 2);
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
        Schema::drop('employee_personnel_performances');
    }
}
