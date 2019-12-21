<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    public function user(){

        return $this->belongsTo('App\User');
    }

    public function schools(){

        return $this->belongsToMany('App\School')->withTimestamps();

    }

    public function school(){

        return $this->belongsToMany('App\School')->withTimestamps();

    }

    public function users(){
        return $this->belongsToMany('App\User');
    }

    public function members(){
        return $this->belongsToMany('App\Member')->withTimestamps();
    }
}
