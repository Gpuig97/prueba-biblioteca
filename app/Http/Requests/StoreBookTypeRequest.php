<?php

namespace App\Http\Requests;

use App\Models\BookType;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreBookTypeRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('book_type_create');
    }

    public function rules()
    {
        return [
            'name' => [
                'string',
                'required',
            ],
        ];
    }
}
