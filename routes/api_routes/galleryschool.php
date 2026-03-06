<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GalleryschoolController;


Route::get('/galleryschools', [GalleryschoolController::class, 'index'])
    ->name('galleryschool.index');

Route::post('/galleryschool/store', [GalleryschoolController::class, 'galleryschoolStore'])
    ->name('galleryschool.store');

Route::get('/galleryschool/show/{galleryschool}', [GalleryschoolController::class, 'galleryschoolShow'])
    ->name('galleryschool.show');


Route::put('/galleryschool/update/{galleryschool}', [GalleryschoolController::class, 'galleryschoolUpdate'])
    ->name('galleryschool.update');

Route::delete('/galleryschool/destroy/{galleryschool}', [GalleryschoolController::class, 'destroy'])
    ->name('galleryschool.destroy');

Route::put('/galleryschool/update/status/{galleryschool:id}', [GalleryschoolController::class, 'galleryschoolUpdateStatus'])
    ->name('galleryschool.status');

Route::post('/galleryschool/upload', [GalleryschoolController::class, 'upload'])
    ->name('galleryschool.upload');

Route::delete('/galleryschool/delete-foto/{id}', [GalleryschoolController::class, 'deleteFotoGalleryschool'])
    ->name('galleryschool.deleteFotoGalleryschool');
