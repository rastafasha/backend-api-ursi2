<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    use HasFactory;
     /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [
        'name',
        'name_eng',
        'description',
        'description_eng',
        'adicional',
        'adicional_eng',
        'price',
        'modal',
        'slug',
        'user_id',
        'urlVideo',
        'avatar',
        'isFeatured',
        'status',
    ];


    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }

     /*
    |--------------------------------------------------------------------------
    | search
    |--------------------------------------------------------------------------
    */

    public static function search($query = ''){
        if(!$query){
            return self::all();
        }
        return self::where('name', 'like', "%$query%")
        ->orWhere('name_eng', 'like', "%$query%")
        ->orWhere('price', 'like', "%$query%")
        ->get();
    }


}
