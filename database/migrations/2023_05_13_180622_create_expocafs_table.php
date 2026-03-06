<?php

use App\Models\Expocaf;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExpocafsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('expocafs', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable();
            $table->enum('status', [Expocaf::PUBLISHED, Expocaf::PENDING, Expocaf::REJECTED])->default(Expocaf::PENDING);
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
        Schema::dropIfExists('expocafs');
    }
}
