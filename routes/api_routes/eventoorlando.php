<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventoorlandoController;


Route::get('/eventoorlandos', [EventoorlandoController::class, 'index'])
    ->name('eventoorlando.index');

Route::post('/eventoorlando/store', [EventoorlandoController::class, 'eventoorlandoStore'])
    ->name('eventoorlando.store');

Route::get('/eventoorlando/show/{eventoorlando}', [EventoorlandoController::class, 'eventoorlandoShow'])
    ->name('eventoorlando.show');


