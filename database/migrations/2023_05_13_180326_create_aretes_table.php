<?php

use App\Models\Aretes;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAretesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('aretes', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->nullable();
            $table->string('model')->nullable();
            $table->text('description')->nullable();
            $table->string('price')->nullable();
            $table->string('image')->nullable();
            $table->enum('status', [Aretes::PUBLISHED, Aretes::PENDING, Aretes::REJECTED])->default(Aretes::PENDING);
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
        Schema::dropIfExists('aretes');
    }
}
