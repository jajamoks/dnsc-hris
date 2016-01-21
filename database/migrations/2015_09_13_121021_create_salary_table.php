<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSalaryTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('salary', function (Blueprint $table) {
			$table->increments('id');
			$table->string('salary_grade', 2)->unique();
			$table->string('step', 2);
			$table->double('salary', 10, 2);
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::drop('salary');
	}
}
