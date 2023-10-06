<?php

Route::group(['prefix' => 'v1', 'as' => 'api.', 'namespace' => 'Api\V1\Admin', 'middleware' => ['auth:sanctum']], function () {
    // Abilities
    Route::apiResource('abilities', 'AbilitiesController', ['only' => ['index']]);

    // Locales
    Route::get('locales/languages', 'LocalesController@languages')->name('locales.languages');
    Route::get('locales/messages', 'LocalesController@messages')->name('locales.messages');

    // Permissions
    Route::resource('permissions', 'PermissionsApiController');

    // Roles
    Route::resource('roles', 'RolesApiController');

    // Users
    Route::resource('users', 'UsersApiController');

    // Book Type
    Route::resource('book-types', 'BookTypeApiController');

    // Book Category
    Route::resource('book-categories', 'BookCategoryApiController');

    // Book
    Route::resource('books', 'BookApiController');

    //Book Filters //Ejercicio 4
    Route::get('books-filters', 'BookApiController@getCustomBooks');

    //Book Filters //Ejercicio 7
    Route::get('biblioteca/disponibilidad/{localidad}/libro/{nombre}', 'BookLocationApiController@getBooksAvailables');

    // Location
    Route::resource('locations', 'LocationApiController');

    // Book Location
    Route::resource('book-locations', 'BookLocationApiController');

    // Book Reserve
    Route::resource('book-reserves', 'BookReserveApiController');
});

//Ejercicio 4
Route::get('books-filters', 'App\Http\Controllers\Api\V1\Admin\BookApiController@getCustomBooks');

//Ejercicio 7
Route::get('biblioteca/disponibilidad/{localidad}/libro/{nombre}', 'App\Http\Controllers\Api\V1\Admin\BookLocationApiController@getBooksAvailables');

