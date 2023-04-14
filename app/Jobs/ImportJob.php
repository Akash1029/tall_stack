<?php

namespace App\Jobs;

use App\Imports\HarvestManagerImport;
use App\Models\HarvestManager;
use Illuminate\Bus\Batchable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Maatwebsite\Excel\Facades\Excel;

class ImportJob implements ShouldQueue
{
    use Batchable, Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $uploadFile;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($uploadFile)
    {
        $this->uploadFile = $uploadFile;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // Excel::import(new HarvestManagerImport, $this->uploadFile);
        HarvestManager::create([
            'field_number' => $this->uploadFile['field_number'],
            'harvest_order' => $this->uploadFile['harvest_order'],
            'harvesters_used' => $this->uploadFile['harvesters_used'],
            'pattern' => $this->uploadFile['pattern'],
            'location' => $this->uploadFile['location'],
            'stewarded' => $this->uploadFile['stewarded'],
            'split_field' => $this->uploadFile['split_field'],
            'latitude' => $this->uploadFile['latitude'],
            'longitude' => $this->uploadFile['longitude'],
            'Acres' => $this->uploadFile['acres'],
            'estimated_loads' => $this->uploadFile['estimated_loads'],
            'harvested_loads' => $this->uploadFile['harvested_loads'],
            'agronomist' => $this->uploadFile['agronomist'],
            'area_supervisor' => $this->uploadFile['area_supervisor'],
            'farm_name' => $this->uploadFile['farm_name'],
            'harvest_started' => $this->uploadFile['harvest_started'],
            'harvest_complete' => $this->uploadFile['harvest_complete'],
            'harvest_notes' => $this->uploadFile['harvest_notes'],
            'current_field_name' => $this->uploadFile['harvest_notes'],
            'hyperlink' => $this->uploadFile['hyperlink'],
            'google_link' => $this->uploadFile['google_link'],
        ]);
    }
}
