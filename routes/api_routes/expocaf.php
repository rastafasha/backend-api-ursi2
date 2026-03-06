<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExpocafController;


Route::get('/expocafs', [ExpocafController::class, 'index'])
    ->name('expocaf.index');

Route::post('/expocaf/store', [ExpocafController::class, 'store'])
    ->name('expocaf.store');

Route::get('/expocaf/show/{expocaf}', [ExpocafController::class, 'show'])
    ->name('expocaf.show');


Route::post('/expocaf/update/{expocaf}', [ExpocafController::class, 'update'])
    ->name('expocaf.update');

Route::delete('/expocaf/destroy/{expocaf}', [ExpocafController::class, 'destroy'])
    ->name('expocaf.destroy');

Route::put('/expocaf/update/status/{expocaf:id}', [ExpocafController::class, 'updateStatus'])
    ->name('expocaf.status');

