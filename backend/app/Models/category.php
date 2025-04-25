<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class category extends Model
{
    use HasFactory;
    public function brands()
    {
        return $this->belongsToMany(Brand::class, 'brand_category');
    }
}
