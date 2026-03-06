<?php

use App\Models\Cronologiacurso;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEnglishFieldsToCronologiacursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cronologiacursos', function (Blueprint $table) {
            $table->string('modo_eng')->nullable()->after('modo');
            $table->string('title_eng')->nullable()->after('title');
            $table->text('description_eng')->nullable()->after('description');
            $table->string('fecha_eng')->nullable()->after('fecha');
            $table->string('hora_eng')->nullable()->after('hora');
            $table->string('clases_eng')->nullable()->after('clases');
            $table->string('proyecto_eng')->nullable()->after('proyecto');
            $table->string('duracion_eng')->nullable()->after('duracion');
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
            $table->dropColumn('modo_eng');
            $table->dropColumn('title_eng');
            $table->dropColumn('description_eng');
            $table->dropColumn('fecha_eng');
            $table->dropColumn('hora_eng');
            $table->dropColumn('clases_eng');
            $table->dropColumn('proyecto_eng');
            $table->dropColumn('duracion_eng');
        });
    }
}

