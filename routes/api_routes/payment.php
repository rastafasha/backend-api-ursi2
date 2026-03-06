<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminPaymentController;
use App\Http\Controllers\Admin\AdminPaymentSoftDeletesController;

//pagos
Route::get('/pagos', [AdminPaymentController::class, 'index'])
    ->name('payments.index');

Route::post('/payment/store', [AdminPaymentController::class, 'paymentStore'])
    ->name('payment.store');

Route::get('/payment/show/{payment:id}', [AdminPaymentController::class, 'paymentShow'])
    ->name('payment.show');

    Route::get('/payment/user/{user:id}', [AdminPaymentController::class, 'paymentShowUser'])
    ->name('payment.paymentShowUser');

Route::put('/payment/update/{id}', [AdminPaymentController::class, 'paymentUpdate'])
    ->name('payment.update');

Route::delete('/payment/destroy/{payment:id}', [AdminPaymentController::class, 'paymentDestroy'])
    ->name('payment.destroy');

Route::get('payment/recientes/', [AdminPaymentController::class, 'recientes'])
    ->name('users.recientes');

Route::post('/payment/upload', [AdminPaymentController::class, 'upload'])
    ->name('payment.upload');

Route::delete('/payment/delete-foto/{id}', [AdminPaymentController::class, 'deleteFotoPayment'])
    ->name('payment.deleteFotoPayment');

Route::get('/payment/search', [AdminPaymentController::class, 'search'])
    ->name('payment.search');



