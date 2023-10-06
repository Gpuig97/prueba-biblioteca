<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookBookCategoryPivotTable extends Migration
{
    public function up()
    {
        Schema::create('book_book_category', function (Blueprint $table) {
            $table->unsignedBigInteger('book_id');
            $table->foreign('book_id', 'book_id_fk_9080277')->references('id')->on('books')->onDelete('cascade');
            $table->unsignedBigInteger('book_category_id');
            $table->foreign('book_category_id', 'book_category_id_fk_9080277')->references('id')->on('book_categories')->onDelete('cascade');
        });
    }
}
