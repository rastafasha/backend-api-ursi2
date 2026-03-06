<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ServiceController;


Route::get('/services', [ServiceController::class, 'index'])
    ->name('service.index');

Route::post('/service/store', [ServiceController::class, 'serviceStore'])
    ->name('service.store');

Route::get('/service/show/{service}', [ServiceController::class, 'serviceShow'])
    ->name('service.show');

Route::post('/service/update/{service}', [ServiceController::class, 'serviceUpdate'])
    ->name('service.update');

Route::delete('/service/destroy/{service}', [ServiceController::class, 'destroy'])
    ->name('service.destroy');

Route::put('/service/update/status/{service:id}', [ServiceController::class, 'serviceUpdateStatus'])
    ->name('service.status');

