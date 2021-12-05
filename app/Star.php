<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Star extends Model
{
    use Notifiable;
    protected $fillable = [
        'info_id', 'user_id', 'star',
    ];
}
