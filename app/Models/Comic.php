<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Comic extends Model
{
    
    use HasFactory;
    /**
    * fillable
    *
    * @var array
    */
    protected $fillable = [
        'nama',
        'pengarang',
        'penerbit',
        'penejemah',
        'gambar'
    ];
}
