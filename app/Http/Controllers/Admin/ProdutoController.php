<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Experiencia;

class ProdutoController extends Controller
{
    public function index()
    {
        $produtos = Experiencia::all();
        return view('admin.produto.index', compact('produtos'));
    }

    public function adicionar()
    {
        return view('admin.produto.adicionar');
    }

    public function editar($id)
    {
        $registro = Experiencia::find($id);
        if( empty($registro->id) ) {
            return redirect()->route('admin.produtos');
        }
        return view('admin.produto.editar', compact('registro'));
    }

    public function salvar(Request $req)
    {
        $dados = $req->all();

        Experiencia::create($dados);

        $req->session()->flash('admin-mensagem-sucesso', 'Produto cadastrado com sucesso!');

        return redirect()->route('admin.produtos');
    }

    public function atualizar(Request $req, $id)
    {
        $dados = $req->all();

        Experiencia::find($id)->update($dados);

        $req->session()->flash('admin-mensagem-sucesso', 'Produto atualizado com sucesso!');

        return redirect()->route('admin.produtos');
    }

    public function deletar($id)
    {

        Experiencia::find($id)->delete();

        $req->session()->flash('admin-mensagem-sucesso', 'Produto deletado com sucesso!');

        return redirect()->route('admin.produtos');
    }
}
