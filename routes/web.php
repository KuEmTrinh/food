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
    return view('login');
});

Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//infomation
Route::post('create_info', 'InfomationController@createInfo');
Route::post('change_info', 'InfomationController@changeInfo');
Route::get('get_all', 'InfomationController@getAll');
Route::post('save_image', 'InfomationController@saveImage');
Route::get('get_images/{info_id}', 'InfomationController@getImages');
Route::get('get_info_id/{info_id}', 'InfomationController@getInfoById');
Route::get('delete_info/{info_id}', 'InfomationController@deleteInfo');
//user
Route::get('get_info', 'InfomationController@getInfo');
Route::get('get_user_info', 'InfomationController@getUserInfo');


//comment
Route::post('create_comment', 'CommentController@createComment');
Route::get('get_comments/{id}', 'CommentController@getComments');

//star
Route::post('create_star', 'StarController@createStar');
Route::post('change_star', 'StarController@changeStar');
Route::get('find_star/{id}', 'StarController@findStar');

//User
Route::post('new_user', 'HomeController@newUser');
Route::post('reset_password', 'HomeController@resetPassword');
Route::get('get_all_user', 'HomeController@getAllUser');
Route::post('reset_user', 'HomeController@resetUser');

