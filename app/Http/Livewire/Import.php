<?php

namespace App\Http\Livewire;

use App\Imports\HarvestManagerImport;
use App\Jobs\ImportJob;
use App\Models\HarvestManager;
use Livewire\Component;
use Livewire\WithFileUploads;
use Illuminate\Support\Facades\Bus;
use Maatwebsite\Excel\Facades\Excel;

class Import extends Component
{
    use WithFileUploads;

    /**
     * Trying something for progress bar.
     */
    public $file;
    public $progress = null;
    public $totalRows = 0;
    public $importedRows = 0;
    public $uploaded = 0;
    public $batch = null;
    public $isFileImporting = false;

    public function import()
    {
        $this->validate([
            'file' => 'required|mimes:xls,xlsx|max:1024',
        ]);

        $this->isFileImporting = true;

        $rows = Excel::toArray(new HarvestManagerImport(), $this->file);
        // dd($rows);
        $this->totalRows = count($rows[0]);
        HarvestManager::truncate();
        $jobs = [];
        foreach ($rows[0] as $row) {
            // Insert each row to the database
            $jobs[] = new ImportJob($row);

            // $this->importedRows++;
            // $this->progress = ($this->importedRows / $this->totalRows) * 100;
        }

        $this->batch = Bus::batch($jobs)->dispatch()->toArray();

        $this->uploaded++;

    }

    public function getImportBatchProperty()
    {
        if (!$this->batch) {
            return null;
        }
        // Bus::

        return Bus::findBatch($this->batch['id'])->toArray();
    }

    public function checkImportProgress()
    {
        $this->progress = $this->importBatch;
        // dd($this->progress);
        if ($this->progress && $this->progress['finishedAt']) {
            $this->isFileImporting = false;
            $this->progress = null;
        }
    }


    public function render()
    {
        return view('livewire.import', [
            "harvest_managers" => HarvestManager::paginate(30)
        ]);
    }
}
