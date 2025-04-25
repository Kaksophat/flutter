<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'status'];
    public function categories()
    {
        return $this->belongsToMany(category::class, 'brand_category');
    }
}
