<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookLocationsTable extends Migration
{
    public function up()
    {
        Schema::create('book_locations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('quantity');
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
