<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
   echo "welcome to User Role Assigning Application ";
});

$app->post('/auth/login', 'Auth\AuthController@postLogin');


$app->group(['prefix' => 'api/v1','middleware'=>'auth'], function($app)
{
    $app->get('allUsers','UserRole\UserRoleController@index');
    $app->post('create/user','UserRole\UserRoleController@createUser');
    $app->post('update/user/{userid}','UserRole\UserRoleController@updateUser');
});