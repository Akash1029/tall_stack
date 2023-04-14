<?php

namespace App\Imports;

use App\Jobs\ImportJob;
use App\Models\HarvestManager;
use Illuminate\Support\Facades\Bus;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class HarvestManagerImport implements ToModel, WithHeadingRow, WithChunkReading
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new HarvestManager([
            'field_number' => $row['field_number'],
            'harvest_order' => $row['harvest_order'],
            'harvesters_used' => $row['harvesters_used'],
            'pattern' => $row['pattern'],
            'location' => $row['location'],
            'stewarded' => $row['stewarded'],
            'split_field' => $row['split_field'],
            'latitude' => $row['latitude'],
            'longitude' => $row['longitude'],
            'Acres' => $row['acres'],
            'estimated_loads' => $row['estimated_loads'],
            'harvested_loads' => $row['harvested_loads'],
            'agronomist' => $row['agronomist'],
            'area_supervisor' => $row['area_supervisor'],
            'farm_name' => $row['farm_name'],
            'harvest_started' => $row['harvest_started'],
            'harvest_complete' => $row['harvest_complete'],
            'harvest_notes' => $row['harvest_notes'],
            'current_field_name' => $row['harvest_notes'],
            'hyperlink' => $row['hyperlink'],
            'google_link' => $row['google_link'],
        ]);

    }

    public function chunkSize(): int
    {
        return 5000;
    }
}
