<?php

namespace App\Http\Requests;

use App\Models\BookReserf;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;

class StoreBookReserfRequest extends FormRequest
{
    public function authorize()
    {
        return Gate::allows('book_reserf_create');
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
            'date_from' => [
                'date_format:' . config('project.date_format'),
                'required',
            ],
            'date_to' => [
                'date_format:' . config('project.date_format'),
                'required',
            ],
            'quantity' => [
                'integer',
                'min:0',
                'max:2147483647',
                'required',
            ],
            'user_id' => [
                'integer',
                'exists:users,id',
                'required',
            ],
        ];
    }
}
