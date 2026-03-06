<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEnglishFieldsToHerramientasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('herramientas', function (Blueprint $table) {
            $table->string('title_eng')->nullable()->after('title');
            $table->string('subtitle_eng')->nullable()->after('subtitle');
            $table->text('description_eng')->nullable()->after('description');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('herramientas', function (Blueprint $table) {
            $table->dropColumn('title_eng');
            $table->dropColumn('subtitle_eng');
            $table->dropColumn('description_eng');
        });
    }
}

