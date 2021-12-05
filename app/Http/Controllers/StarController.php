<?php

namespace App\Http\Controllers;

use App\Star;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StarController extends Controller
{
    public function createStar()
    {
        $user_id = Auth::user()->id;
        $star = new Star();
        $star->info_id = request()->info_id;
        $star->user_id = $user_id;
        $star->star = request()->star;
        $star->save();
        $star->message = "評価しました！";
        return $star;
        // $star = Star::where('info_id', $info_id)->where('user_id', $user_id)->get();
        // if ($star === null) {
        //     $star_new = new Star();
        //     $star_new->info_id = request()->info_id;
        //     $star_new->user_id = $user_id;
        //     $star_new->star = request()->star;
        //     $star_new->save();
        //     $star_new->message = "評価しました！";
        //     return $star_new;
        // } else {
        //     $star->star = request()->star;
        //     $star->save();
        //     $star->message = "評価点入れ替えしました！";
        //     return $star;
        // }
    }

    public function findStar($id)
    {
        $info_id = $id;
        $user_id = Auth::user()->id;
        $star = Star::where('info_id', $info_id)->where('user_id', $user_id)->get();
        return $star;
    }

    public function changeStar()
    {
        $star_id = request()->star_id;
        $user_id = Auth::user()->id;
        $star = Star::find($star_id);
        $star->info_id = request()->info_id;
        $star->user_id = $user_id;
        $star->star = request()->star;
        $star->save();
        $star->message = "評価点入れ替えしました！";
        return $star;
    }
}
