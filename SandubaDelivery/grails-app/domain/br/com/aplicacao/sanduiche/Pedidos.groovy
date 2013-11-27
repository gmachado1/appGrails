package br.com.aplicacao.sanduiche

import  br.com.aplicacao.sanduiche.Produtos

class Pedidos {
	
	static belongsTo = [entrega:Entregas]
	Produtos produto
	int quantidade = 0
	String observacao
	double total = 0

	
	static transients = ["total	"] //***
	
    static constraints = {
		quantidade min:1
		produto nullable:false, blank:false
    }
	
	double getTotal() {
		if(produto==null){
			produto = new Produtos(preco:0);
		}
		
		return produto.getPreco() * quantidade
	 }
}
