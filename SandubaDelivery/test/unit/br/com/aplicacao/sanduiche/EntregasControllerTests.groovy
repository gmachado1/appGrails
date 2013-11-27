package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(EntregasController)
@Mock(Entregas)
class EntregasControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entregas/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entregasInstanceList.size() == 0
        assert model.entregasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entregasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entregasInstance != null
        assert view == '/entregas/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entregas/show/1'
        assert controller.flash.message != null
        assert Entregas.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entregas/list'

        populateValidParams(params)
        def entregas = new Entregas(params)

        assert entregas.save() != null

        params.id = entregas.id

        def model = controller.show()

        assert model.entregasInstance == entregas
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entregas/list'

        populateValidParams(params)
        def entregas = new Entregas(params)

        assert entregas.save() != null

        params.id = entregas.id

        def model = controller.edit()

        assert model.entregasInstance == entregas
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entregas/list'

        response.reset()

        populateValidParams(params)
        def entregas = new Entregas(params)

        assert entregas.save() != null

        // test invalid parameters in update
        params.id = entregas.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entregas/edit"
        assert model.entregasInstance != null

        entregas.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entregas/show/$entregas.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entregas.clearErrors()

        populateValidParams(params)
        params.id = entregas.id
        params.version = -1
        controller.update()

        assert view == "/entregas/edit"
        assert model.entregasInstance != null
        assert model.entregasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entregas/list'

        response.reset()

        populateValidParams(params)
        def entregas = new Entregas(params)

        assert entregas.save() != null
        assert Entregas.count() == 1

        params.id = entregas.id

        controller.delete()

        assert Entregas.count() == 0
        assert Entregas.get(entregas.id) == null
        assert response.redirectedUrl == '/entregas/list'
    }
}
