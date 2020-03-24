<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExperienciasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('experiencias', function (Blueprint $table) {
            $table->increments('id_experiencia');
            $table->string('nome');
            $table->text('descricao');
            $table->decimal('preco', 6, 2)->default(0);
            $table->string('local');
            $table->string('imagem');
            $table->string('fk_categoria');
            $table->enum('ativo', ['S', 'N'])->default('S');
            $table->timestamps();
            $table->foreign('fk_categoria')->references('id_categoria')->on('categoria');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('experiencias');
    }
}
