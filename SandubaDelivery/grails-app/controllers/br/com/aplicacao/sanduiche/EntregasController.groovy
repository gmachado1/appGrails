package br.com.aplicacao.sanduiche

import org.springframework.dao.DataIntegrityViolationException

class EntregasController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[entregasInstanceList: Entregas.list(params), entregasInstanceTotal: Entregas.count()]
	}

	def create() {
		[entregasInstance: new Entregas(params)]
	}
	def save() {
		
		def entregasInstance = new Entregas(params)
		def enderecoEntrega = new EnderecoEntrega()
		def clienteInstace = new Cliente()
		def funcionarioInstace = Funcionario.get(params.funcionario.id)
		println "PARAMETROS "+params
		println "params.cliente?.id "+params.cliente?.id 
		if(params.cliente?.id == null && entregasInstance.isEntregaResidencia){
			println "Informações não coerentes. Entrega sem destino!"
			flash.message = "Informações não coerentes. Entrega sem destino!"
			redirect(action: "create", model: [entregasInstance: entregasInstance])
			return
		}else if(entregasInstance.isEntregaResidencia){
			clienteInstace = Cliente.get(params.cliente.id)
			println "cliente é a"+clienteInstace.properties
			def enderecoResidencia = EnderecoResidencia.get(clienteInstace.endereco.id)
			enderecoEntrega.cidade = enderecoResidencia.cidade   
			enderecoEntrega.estado= enderecoResidencia.estado 
			enderecoEntrega.bairro= enderecoResidencia.bairro 
			enderecoEntrega.rua= enderecoResidencia.rua 
			enderecoEntrega.complemento= enderecoResidencia.complemento 
			enderecoEntrega.referencia= enderecoResidencia.referencia 
			enderecoEntrega.cep= enderecoResidencia.cep 
			enderecoEntrega.latitude =enderecoResidencia.latitude  
			enderecoEntrega.longitude =enderecoResidencia.longitude  
			enderecoEntrega.entrega = entregasInstance
			entregasInstance.cliente = clienteInstace
			//TODO lembrar de setar com usuario
		}else{
			enderecoEntrega.properties = params
		}
		entregasInstance.endereco = enderecoEntrega
		entregasInstance.funcionario = funcionarioInstace
		
		println "Endereco de entrega"+enderecoEntrega.properties
		println "cliente"+clienteInstace.properties
		println "Funcionario"+funcionarioInstace.properties
		println "Entrega"+entregasInstance.properties
		
		if (!entregasInstance.save(flush: true)) {
			redirect(action: "update", model: [entregasInstance: entregasInstance])
			return
		}

		flash.message = "Entrega habilitada para solicitalção de pedido"
	
		redirect(action: "edit", id: entregasInstance.id)
	}

	def show(Long id) {
		def entregasInstance = Entregas.get(id)
		if (!entregasInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "list")
			return
		}

		[entregasInstance: entregasInstance]
	}

	def edit(Long id) {
		def entregasInstance = Entregas.get(id)
		if (!entregasInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "list")
			return
		}

		[entregasInstance: entregasInstance]
	}

	def update(Long id, Long version) {
		def entregasInstance = Entregas.get(id)
		if (!entregasInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (entregasInstance.version > version) {
				entregasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'entregas.label', default: 'Entregas')] as Object[],
						"Another user has updated this Entregas while you were editing")
				render(view: "edit", model: [entregasInstance: entregasInstance])
				return
			}
		}

		entregasInstance.properties = params

		if (!entregasInstance.save(flush: true)) {
			render(view: "edit", model: [entregasInstance: entregasInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'entregas.label', default: 'Entregas'),
			entregasInstance.id
		])
		redirect(action: "show", id: entregasInstance.id)
	}

	def delete(Long id) {
		def entregasInstance = Entregas.get(id)
		if (!entregasInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			entregasInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'entregas.label', default: 'Entregas'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
