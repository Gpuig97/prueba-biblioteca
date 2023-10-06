<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookReserfRequest;
use App\Http\Requests\UpdateBookReserfRequest;
use App\Http\Resources\Admin\BookReserfResource;
use App\Models\Book;
use App\Models\BookReserf;
use App\Models\Location;
use App\Models\User;
use Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BookReserveApiController extends Controller
{
    public function index()
    {
        abort_if(Gate::denies('book_reserf_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $isAdmin = auth()->user()->roles()->where('id', 1)->exists();

        $bookReserves = BookReserf::with(['book', 'location', 'user'])
        ->when(!$isAdmin, function ($query) {
            $query->where('user_id', auth()->user()->id);
        })
        ->advancedFilter();

        return new BookReserfResource($bookReserves);
    }

    public function store(StoreBookReserfRequest $request)
    {
        $bookReserf = BookReserf::create($request->validated());

        return (new BookReserfResource($bookReserf))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function create()
    {
        abort_if(Gate::denies('book_reserf_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $isAdmin = auth()->user()->roles()->where('id', 1)->exists();

        $users = User::get(['id', 'name']);

        if(!$isAdmin){
            $users = User::where('id',auth()->user()->id)->get(['id', 'name']);
        }


        return response([
            'meta' => [
                'book'     => Book::get(['id', 'name']),
                'location' => Location::get(['id', 'name']),
                'user'     => $users,
            ],
        ]);
    }

    public function show(BookReserf $bookReserf)
    {
        abort_if(Gate::denies('book_reserf_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new BookReserfResource($bookReserf->load(['book', 'location', 'user']));
    }

    public function update(UpdateBookReserfRequest $request, BookReserf $bookReserf)
    {
        $bookReserf->update($request->validated());

        return (new BookReserfResource($bookReserf))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function edit(BookReserf $bookReserf)
    {
        abort_if(Gate::denies('book_reserf_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $isAdmin = auth()->user()->roles()->where('id', 1)->exists();

        $users = User::get(['id', 'name']);

        if(!$isAdmin){
            $users = User::where('id',auth()->user()->id)->get(['id', 'name']);
        }

        return response([
            'data' => new BookReserfResource($bookReserf->load(['book', 'location', 'user'])),
            'meta' => [
                'book'     => Book::get(['id', 'name']),
                'location' => Location::get(['id', 'name']),
                'user'     => $users,
            ],
        ]);
    }

    public function destroy(BookReserf $bookReserf)
    {
        abort_if(Gate::denies('book_reserf_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $bookReserf->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
