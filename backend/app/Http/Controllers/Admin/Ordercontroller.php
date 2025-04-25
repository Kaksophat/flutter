<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\orders;
use Illuminate\Http\Request;

class Ordercontroller extends Controller
{
    public function index (Request $request)
    {
        $order = orders::with('items')->get();
        return response()->json([
            "status" => 200,
            "data" => $order
        ]);
    }

    public function show($id,Request $request)  {
        $order = orders::with("items","items.product")->find($id);
        return response()->json([
            "status" => 200,
            "data" => $order,
            
        ]);
        
    }
}
