package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(PedidosController)
@Mock(Pedidos)
class PedidosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pedidos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pedidosInstanceList.size() == 0
        assert model.pedidosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pedidosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pedidosInstance != null
        assert view == '/pedidos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pedidos/show/1'
        assert controller.flash.message != null
        assert Pedidos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pedidos/list'

        populateValidParams(params)
        def pedidos = new Pedidos(params)

        assert pedidos.save() != null

        params.id = pedidos.id

        def model = controller.show()

        assert model.pedidosInstance == pedidos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pedidos/list'

        populateValidParams(params)
        def pedidos = new Pedidos(params)

        assert pedidos.save() != null

        params.id = pedidos.id

        def model = controller.edit()

        assert model.pedidosInstance == pedidos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pedidos/list'

        response.reset()

        populateValidParams(params)
        def pedidos = new Pedidos(params)

        assert pedidos.save() != null

        // test invalid parameters in update
        params.id = pedidos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pedidos/edit"
        assert model.pedidosInstance != null

        pedidos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pedidos/show/$pedidos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pedidos.clearErrors()

        populateValidParams(params)
        params.id = pedidos.id
        params.version = -1
        controller.update()

        assert view == "/pedidos/edit"
        assert model.pedidosInstance != null
        assert model.pedidosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pedidos/list'

        response.reset()

        populateValidParams(params)
        def pedidos = new Pedidos(params)

        assert pedidos.save() != null
        assert Pedidos.count() == 1

        params.id = pedidos.id

        controller.delete()

        assert Pedidos.count() == 0
        assert Pedidos.get(pedidos.id) == null
        assert response.redirectedUrl == '/pedidos/list'
    }
}
