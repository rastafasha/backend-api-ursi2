<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AnilloController;


Route::get('/anillos', [AnilloController::class, 'index'])
    ->name('anillo.index');

Route::post('/anillo/store', [AnilloController::class, 'store'])
    ->name('anillo.store');

Route::get('/anillo/show/{anillo}', [AnilloController::class, 'show'])
    ->name('anillo.show');


Route::post('/anillo/update/{anillo}', [AnilloController::class, 'update'])
    ->name('anillo.update');

Route::delete('/anillo/destroy/{anillo}', [AnilloController::class, 'destroy'])
    ->name('anillo.destroy');

Route::put('/anillo/update/status/{anillo:id}', [AnilloController::class, 'updateStatus'])
    ->name('anillo.status');
