<?php
use App\Models\Service;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->string('model')->nullable();
            $table->text('description')->nullable();
            $table->string('price')->nullable();
            $table->string('avatar')->nullable();
            $table->string('videoUrl')->nullable();
            $table->enum('status', [Service::PUBLISHED, Service::PENDING, Service::REJECTED])->default(Service::PENDING);
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
        Schema::dropIfExists('services');
    }
}
