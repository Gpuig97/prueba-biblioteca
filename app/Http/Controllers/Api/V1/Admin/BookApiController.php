<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookRequest;
use App\Http\Requests\UpdateBookRequest;
use App\Http\Resources\Admin\BookResource;
use App\Models\Book;
use App\Models\BookCategory;
use App\Models\BookType;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('book_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookResource(Book::with(['bookType', 'bookCategory'])->advancedFilter());
    }

    public function getCustomBooks(Request $request)
    {
        //abort_if(Gate::denies('book_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $query = Book::with(['bookType', 'bookCategory']);

        // Filter per book_type
        if ($request->has('book_type')) {
            $query->where('book_type_id', $request->input('book_type'));
        }

        // Filter per book_category
        if ($request->has('book_category')) {
            $categoryId = $request->input('book_category');
    
            // Usamos whereHas para filtrar los libros que tienen la categoría deseada
            $query->whereHas('bookCategory', function ($subquery) use ($categoryId) {
                $subquery->where('book_categories.id', $categoryId);
            });
        }

        // Filter per name
        if ($request->has('name')) {
            $query->where('name', 'LIKE', '%' . $request->input('name') . '%');
        }

        // Ordenar por release_date y name
        $query->orderBy('release_date');
        $query->orderBy('name');

        // Paginación
        $perPage = $request->input('per_page', 10); // 10 es el valor por defecto
        $books = $query->paginate($perPage);

        return $books;
    }


    public function store(StoreBookRequest $request)
    {
        $book = Book::create($request->validated());
        $book->bookCategory()->sync($request->input('book_category.*.id', []));

        return (new BookResource($book))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function create()
    {
        abort_if(Gate::denies('book_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'meta' => [
                'book_type'     => BookType::get(['id', 'name']),
                'book_category' => BookCategory::get(['id', 'name']),
            ],
        ]);
    }

    public function show(Book $book)
    {
        abort_if(Gate::denies('book_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookResource($book->load(['bookType', 'bookCategory']));
    }

    public function update(UpdateBookRequest $request, Book $book)
    {
        $book->update($request->validated());
        $book->bookCategory()->sync($request->input('book_category.*.id', []));

        return (new BookResource($book))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function edit(Book $book)
    {
        abort_if(Gate::denies('book_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'data' => new BookResource($book->load(['bookType', 'bookCategory'])),
            'meta' => [
                'book_type'     => BookType::get(['id', 'name']),
                'book_category' => BookCategory::get(['id', 'name']),
            ],
        ]);
    }

    public function destroy(Book $book)
    {
        abort_if(Gate::denies('book_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $book->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
