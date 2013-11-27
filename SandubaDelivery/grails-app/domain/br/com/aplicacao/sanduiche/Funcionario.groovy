package br.com.aplicacao.sanduiche

import br.com.aplicacao.sanduiche.Pessoas;

class Funcionario extends Pessoas{
	
	Date contratado
	Date demitido
	String placaMoto
	String carteira
	int numeroMultas
	Double salario
	TipoFucionarioEnum tipoFuncionario

    static constraints = {
		contratado blank:false
		salario min:678.00D
		placaMoto nullable:true, blank:true
		demitido nullable:true, blank:true
		numeroMultas min:0
		tipoFuncionario nullable:false, blank:false
    }
}