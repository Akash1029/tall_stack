<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HarvestManager;
use Illuminate\Http\Request;

class HarvestManagerController extends Controller
{
    public function index()
    {
        return view('harvest');
    }
}
