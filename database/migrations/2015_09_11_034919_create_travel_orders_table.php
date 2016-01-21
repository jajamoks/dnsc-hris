<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTravelOrdersTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('travel_orders', function (Blueprint $table) {
			$table->increments('id');
			$table->string('travel_order_number')->unique()->nullable();
			$table->integer('employee_id')->unsigned();
			$table->foreign('employee_id')->references('id')->on('employees')->onDelete('cascade')->onUpdate('cascade');
			$table->string('recipient');
			$table->string('destination');
			$table->string('purpose');
			$table->date('date_from');
			$table->date('date_to');
			$table->double('expenses', 8, 2);
			$table->enum('status', ['filed', 'not accepted', 'accepted', 'pending', 'disapproved', 'approved', 'rejected'])->default('filed')->nullable();

			$table->integer('finance_director')->unsigned()->nullable();
			$table->foreign('finance_director')->references('id')->on('employees')->onUpdate('cascade')->onDelete('cascade');
			$table->integer('recommending_approval')->unsigned()->nullable();
			$table->foreign('recommending_approval')->references('id')->on('employees')->onUpdate('cascade')->onDelete('cascade');
			$table->integer('approved_by')->unsigned()->nullable();
			$table->foreign('approved_by')->references('id')->on('employees')->onUpdate('cascade')->onDelete('cascade');
			$table->string('file')->nullable();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::drop('travel_orders');
	}
}
