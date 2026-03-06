<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pulseras extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'model',
        'description',
        'price',
        'image',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';
}
