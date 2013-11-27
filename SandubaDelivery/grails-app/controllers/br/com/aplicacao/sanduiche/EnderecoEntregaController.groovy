package br.com.aplicacao.sanduiche

import org.springframework.dao.DataIntegrityViolationException

class EnderecoEntregaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [enderecoEntregaInstanceList: EnderecoEntrega.list(params), enderecoEntregaInstanceTotal: EnderecoEntrega.count()]
    }

    def create() {
        [enderecoEntregaInstance: new EnderecoEntrega(params)]
    }

    def save() {
        def enderecoEntregaInstance = new EnderecoEntrega(params)
        if (!enderecoEntregaInstance.save(flush: true)) {
            render(view: "create", model: [enderecoEntregaInstance: enderecoEntregaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), enderecoEntregaInstance.id])
        redirect(action: "show", id: enderecoEntregaInstance.id)
    }

    def show(Long id) {
        def enderecoEntregaInstance = EnderecoEntrega.get(id)
        if (!enderecoEntregaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "list")
            return
        }

        [enderecoEntregaInstance: enderecoEntregaInstance]
    }

    def edit(Long id) {
        def enderecoEntregaInstance = EnderecoEntrega.get(id)
        if (!enderecoEntregaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "list")
            return
        }

        [enderecoEntregaInstance: enderecoEntregaInstance]
    }

    def update(Long id, Long version) {
        def enderecoEntregaInstance = EnderecoEntrega.get(id)
        if (!enderecoEntregaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (enderecoEntregaInstance.version > version) {
                enderecoEntregaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega')] as Object[],
                          "Another user has updated this EnderecoEntrega while you were editing")
                render(view: "edit", model: [enderecoEntregaInstance: enderecoEntregaInstance])
                return
            }
        }

        enderecoEntregaInstance.properties = params

        if (!enderecoEntregaInstance.save(flush: true)) {
            render(view: "edit", model: [enderecoEntregaInstance: enderecoEntregaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), enderecoEntregaInstance.id])
        redirect(action: "show", id: enderecoEntregaInstance.id)
    }

    def delete(Long id) {
        def enderecoEntregaInstance = EnderecoEntrega.get(id)
        if (!enderecoEntregaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "list")
            return
        }

        try {
            enderecoEntregaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega'), id])
            redirect(action: "show", id: id)
        }
    }
}
