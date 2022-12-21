<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('login', 'Api\AuthController@login');
Route::post('register', 'Api\AuthController@register');
Route::get('/emailVerification', 'Api\AuthController@verify')->name('verification.verify');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'Api\AuthController@login');
Route::post('register', 'Api\AuthController@register');
Route::put('user', 'Api\AuthController@index');
Route::put('user/{id}', 'Api\AuthController@update');
Route::get('logout', 'Api\AuthController@logout');


// Route::apiResource('/user',
// App\Http\Controllers\AuthController::class);

// Auth::routes(['verify' => true]);

 Route::apiResource('/novel',
 \NovelController::class);

 Route::apiResource('/comics',
 \ComicController::class);

 Route::apiResource('/majalah',
 \MajalaController::class);


