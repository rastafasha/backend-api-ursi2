<?php
use App\Models\Anillo;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnillosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anillos', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->nullable();
            $table->string('model')->nullable();
            $table->text('description')->nullable();
            $table->string('price')->nullable();
            $table->string('image')->nullable();
            $table->enum('status', [Anillo::PUBLISHED, Anillo::PENDING, Anillo::REJECTED])->default(Anillo::PENDING);
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
        Schema::dropIfExists('anillos');
    }
}
