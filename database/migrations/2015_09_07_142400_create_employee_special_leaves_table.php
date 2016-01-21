<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeSpecialLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_special_leaves', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employee_id')->unsigned();
            $table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
            $table->enum('type', ['personal milestone', 'filial obligation', 'personal transaction', 'parental obligation', 'domestic emergencies', 'calamity']);
            $table->integer('number_of_days')->unsigned();
            $table->date('date_from');
            $table->date('date_to');
            $table->enum('status', ['filed', 'accepted', 'not accepted', 'disapproved', 'pending', 'rejected', 'approved'])->default('filed');
            $table->enum('number', ['1', '2', '3'])->nullable();
            $table->string('remarks')->nullable();

            $table->integer('processing_personnel')->unsigned()->nullable();
            $table->foreign('processing_personnel')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::drop('employee_special_leaves');
    }
}
