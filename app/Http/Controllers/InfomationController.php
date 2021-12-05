<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Image;
use App\Infomation;
use App\Star;
use Illuminate\Http\Request;
use Illuminate\Mail\Message;
use Illuminate\Support\Facades\Auth;

class InfomationController extends Controller
{
    public function createInfo()
    {
        $info = new Infomation();
        $user_id = Auth::user()->id;
        $info->user_id = $user_id;
        $info->name = request()->name;
        $info->img_count = 0;
        $info->delivery = request()->delivery;
        $info->address = request()->address;
        $info->number = request()->number;
        $info->genre = json_encode(request()->genre);
        $info->open = request()->open;
        $info->close = request()->close;
        $info->min_money = request()->min_money;
        $info->max_money = request()->max_money;
        $info->url = request()->url;
        $info->save();
        $info->message = "新規登録できました！";
        return $info;
    }

    public function changeInfo()
    {
        $id = request()->id;
        $info = Infomation::find($id);
        $info->name = request()->name;
        $info->delivery = request()->delivery;
        $info->address = request()->address;
        $info->number = request()->number;
        $info->genre = json_encode(request()->genre);
        $info->open = request()->open;
        $info->close = request()->close;
        $info->min_money = request()->min_money;
        $info->max_money = request()->max_money;
        $info->url = request()->url;
        $info->save();
        $info->message = "変更できました！";
        return $info;
    }

    public function getInfo()
    {
        $user_id = Auth::user()->id;
        $info = Infomation::where('user_id', $user_id)->get();
        return $info;
    }

    public function getAll()
    {
        $infos = Infomation::get()->all();
        foreach ($infos as $info) {
            $info_id = $info->id;
            $images = Image::where('info_id', $info_id)->get();
            $info->images = $images;
            $stars = Star::where('info_id', $info_id)->get();
            $count = 0;
            $sum = 0;
            foreach ($stars as $star) {
                $sum += $star->star;
                $count++;
            }
            if ($count != 0) {
                $info->point = ($sum / $count);
                $info->count = $count;
            } else {
                $info->point = 0;
                $info->count = 0;
            }
            $comments = Comment::where('info_id', $info_id)->get()->all();
            $info->comment_count = count($comments);
        }
        return $infos;
    }

    public function getUserInfo()
    {
        $user = Auth::user();
        return $user;
    }

    public function saveImage(Request $request)
    {
        $image = new Image();
        $image->name = $request->img_name;
        $image->info_id = $request->info_id;
        $pathTofile = $request->file('image')->store('food', 'public');
        $image->url = $pathTofile;
        $image->save();
        return $image;
    }

    public function getImages($info_id)
    {
        $images = Image::where('info_id', $info_id)->get();
        return $images;
    }

    public function deleteInfo($id)
    {
        $info = Infomation::find($id);
        $info->delete();

        $info->message = "削除しました！";
        return $info;
    }

    // public function getInfoById($info_id)
    // {
    //     $info = Infomation::where('info_id', $info_id)->get();
    // }
}
