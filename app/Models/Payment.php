<?php

namespace App\Models;

use App\Jobs\PaymentRegisterJob;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Payment extends Model
{
    use HasFactory, SoftDeletes;

    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [

        'referencia',
        'email',
        'name',
        'nombre',
        'monto',
        'user_id',
        'curso_id',
        'status'
    ];

    const APPROVED = 'APPROVED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    protected static function boot(){

        parent::boot();

        static::created(function($user){

            PaymentRegisterJob::dispatch(
                $user
            )->onQueue("high");
        });

    }

    public static function statusTypes()
    {
        return [
            self::APPROVED, self::PENDING, self::REJECTED
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */
    public function users()
    {
        return $this->belongsTo(User::class, 'id');
    }


    public function cursos()
    {
        return $this->hasMany(Curso::class, 'curso_id');
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
        return self::where('referencia', 'like', "%$query%")
        ->orWhere('email', 'like', "%$query%")
        ->orWhere('name', 'like', "%$query%")
        ->orWhere('nombre', 'like', "%$query%")
        ->orWhere('costo', 'like', "%$query%")
        ->get();
    }
}
