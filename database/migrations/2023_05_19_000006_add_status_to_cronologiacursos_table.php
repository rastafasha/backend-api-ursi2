<?php

use App\Models\Cronologiacurso;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddStatusToCronologiacursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cronologiacursos', function (Blueprint $table) {
            $table->enum('status', [Cronologiacurso::PUBLISHED, Cronologiacurso::PENDING, Cronologiacurso::REJECTED])->default(Cronologiacurso::PENDING)->after('image');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cronologiacursos', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
}

