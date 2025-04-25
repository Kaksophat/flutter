<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string("image_logo");
            $table->string("image_favicon");
            $table->text("about_us");
            $table->string("image_about_us");
            $table->string("phone");
            $table->string("email");
            $table->string("address");
            $table->string("map");
            $table->string("facebook");
            $table->string("instagram");
            $table->string("twitter");
            $table->string("youtube");


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
