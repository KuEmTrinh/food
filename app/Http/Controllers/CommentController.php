<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function createComment()
    {
        $user_id = Auth::user()->id;
        $name = Auth::user()->name;

        $comment = new Comment();
        $comment->info_id = request()->info_id;
        $comment->user_id = $user_id;
        $comment->name = $name;
        $comment->desc = request()->desc;
        $comment->save();
        $comment->message = "新コメント追加しました！";
        return $comment;
    }

    public function getComments($id)
    {
        $comments = Comment::where('info_id', $id)->get()->all();
        return $comments;
    }
}
