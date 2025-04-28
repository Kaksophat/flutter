<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\product;
use Illuminate\Http\Request;

class UserProduct extends Controller
{
    public function bestSellingProducts()
    {
        $bestSellingProducts = product::select('products.*')
            ->join('orderitems', 'products.id', '=', 'orderitems.product_id')
            ->selectRaw('SUM(orderitems.quantity) as total_sold')
            ->groupBy('products.id')
            ->orderByDesc('total_sold')
            ->take(4) 
            ->get();
    
        return response()->json([
            "status" => 200,
            "best_selling_products" => $bestSellingProducts
        ]);
    }
    public function getproduct(Request $request)
    {
        $products = Product::whereHas('category', function($query) {
            $query->where('status', '!=', 0); 
        })->where('status', '!=', 0)->where("quantity", '!=',0)->wherehas('brand',function($query){
            $query->where('status', '!=',0);
        })->get();
    
        $category = product::with('category')->get();
        $brand = Product::with('brand')->get();
        $products= product::all();

    
        return response()->json([
            "status" => 200,
            "products" => $products  ,
            "category" => $category,
            "brand" => $brand
        ]);
    }

    public function featured (Request $request)
    {
        $products = Product::orderBy('created_at', 'DESC')->limit(4)->get();
    
       

    
        return response()->json([
            "status" => 200,
            "product" => $products  ,
          
        ]);
    }



public function getProductsByCategory(Request $request, $categoryId)
{
   $products = Product::fine($categoryId);

       return response()->json([
           "status" => 200,
           "products" => $products
       ]);
}



    public function flashsale (Request $request)
    {
         $products = Product::orderBy('created_at', 'ASC')->limit(6)->get();




               return response()->json([
                   "status" => 200,
                   "product" => $products  ,

               ]);
    
       

    

    }
}
