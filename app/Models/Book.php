<?php

namespace App\Models;

use App\Support\HasAdvancedFilter;
use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use HasAdvancedFilter, SoftDeletes, HasFactory;

    public $table = 'books';

    protected $orderable = [
        'id',
        'name',
        'release_date',
        'book_type.name',
    ];

    protected $dates = [
        'release_date',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $filterable = [
        'id',
        'name',
        'release_date',
        'book_type.name',
        'book_category.name',
    ];

    protected $fillable = [
        'name',
        'release_date',
        'book_type_id',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function getReleaseDateAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d', $value)->format(config('project.date_format')) : null;
    }

    public function setReleaseDateAttribute($value)
    {
        $this->attributes['release_date'] = $value ? Carbon::createFromFormat(config('project.date_format'), $value)->format('Y-m-d') : null;
    }

    public function bookType()
    {
        return $this->belongsTo(BookType::class);
    }

    public function bookCategory()
    {
        return $this->belongsToMany(BookCategory::class);
    }
}
