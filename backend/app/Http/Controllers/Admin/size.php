<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\size as ModelsSize;
use Illuminate\Http\Request;

class size extends Controller
{
    public function index(Request $request)
    {
        $size = ModelsSize::all();
        return response()->json([
            'status' => 200,
            'size' => $size,
        ]);

    }
}
