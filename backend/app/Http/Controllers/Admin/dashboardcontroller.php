<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\customer;
use App\Models\orderitems;
use App\Models\orders;
use Illuminate\Http\Request;

class dashboardcontroller extends Controller
{
    public function count()
    {
        $customerCount = customer::count();
        $order = orders::count();
        $totalSales = orders::sum('grand_total');
        $product = OrderItems::distinct('product_id')->count('product_id');
        $orderget = orders::Orderby('id','desc')->limit(5)->get();
    
        return response()->json([
            "status" => 200,
            "customers" => $customerCount,
            "orders" => $order,
            "sales" => $totalSales,
            "products" => $product,

            "order" => $orderget

        ]);
    }
}
