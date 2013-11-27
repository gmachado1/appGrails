package br.com.aplicacao.sanduiche



import org.junit.*
import grails.test.mixin.*

@TestFor(ProdutosController)
@Mock(Produtos)
class ProdutosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/produtos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.produtosInstanceList.size() == 0
        assert model.produtosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.produtosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.produtosInstance != null
        assert view == '/produtos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/produtos/show/1'
        assert controller.flash.message != null
        assert Produtos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/produtos/list'

        populateValidParams(params)
        def produtos = new Produtos(params)

        assert produtos.save() != null

        params.id = produtos.id

        def model = controller.show()

        assert model.produtosInstance == produtos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/produtos/list'

        populateValidParams(params)
        def produtos = new Produtos(params)

        assert produtos.save() != null

        params.id = produtos.id

        def model = controller.edit()

        assert model.produtosInstance == produtos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/produtos/list'

        response.reset()

        populateValidParams(params)
        def produtos = new Produtos(params)

        assert produtos.save() != null

        // test invalid parameters in update
        params.id = produtos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/produtos/edit"
        assert model.produtosInstance != null

        produtos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/produtos/show/$produtos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        produtos.clearErrors()

        populateValidParams(params)
        params.id = produtos.id
        params.version = -1
        controller.update()

        assert view == "/produtos/edit"
        assert model.produtosInstance != null
        assert model.produtosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/produtos/list'

        response.reset()

        populateValidParams(params)
        def produtos = new Produtos(params)

        assert produtos.save() != null
        assert Produtos.count() == 1

        params.id = produtos.id

        controller.delete()

        assert Produtos.count() == 0
        assert Produtos.get(produtos.id) == null
        assert response.redirectedUrl == '/produtos/list'
    }
}
