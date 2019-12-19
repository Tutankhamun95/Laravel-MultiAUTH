<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            'name'=>'SuperAdmin',
            'slug'=>'superadmin',
            
        ]);

        DB::table('roles')->insert([
            'name'=>'SchoolAdmin',
            'slug'=>'schooladmin',
            
        ]);

        DB::table('roles')->insert([
            'name'=>'Student',
            'slug'=>'student',
            
        ]);
    }
}
