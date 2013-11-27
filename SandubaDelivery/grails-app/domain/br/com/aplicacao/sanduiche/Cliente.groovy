package br.com.aplicacao.sanduiche

class Cliente extends Pessoas{
	
	static hasMany = [entregas:Entregas]
	String email
	
    static constraints = {
		email nullable:false
    }
}