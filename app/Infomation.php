<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Infomation extends Model
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'image_count', 'name', 'delivery', 'address', 'number', 'open', 'close', 'min_money', 'max_money', 'url',
    ];
}
