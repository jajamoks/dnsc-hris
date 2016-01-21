<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeeLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_leaves', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employee_id')->unsigned();
            $table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
            $table->integer('working_days_applied');
            $table->date('start_date');
            $table->date('end_date');
            $table->enum('commutation', ['requested', 'not requested']);
            $table->string('leave_type');
            $table->string('additional_info')->nullable();
            $table->enum('status', ['filed', 'disapproved', 'pending', 'rejected', 'approved'])->default('filed');
            $table->string('remarks')->nullable();
            $table->integer('recommending_approval')->unsigned()->nullable();
            $table->foreign('recommending_approval')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
            $table->integer('certified_by')->unsigned()->nullable();
            $table->foreign('certified_by')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::drop('employee_leaves');
    }
}
