package br.com.aplicacao.sanduiche

import org.springframework.dao.DataIntegrityViolationException

class FuncionarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [funcionarioInstanceList: Funcionario.list(params), funcionarioInstanceTotal: Funcionario.count()]
    }

    def create() {
        [funcionarioInstance: new Funcionario(params)]
    }

    def save() {
        def funcionarioInstance = new Funcionario(params)
        if (!funcionarioInstance.save(flush: true)) {
            render(view: "create", model: [funcionarioInstance: funcionarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
        redirect(action: "show", id: funcionarioInstance.id)
    }

    def show(Long id) {
        def funcionarioInstance = Funcionario.get(id)
        if (!funcionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "list")
            return
        }

        [funcionarioInstance: funcionarioInstance]
    }

    def edit(Long id) {
        def funcionarioInstance = Funcionario.get(id)
        if (!funcionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "list")
            return
        }

        [funcionarioInstance: funcionarioInstance]
    }

    def update(Long id, Long version) {
        def funcionarioInstance = Funcionario.get(id)
        if (!funcionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (funcionarioInstance.version > version) {
                funcionarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'funcionario.label', default: 'Funcionario')] as Object[],
                          "Another user has updated this Funcionario while you were editing")
                render(view: "edit", model: [funcionarioInstance: funcionarioInstance])
                return
            }
        }

        funcionarioInstance.properties = params

        if (!funcionarioInstance.save(flush: true)) {
            render(view: "edit", model: [funcionarioInstance: funcionarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
        redirect(action: "show", id: funcionarioInstance.id)
    }

    def delete(Long id) {
        def funcionarioInstance = Funcionario.get(id)
        if (!funcionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "list")
            return
        }

        try {
            funcionarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), id])
            redirect(action: "show", id: id)
        }
    }
}
