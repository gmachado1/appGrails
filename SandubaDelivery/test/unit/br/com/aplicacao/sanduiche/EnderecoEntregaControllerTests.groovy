package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(EnderecoEntregaController)
@Mock(EnderecoEntrega)
class EnderecoEntregaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/enderecoEntrega/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.enderecoEntregaInstanceList.size() == 0
        assert model.enderecoEntregaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.enderecoEntregaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.enderecoEntregaInstance != null
        assert view == '/enderecoEntrega/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/enderecoEntrega/show/1'
        assert controller.flash.message != null
        assert EnderecoEntrega.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecoEntrega/list'

        populateValidParams(params)
        def enderecoEntrega = new EnderecoEntrega(params)

        assert enderecoEntrega.save() != null

        params.id = enderecoEntrega.id

        def model = controller.show()

        assert model.enderecoEntregaInstance == enderecoEntrega
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecoEntrega/list'

        populateValidParams(params)
        def enderecoEntrega = new EnderecoEntrega(params)

        assert enderecoEntrega.save() != null

        params.id = enderecoEntrega.id

        def model = controller.edit()

        assert model.enderecoEntregaInstance == enderecoEntrega
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecoEntrega/list'

        response.reset()

        populateValidParams(params)
        def enderecoEntrega = new EnderecoEntrega(params)

        assert enderecoEntrega.save() != null

        // test invalid parameters in update
        params.id = enderecoEntrega.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/enderecoEntrega/edit"
        assert model.enderecoEntregaInstance != null

        enderecoEntrega.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/enderecoEntrega/show/$enderecoEntrega.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        enderecoEntrega.clearErrors()

        populateValidParams(params)
        params.id = enderecoEntrega.id
        params.version = -1
        controller.update()

        assert view == "/enderecoEntrega/edit"
        assert model.enderecoEntregaInstance != null
        assert model.enderecoEntregaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/enderecoEntrega/list'

        response.reset()

        populateValidParams(params)
        def enderecoEntrega = new EnderecoEntrega(params)

        assert enderecoEntrega.save() != null
        assert EnderecoEntrega.count() == 1

        params.id = enderecoEntrega.id

        controller.delete()

        assert EnderecoEntrega.count() == 0
        assert EnderecoEntrega.get(enderecoEntrega.id) == null
        assert response.redirectedUrl == '/enderecoEntrega/list'
    }
}
