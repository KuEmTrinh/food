<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

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
            'sex' => request()->sex,
        ]);
    }

    public function resetPassword(Request $request)
    {
        $user_id = Auth::user()->id;
        $user = User::find($user_id);
        if (Hash::check(request()->current_password, $user->password)) {
            if (request()->new_password != null) {
                $user->password = Hash::make(request()->new_password);
            }
            $user->email = request()->email;
            $user->name = request()->name;
            $message = "登録できました！";
        } else {
            $message = "現在パスワード正しくない!";
            $user->message = $message;
            return $user;
        }
        $user->save();
        $user->message = $message;
        return $user;
    }

    public function getAllUser()
    {
        $users = User::get()->all();
        return $users;
    }

    public function resetUser()
    {
        $user_id = request()->id;
        $user = User::find($user_id);
        $new_password = request()->new_password;
        if ($new_password != "") {
            $user->password = Hash::make($new_password);
        }
        $user->email = request()->email;
        $user->name = request()->name;
        $user->save();
        $user->message = "登録できました！";
        return $user;
    }
}
