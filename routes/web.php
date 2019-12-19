<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('home');

Auth::routes();



Route::group(['as'=>'superadmin.','prefix'=>'superadmin','namespace'=>'SuperAdmin','middleware'=>['auth','superadmin']], function 
(){
    Route::get('dashboard','DashboardController@index')->name('dashboard');
    Route::resource('school', 'SchoolController');
    Route::resource('user', 'UserController');
});

Route::group(['as'=>'schooladmin.','prefix'=>'schooladmin','namespace'=>'SchoolAdmin','middleware'=>['auth','schooladmin']], function 
(){
    Route::get('dashboard','DashboardController@index')->name('dashboard');
});

Route::group(['as'=>'student.','prefix'=>'student','namespace'=>'Student','middleware'=>['auth','student']], function 
(){
    Route::get('dashboard','DashboardController@index')->name('dashboard');
});