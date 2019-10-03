<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'title'
    ];

    public function parent(){
        return $this->hasOne(Category::class,'parent_id','id');
    }

    public function items(){
        return $this->hasMany(Item::class,'category_id','id');
    }
}
