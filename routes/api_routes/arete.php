<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AreteController;


Route::get('/aretes', [AreteController::class, 'index'])
    ->name('arete.index');

Route::post('/arete/store', [AreteController::class, 'store'])
    ->name('arete.store');

Route::get('/arete/show/{arete}', [AreteController::class, 'show'])
    ->name('arete.show');


Route::put('/arete/update/{arete}', [AreteController::class, 'update'])
    ->name('arete.update');

Route::delete('/arete/destroy/{arete}', [AreteController::class, 'destroy'])
    ->name('arete.destroy');

Route::put('/arete/update/status/{arete:id}', [AreteController::class, 'updateStatus'])
    ->name('arete.status');

Route::post('/arete/upload', [AreteController::class, 'upload'])
    ->name('arete.upload');

Route::delete('/arete/delete-foto/{id}', [AreteController::class, 'deleteFoto'])
    ->name('arete.deleteFoto');
