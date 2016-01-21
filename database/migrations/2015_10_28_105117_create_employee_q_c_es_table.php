<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeQCEsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_q_c_es', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employee_id')->unsigned()->unique();
            $table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade')->onCascade('cascade');
            $table->double('instruction', 5, 2);
            $table->double('self', 5, 2);
            $table->double('supervisor', 5, 2);
            $table->double('peers', 5, 2);
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
        Schema::drop('employee_q_c_es');
    }
}
