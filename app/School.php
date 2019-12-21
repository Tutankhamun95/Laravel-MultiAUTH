<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    public function projects(){
        return $this->belongsToMany('App\Project')->withTimestamps();
    }

    public function users()
    {

        return $this->hasMany('App\User');

    }
}
