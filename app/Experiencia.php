<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Experiencia extends Model
{
    protected $fillable = [
        'nome',
        'descricao',
        'imagem',
        'preco',
        'ativo'
    ];
}