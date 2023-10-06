<?php

namespace App\Http\Requests;

use App\Models\Book;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class UpdateBookRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('book_edit');
    }

    public function rules()
    {
        return [
            'name' => [
                'string',
                'required',
            ],
            'release_date' => [
                'date_format:' . config('project.date_format'),
                'required',
            ],
            'book_type_id' => [
                'integer',
                'exists:book_types,id',
                'required',
            ],
            'book_category' => [
                'required',
                'array',
            ],
            'book_category.*.id' => [
                'integer',
                'exists:book_categories,id',
            ],
        ];
    }
}
