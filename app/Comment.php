<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Comment extends Model
{
    use Notifiable;
    protected $fillable = [
        'info_id', 'user_id', 'name', 'desc',
    ];
}
