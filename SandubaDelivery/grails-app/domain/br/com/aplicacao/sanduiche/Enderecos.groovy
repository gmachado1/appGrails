package br.com.aplicacao.sanduiche

abstract class Enderecos {
	
	
	
	String cidade
	EstadoEnum estado
	String bairro
	String rua
	String complemento
	String referencia
	String cep
	Float latitude = null
	Float longitude = null
	
	static constraints = {
		cidade blank:true, nullable:true
		estado blank:true, nullable:true
		bairro blank:true, nullable:true
		rua blank:true, nullable:true
		cep blank:true, nullable:true
		latitude blank:true, nullable:true
		longitude blank:true, nullable:true
		/*entrega(nullable: true, validator: {field, inst -> inst.pessoa || field})
		pessoa(nullable: true, validator: {field, inst -> inst.entrega || field})*/
	}
	

}