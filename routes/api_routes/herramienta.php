<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HerramientaController;


Route::get('/herramientas', [HerramientaController::class, 'index'])
    ->name('herramienta.index');

Route::post('/herramienta/store', [HerramientaController::class, 'HerramientaStore'])
    ->name('herramienta.HerramientaStore');

Route::get('/herramienta/show/{herramienta}', [HerramientaController::class, 'show'])
    ->name('herramienta.show');


Route::post('/herramienta/update/{herramienta}', [HerramientaController::class, 'update'])
    ->name('herramienta.update');

Route::delete('/herramienta/destroy/{herramienta}', [HerramientaController::class, 'destroy'])
    ->name('herramienta.destroy');

Route::put('/herramienta/update/status/{herramienta:id}', [HerramientaController::class, 'updateStatus'])
    ->name('herramienta.status');

