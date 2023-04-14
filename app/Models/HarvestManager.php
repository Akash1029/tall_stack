<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HarvestManager extends Model
{
    use HasFactory;

    protected $fillable = [
        'field_number',
        'harvest_order',
        'harvesters_used',
        'pattern',
        'location',
        'stewarded',
        'split_field',
        'latitude',
        'longitude',
        'Acres',
        'estimated_loads',
        'harvested_loads',
        'agronomist',
        'area_supervisor',
        'farm_name',
        'harvest_started',
        'harvest_complete',
        'harvest_notes',
        'current_field_name',
        'hyperlink',
        'google_link',
    ];
}
