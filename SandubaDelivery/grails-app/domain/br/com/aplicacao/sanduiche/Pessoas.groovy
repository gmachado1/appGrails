package br.com.aplicacao.sanduiche

abstract class Pessoas {
	String nome
	String sobrenome
	String celular
	static hasOne = [endereco:EnderecoResidencia]
	
    static constraints = {
		nome blank:false, nullable:false, size:3..30
		sobrenome blank:false, nullable:false, size:3..30
		celular blank:false
		endereco nullable:true
    }
}