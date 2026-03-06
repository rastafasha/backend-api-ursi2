<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PulseraController;


Route::get('/pulseras', [PulseraController::class, 'index'])
    ->name('pulsera.index');

Route::post('/pulsera/store', [PulseraController::class, 'store'])
    ->name('pulsera.store');

Route::get('/pulsera/show/{pulsera}', [PulseraController::class, 'show'])
    ->name('pulsera.show');


Route::put('/pulsera/update/{pulsera}', [PulseraController::class, 'update'])
    ->name('pulsera.update');

Route::delete('/pulsera/destroy/{pulsera}', [PulseraController::class, 'destroy'])
    ->name('pulsera.destroy');

Route::put('/pulsera/update/status/{pulsera:id}', [PulseraController::class, 'updateStatus'])
    ->name('pulsera.status');

Route::post('/pulsera/upload', [PulseraController::class, 'upload'])
    ->name('pulsera.upload');

Route::delete('/pulsera/delete-foto/{id}', [PulseraController::class, 'deleteFoto'])
    ->name('pulsera.deleteFoto');
