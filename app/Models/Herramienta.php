<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Herramienta extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'title_eng',
        'subtitle',
        'subtitle_eng',
        'description',
        'description_eng',
        'avatar',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';
}
