<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Anillo extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'model',
        'description',
        'price',
        'avatar',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

}
