package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(EnderecosController)
@Mock(Enderecos)
class EnderecosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/enderecos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.enderecosInstanceList.size() == 0
        assert model.enderecosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.enderecosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.enderecosInstance != null
        assert view == '/enderecos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/enderecos/show/1'
        assert controller.flash.message != null
        assert Enderecos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecos/list'

        populateValidParams(params)
        def enderecos = new Enderecos(params)

        assert enderecos.save() != null

        params.id = enderecos.id

        def model = controller.show()

        assert model.enderecosInstance == enderecos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecos/list'

        populateValidParams(params)
        def enderecos = new Enderecos(params)

        assert enderecos.save() != null

        params.id = enderecos.id

        def model = controller.edit()

        assert model.enderecosInstance == enderecos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/enderecos/list'

        response.reset()

        populateValidParams(params)
        def enderecos = new Enderecos(params)

        assert enderecos.save() != null

        // test invalid parameters in update
        params.id = enderecos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/enderecos/edit"
        assert model.enderecosInstance != null

        enderecos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/enderecos/show/$enderecos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        enderecos.clearErrors()

        populateValidParams(params)
        params.id = enderecos.id
        params.version = -1
        controller.update()

        assert view == "/enderecos/edit"
        assert model.enderecosInstance != null
        assert model.enderecosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/enderecos/list'

        response.reset()

        populateValidParams(params)
        def enderecos = new Enderecos(params)

        assert enderecos.save() != null
        assert Enderecos.count() == 1

        params.id = enderecos.id

        controller.delete()

        assert Enderecos.count() == 0
        assert Enderecos.get(enderecos.id) == null
        assert response.redirectedUrl == '/enderecos/list'
    }
}
