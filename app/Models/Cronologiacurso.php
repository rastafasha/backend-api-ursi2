<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cronologiacurso extends Model
{
    use HasFactory;

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [
        'modo',
        'modo_eng',
        'title',
        'title_eng',
        'description',
        'description_eng',
        'fecha',
        'fecha_eng',
        'hora',
        'hora_eng',
        'clases',
        'clases_eng',
        'proyecto',
        'proyecto_eng',
        'duracion',
        'duracion_eng',
        'costo',
        'avatar',
        'status',
    ];

     /*
    |--------------------------------------------------------------------------
    | search
    |--------------------------------------------------------------------------
    */
    public static function search($query = ''){
        if(!$query){
            return self::all();
        }
        return self::where('title', 'like', "%$query%")
        ->orWhere('title_eng', 'like', "%$query%")
        ->orWhere('description_eng', 'like', "%$query%")
        ->orWhere('fecha', 'like', "%$query%")
        ->orWhere('modo', 'like', "%$query%")
        ->orWhere('fecha_eng', 'like', "%$query%")
        ->orWhere('modo_eng', 'like', "%$query%")
        ->orWhere('costo', 'like', "%$query%")
        ->get();
    }

}
