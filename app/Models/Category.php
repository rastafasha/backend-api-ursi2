<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [

        'name',
        'name_eng'

    ];

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function posts()
    {
        return $this->hasMany(Post::class);
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
        ->get();
    }

}
