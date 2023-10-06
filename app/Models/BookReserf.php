<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookReserf extends Model
{
    use HasAdvancedFilter, SoftDeletes, HasFactory;

    public $table = 'book_reserves';

    protected $dates = [
        'date_from',
        'date_to',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $orderable = [
        'id',
        'book.name',
        'location.address',
        'date_from',
        'date_to',
        'quantity',
        'user.name',
    ];

    protected $filterable = [
        'id',
        'book.name',
        'location.address',
        'date_from',
        'date_to',
        'quantity',
        'user.name',
    ];

    protected $fillable = [
        'book_id',
        'location_id',
        'date_from',
        'date_to',
        'quantity',
        'user_id',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function getDateFromAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d', $value)->format(config('project.date_format')) : null;
    }

    public function setDateFromAttribute($value)
    {
        $this->attributes['date_from'] = $value ? Carbon::createFromFormat(config('project.date_format'), $value)->format('Y-m-d') : null;
    }

    public function getDateToAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d', $value)->format(config('project.date_format')) : null;
    }

    public function setDateToAttribute($value)
    {
        $this->attributes['date_to'] = $value ? Carbon::createFromFormat(config('project.date_format'), $value)->format('Y-m-d') : null;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
