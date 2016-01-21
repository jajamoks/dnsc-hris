<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTrainingsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('trainings', function (Blueprint $table) {
			$table->increments('id');
			$table->string('title');
			$table->string('description')->nullable();
			$table->string('venue')->nullable();
			$table->date('start');
			$table->date('end');
			$table->integer('number_of_hours');
			$table->string('sponsored_by')->nullable();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::drop('trainings');
	}
}
