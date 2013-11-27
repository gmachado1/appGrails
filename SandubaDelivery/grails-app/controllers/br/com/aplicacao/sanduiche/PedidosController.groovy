package br.com.aplicacao.sanduiche

import org.springframework.dao.DataIntegrityViolationException

class PedidosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pedidosInstanceList: Pedidos.list(params), pedidosInstanceTotal: Pedidos.count()]
    }

    def create() {
        [pedidosInstance: new Pedidos(params)]
    }

    def save() {
        def pedidosInstance = new Pedidos(params)
        if (!pedidosInstance.save(flush: true)) {
            render(view: "create", model: [pedidosInstance: pedidosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), pedidosInstance.id])
        redirect(action: "show", id: pedidosInstance.id)
    }

    def show(Long id) {
        def pedidosInstance = Pedidos.get(id)
        if (!pedidosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "list")
            return
        }

        [pedidosInstance: pedidosInstance]
    }

    def edit(Long id) {
        def pedidosInstance = Pedidos.get(id)
        if (!pedidosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "list")
            return
        }

        [pedidosInstance: pedidosInstance]
    }

    def update(Long id, Long version) {
        def pedidosInstance = Pedidos.get(id)
        if (!pedidosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pedidosInstance.version > version) {
                pedidosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pedidos.label', default: 'Pedidos')] as Object[],
                          "Another user has updated this Pedidos while you were editing")
                render(view: "edit", model: [pedidosInstance: pedidosInstance])
                return
            }
        }

        pedidosInstance.properties = params

        if (!pedidosInstance.save(flush: true)) {
            render(view: "edit", model: [pedidosInstance: pedidosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), pedidosInstance.id])
        redirect(action: "show", id: pedidosInstance.id)
    }

    def delete(Long id) {
        def pedidosInstance = Pedidos.get(id)
        if (!pedidosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "list")
            return
        }

        try {
            pedidosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pedidos.label', default: 'Pedidos'), id])
            redirect(action: "show", id: id)
        }
    }
}
