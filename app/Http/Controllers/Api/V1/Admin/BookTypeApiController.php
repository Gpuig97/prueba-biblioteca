<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookTypeRequest;
use App\Http\Requests\UpdateBookTypeRequest;
use App\Http\Resources\Admin\BookTypeResource;
use App\Models\BookType;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookTypeApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('book_type_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookTypeResource(BookType::advancedFilter());
    }

    public function store(StoreBookTypeRequest $request)
    {
        $bookType = BookType::create($request->validated());

        return (new BookTypeResource($bookType))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function create()
    {
        abort_if(Gate::denies('book_type_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'meta' => [],
        ]);
    }

    public function show(BookType $bookType)
    {
        abort_if(Gate::denies('book_type_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookTypeResource($bookType);
    }

    public function update(UpdateBookTypeRequest $request, BookType $bookType)
    {
        $bookType->update($request->validated());

        return (new BookTypeResource($bookType))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function edit(BookType $bookType)
    {
        abort_if(Gate::denies('book_type_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'data' => new BookTypeResource($bookType),
            'meta' => [],
        ]);
    }

    public function destroy(BookType $bookType)
    {
        abort_if(Gate::denies('book_type_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bookType->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
