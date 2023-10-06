<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookCategoryRequest;
use App\Http\Requests\UpdateBookCategoryRequest;
use App\Http\Resources\Admin\BookCategoryResource;
use App\Models\BookCategory;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookCategoryApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('book_category_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookCategoryResource(BookCategory::advancedFilter());
    }

    public function store(StoreBookCategoryRequest $request)
    {
        $bookCategory = BookCategory::create($request->validated());

        return (new BookCategoryResource($bookCategory))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function create()
    {
        abort_if(Gate::denies('book_category_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'meta' => [],
        ]);
    }

    public function show(BookCategory $bookCategory)
    {
        abort_if(Gate::denies('book_category_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookCategoryResource($bookCategory);
    }

    public function update(UpdateBookCategoryRequest $request, BookCategory $bookCategory)
    {
        $bookCategory->update($request->validated());

        return (new BookCategoryResource($bookCategory))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function edit(BookCategory $bookCategory)
    {
        abort_if(Gate::denies('book_category_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'data' => new BookCategoryResource($bookCategory),
            'meta' => [],
        ]);
    }

    public function destroy(BookCategory $bookCategory)
    {
        abort_if(Gate::denies('book_category_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bookCategory->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
