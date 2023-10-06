<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookReservesTable extends Migration
{
    public function up()
    {
        Schema::create('book_reserves', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->date('date_from');
            $table->date('date_to');
            $table->integer('quantity');
            $table->timestamps();
            $table->softDeletes();
        });
    }
}
