<?php

namespace App\Http\Requests;

use App\Models\BookLocation;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreBookLocationRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('book_location_create');
    }

    public function rules()
    {
        return [
            'book_id' => [
                'integer',
                'exists:books,id',
                'required',
            ],
            'location_id' => [
                'integer',
                'exists:locations,id',
                'required',
            ],
            'quantity' => [
                'integer',
                'min:0',
                'max:2147483647',
                'required',
            ],
        ];
    }
}
