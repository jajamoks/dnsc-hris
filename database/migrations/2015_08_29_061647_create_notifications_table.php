<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNotificationsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('notifications', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('sent_to')->unsigned();
			$table->foreign('sent_to')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');

			$table->integer('sent_by')->unsigned();
			$table->foreign('sent_by')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');

			$table->string('object_id', 25)->nullable();
			$table->string('object_type', 100);

			$table->string('subject', 75);
			$table->string('message');
			$table->tinyInteger('is_read')->default(0);
			$table->string('icon', 25)->nullable();
			$table->string('color', 25)->nullable();

			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::drop('notifications');
	}
}
