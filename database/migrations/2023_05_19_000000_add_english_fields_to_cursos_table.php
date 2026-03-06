<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEnglishFieldsToCursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cursos', function (Blueprint $table) {
            $table->string('name_eng')->nullable()->after('name');
            $table->text('description_eng')->nullable()->after('description');
            $table->text('adicional_eng')->nullable()->after('adicional');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cursos', function (Blueprint $table) {
            $table->dropColumn('name_eng');
            $table->dropColumn('description_eng');
            $table->dropColumn('adicional_eng');
        });
    }
}

