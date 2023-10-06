<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookLocationRequest;
use App\Http\Requests\UpdateBookLocationRequest;
use App\Http\Resources\Admin\BookLocationResource;
use App\Models\Book;
use App\Models\BookLocation;
use App\Models\Location;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookLocationApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('book_location_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookLocationResource(BookLocation::with(['book', 'location'])->advancedFilter());
    }

    public function getBooksAvailables(Request $request, $localidad, $nombre)
    {
        //abort_if(Gate::denies('book_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $query = BookLocation::with(['book', 'location']);

        if ($localidad) {
            $query->whereHas('location', function ($subquery) use ($localidad) {
                $subquery->where('name', $localidad);
            });
        }

        if ($nombre) {
            $query->whereHas('book', function ($subquery) use ($nombre) {
                $subquery->where('name', 'LIKE', '%' . $nombre . '%');
            });
        }


        // Paginación
        $perPage = $request->input('per_page', 10); // 10 es el valor por defecto
        $booksLocations = $query->paginate($perPage);

        return $booksLocations;
    }

    public function store(StoreBookLocationRequest $request)
    {
        $bookLocation = BookLocation::create($request->validated());

        return (new BookLocationResource($bookLocation))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function create()
    {
        abort_if(Gate::denies('book_location_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'meta' => [
                'book'     => Book::get(['id', 'name']),
                'location' => Location::get(['id', 'name']),
            ],
        ]);
    }

    public function show(BookLocation $bookLocation)
    {
        abort_if(Gate::denies('book_location_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookLocationResource($bookLocation->load(['book', 'location']));
    }

    public function update(UpdateBookLocationRequest $request, BookLocation $bookLocation)
    {
        $bookLocation->update($request->validated());

        return (new BookLocationResource($bookLocation))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function edit(BookLocation $bookLocation)
    {
        abort_if(Gate::denies('book_location_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return response([
            'data' => new BookLocationResource($bookLocation->load(['book', 'location'])),
            'meta' => [
                'book'     => Book::get(['id', 'name']),
                'location' => Location::get(['id', 'name']),
            ],
        ]);
    }

    public function destroy(BookLocation $bookLocation)
    {
        abort_if(Gate::denies('book_location_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bookLocation->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
