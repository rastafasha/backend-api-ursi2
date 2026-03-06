<?php

use App\Models\Joyas;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJoyasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('joyas', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable();
            $table->enum('status', [Joyas::PUBLISHED, Joyas::PENDING, Joyas::REJECTED])->default(Joyas::PENDING);
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
        Schema::dropIfExists('joyas');
    }
}
