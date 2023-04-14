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
        Schema::create('harvest_managers', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('field_number')->nullable();
            $table->string('harvest_order')->nullable();
            $table->string('harvesters_used')->nullable();
            $table->string('pattern')->nullable();
            $table->string('location')->nullable();
            $table->string('stewarded')->nullable();
            $table->string('split_field')->nullable();
            $table->double('latitude')->nullable();
            $table->double('longitude')->nullable();
            $table->double('Acres')->nullable();
            $table->string('estimated_loads')->nullable();
            $table->string('harvested_loads')->nullable();
            $table->string('agronomist')->nullable();
            $table->string('area_supervisor')->nullable();
            $table->string('farm_name')->nullable();
            $table->timestamp('harvest_started')->nullable();
            $table->timestamp('harvest_complete')->nullable();
            $table->string('harvest_notes')->nullable();
            $table->string('current_field_name')->nullable();
            $table->string('hyperlink')->nullable();
            $table->string('google_link')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('harvest_managers');
    }
};
