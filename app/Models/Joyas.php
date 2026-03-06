<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Joyas extends Model
{
    use HasFactory;
    protected $fillable = [
        'image',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';
}
