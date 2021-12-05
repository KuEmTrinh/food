<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Http\Controllers\Controller;


class HomeController extends Controller
{
    use RegistersUsers;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }



    public function newUser()
    {
        // $user = new User();
        // $user->name = request()->name;
        // $user->email = request()->email;
        // $user->username = request()->number;
        // $user->password = request()->password;
        // $user->save();
        // return $user;

        return User::create([
            'name' => request()->name,
            'email' => request()->email,
            'username' => request()->number,
            'password' => Hash::make(request()->password),
            'sex' => 2,
        ]);
    }
}
