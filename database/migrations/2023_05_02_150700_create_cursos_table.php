<?php
use App\Models\Curso;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cursos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('name');
            $table->string('price');
            $table->text('description')->nullable();
            $table->text('adicional')->nullable();
            $table->string('modal');
            $table->string('slug');
            $table->boolean('isFeatured');
            $table->string('image')->nullable();
            $table->string('urlVideo')->nullable();
            $table->enum('status', [Curso::PUBLISHED, Curso::PENDING, Curso::REJECTED])->default(Curso::PENDING);
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
        Schema::dropIfExists('cursos');
    }
}
