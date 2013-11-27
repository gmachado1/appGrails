package br.com.aplicacao.sanduiche

class EnderecoEntrega extends Enderecos{
	static belongsTo= [entrega:Entregas]
	
    static constraints = {
		
    }
}
