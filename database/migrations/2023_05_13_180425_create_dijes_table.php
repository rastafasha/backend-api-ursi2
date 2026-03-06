<?php

use App\Models\Dijes;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDijesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dijes', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->nullable();
            $table->string('model')->nullable();
            $table->text('description')->nullable();
            $table->string('price')->nullable();
            $table->string('image')->nullable();
            $table->enum('status', [Dijes::PUBLISHED, Dijes::PENDING, Dijes::REJECTED])->default(Dijes::PENDING);
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
        Schema::dropIfExists('dijes');
    }
}
