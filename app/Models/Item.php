<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $fillable = [
        'title',
        'content',
        'category_id'
    ];

    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }
}
