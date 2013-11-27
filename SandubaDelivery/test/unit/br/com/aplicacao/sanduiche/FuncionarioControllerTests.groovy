package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(FuncionarioController)
@Mock(Funcionario)
class FuncionarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/funcionario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.funcionarioInstanceList.size() == 0
        assert model.funcionarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.funcionarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.funcionarioInstance != null
        assert view == '/funcionario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/funcionario/show/1'
        assert controller.flash.message != null
        assert Funcionario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/funcionario/list'

        populateValidParams(params)
        def funcionario = new Funcionario(params)

        assert funcionario.save() != null

        params.id = funcionario.id

        def model = controller.show()

        assert model.funcionarioInstance == funcionario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/funcionario/list'

        populateValidParams(params)
        def funcionario = new Funcionario(params)

        assert funcionario.save() != null

        params.id = funcionario.id

        def model = controller.edit()

        assert model.funcionarioInstance == funcionario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/funcionario/list'

        response.reset()

        populateValidParams(params)
        def funcionario = new Funcionario(params)

        assert funcionario.save() != null

        // test invalid parameters in update
        params.id = funcionario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/funcionario/edit"
        assert model.funcionarioInstance != null

        funcionario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/funcionario/show/$funcionario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        funcionario.clearErrors()

        populateValidParams(params)
        params.id = funcionario.id
        params.version = -1
        controller.update()

        assert view == "/funcionario/edit"
        assert model.funcionarioInstance != null
        assert model.funcionarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/funcionario/list'

        response.reset()

        populateValidParams(params)
        def funcionario = new Funcionario(params)

        assert funcionario.save() != null
        assert Funcionario.count() == 1

        params.id = funcionario.id

        controller.delete()

        assert Funcionario.count() == 0
        assert Funcionario.get(funcionario.id) == null
        assert response.redirectedUrl == '/funcionario/list'
    }
}
