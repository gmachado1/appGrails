package br.com.aplicacao.sanduiche

class Produtos {
	String nome
	BigDecimal preco
	String descricao
	
    static constraints = {
		nome blank:false
		preco min:0 as BigDecimal
		descricao size:5..200
    }
}