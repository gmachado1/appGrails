package br.com.aplicacao.sanduiche

import java.util.Date;
import java.util.Formatter.DateTime;

class Entregas {

	static hasMany = [pedidos:Pedidos]

	static hasOne = [endereco:EnderecoEntrega]
	Funcionario funcionario
	boolean isEntregaResidencia = false
	Cliente cliente
	EstadoEntregaEnum situacaoEntrega
	Date dtEntrega
	Date dtSolicitacao
	double total = 0


	static constraints = {
		funcionario nullable:false
		dtEntrega nullable:true
		dtSolicitacao nullable:true
		cliente nullable:true
		situacaoEntrega nullable:false
		isEntregaResidencia blank:false, nullable:false
	}

	double getTotal(){
		total=0
		if(this.pedidos!=null){
			for (ped in this.pedidos){
				total = total+ped.getTotal()
			}
		}
		return total
	}
}