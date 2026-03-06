<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCronologiacursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cronologiacursos', function (Blueprint $table) {
            $table->id();
            $table->string('modo');
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->string('clases')->nullable();
            $table->string('proyecto')->nullable();
            $table->string('duracion')->nullable();
            $table->string('costo')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cronologiacursos');
    }
}
