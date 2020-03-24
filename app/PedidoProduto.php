<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PedidoProduto extends Model
{
    protected $fillable = [
        'pedido_id',
        'produto_id',
        'status',
        'preco'
    ];
    
    public function produto()
    {
        return $this->belongsTo('App\Experiencia', 'produto_id', 'id');
    }
}
