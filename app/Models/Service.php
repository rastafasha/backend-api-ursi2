<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'title_eng',
        'subtitle',
        'subtitle_eng',
        'model',
        'description',
        'description_eng',
        'price',
        'videoUrl',
        'avatar',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';


}
