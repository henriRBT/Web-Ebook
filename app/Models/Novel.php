<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Novel extends Model
{
   
    use HasFactory;
    /**
    * fillable
    *
    * @var array
    */
    protected $fillable = [
        'judul_novel',
        'penulis_novel',
        'penerbit_novel',
        'tahun',
        'gambar'
    ];
}
