package br.com.aplicacao.sanduiche

import org.springframework.dao.DataIntegrityViolationException

class ProdutosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [produtosInstanceList: Produtos.list(params), produtosInstanceTotal: Produtos.count()]
    }

    def create() {
        [produtosInstance: new Produtos(params)]
    }

    def save() {
        def produtosInstance = new Produtos(params)
        if (!produtosInstance.save(flush: true)) {
            render(view: "create", model: [produtosInstance: produtosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'produtos.label', default: 'Produtos'), produtosInstance.id])
        redirect(action: "show", id: produtosInstance.id)
    }

    def show(Long id) {
        def produtosInstance = Produtos.get(id)
        if (!produtosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "list")
            return
        }

        [produtosInstance: produtosInstance]
    }

    def edit(Long id) {
        def produtosInstance = Produtos.get(id)
        if (!produtosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "list")
            return
        }

        [produtosInstance: produtosInstance]
    }

    def update(Long id, Long version) {
        def produtosInstance = Produtos.get(id)
        if (!produtosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (produtosInstance.version > version) {
                produtosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'produtos.label', default: 'Produtos')] as Object[],
                          "Another user has updated this Produtos while you were editing")
                render(view: "edit", model: [produtosInstance: produtosInstance])
                return
            }
        }

        produtosInstance.properties = params

        if (!produtosInstance.save(flush: true)) {
            render(view: "edit", model: [produtosInstance: produtosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'produtos.label', default: 'Produtos'), produtosInstance.id])
        redirect(action: "show", id: produtosInstance.id)
    }

    def delete(Long id) {
        def produtosInstance = Produtos.get(id)
        if (!produtosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "list")
            return
        }

        try {
            produtosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'produtos.label', default: 'Produtos'), id])
            redirect(action: "show", id: id)
        }
    }
}
