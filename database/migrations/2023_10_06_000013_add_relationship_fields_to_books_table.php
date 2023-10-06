<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRelationshipFieldsToBooksTable extends Migration
{
    public function up()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->unsignedBigInteger('book_type_id')->nullable();
            $table->foreign('book_type_id', 'book_type_fk_9080276')->references('id')->on('book_types');
        });
    }
}
