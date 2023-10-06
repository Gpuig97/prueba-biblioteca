<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookLocation extends Model
{
    use HasAdvancedFilter, SoftDeletes, HasFactory;

    public $table = 'book_locations';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $orderable = [
        'id',
        'book.name',
        'location.address',
        'quantity',
    ];

    protected $filterable = [
        'id',
        'book.name',
        'location.address',
        'quantity',
    ];

    protected $fillable = [
        'book_id',
        'location_id',
        'quantity',
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
}
