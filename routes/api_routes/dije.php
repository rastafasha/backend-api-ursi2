<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DijeController;


Route::get('/dijes', [DijeController::class, 'index'])
    ->name('dije.index');

Route::post('/dije/store', [DijeController::class, 'store'])
    ->name('dije.store');

Route::get('/dije/show/{dije}', [DijeController::class, 'show'])
    ->name('dije.show');


Route::post('/dije/update/{dije}', [DijeController::class, 'update'])
    ->name('dije.update');

Route::delete('/dije/destroy/{dije}', [DijeController::class, 'destroy'])
    ->name('dije.destroy');

Route::put('/dije/update/status/{dije:id}', [DijeController::class, 'updateStatus'])
    ->name('dije.status');
