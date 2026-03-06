<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Eventoorlando extends Model
{
    use HasFactory;
    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [
        'firstName',
        'lastName',
        'estado',
        'pais',
        'telefono',
        'movil',
        'email',
        'dondeSeEntero',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
