<?php

use App\Models\Pulseras;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePulserasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pulseras', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->nullable();
            $table->string('model')->nullable();
            $table->text('description')->nullable();
            $table->string('price')->nullable();
            $table->string('image')->nullable();
            $table->enum('status', [Pulseras::PUBLISHED, Pulseras::PENDING, Pulseras::REJECTED])->default(Pulseras::PENDING);
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
        Schema::dropIfExists('pulseras');
    }
}
