<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username', 32)->unique();
            $table->string('email')->unique()->nullable();
            $table->string('password', 60);
            $table->enum('type', ['user', 'admin', 'president']);
            $table->enum('status', ['active', 'resigned', 'retired'])->nullable()->default('active');
            $table->datetime('last_login')->nullable();
            $table->datetime('last_logout')->nullable();
            $table->string('ip_address')->nullable();
            $table->rememberToken();
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
        Schema::drop('users');
    }
}
