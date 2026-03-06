<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CursoController;


Route::get('/cursos', [CursoController::class, 'index'])
    ->name('curso.index');

    Route::get('/cursos/activos', [CursoController::class, 'activos'])
    ->name('curso.activos');

Route::post('/curso/store', [CursoController::class, 'cursoStore'])
    ->name('curso.store');

Route::get('/curso/show/{curso}', [CursoController::class, 'cursoShow'])
    ->name('curso.show');

Route::get('/curso/category/{curso}', [CursoController::class, 'cursoByCategory'])
    ->name('curso.cursoByCategory');

Route::get('/cursos/destacados', [CursoController::class, 'destacados'])
    ->name('curso.destacados');

Route::get('/curso/show/slug/{slug}', [CursoController::class, 'cursoShowSlug'])
    ->name('curso.cursoShowSlug');

Route::put('/curso/update/{curso}', [CursoController::class, 'cursoUpdate'])
    ->name('curso.update');

Route::delete('/curso/destroy/{curso}', [CursoController::class, 'destroy'])
    ->name('curso.destroy');

Route::put('/curso/update/status/{curso:id}', [CursoController::class, 'cursoUpdateStatus'])
    ->name('curso.status');

Route::post('/curso/upload', [CursoController::class, 'upload'])
    ->name('curso.upload');


Route::delete('/curso/delete-foto/{id}', [CursoController::class, 'deleteFotoCurso'])
    ->name('curso.deleteFotoCurso');

Route::get('/curso/search/', [CursoController::class, 'search'])
    ->name('curso.search');
