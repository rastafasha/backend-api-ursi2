<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JoyaController;


Route::get('/joyas', [JoyaController::class, 'index'])
    ->name('joya.index');

Route::post('/joya/store', [JoyaController::class, 'store'])
    ->name('joya.store');

Route::get('/joya/show/{joya}', [JoyaController::class, 'show'])
    ->name('joya.show');


Route::post('/joya/update/{joya}', [JoyaController::class, 'update'])
    ->name('joya.update');

Route::delete('/joya/destroy/{joya}', [JoyaController::class, 'destroy'])
    ->name('joya.destroy');

Route::put('/joya/update/status/{joya:id}', [JoyaController::class, 'updateStatus'])
    ->name('joya.status');
