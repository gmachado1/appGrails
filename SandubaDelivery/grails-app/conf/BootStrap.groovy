import java.util.Date;

import br.com.aplicacao.sanduiche.Cliente
import br.com.aplicacao.sanduiche.Enderecos;
import br.com.aplicacao.sanduiche.Funcionario
import br.com.aplicacao.sanduiche.Produtos
import br.com.aplicacao.sanduiche.*

class BootStrap {


	def init = { servletContext -> 
		criarProdutos()
		//criarClientes()
		criarFuncionarios()
		criarPedidos();
		 }
	def destroy = {
	}

	void criarProdutos(){
		Produtos produto = new Produtos(nome:'Big Mac', preco:15.50 as BigDecimal, descricao:'Pão, Hamburger, alface,queijo, molho especial, cebola, picles e um pão com gergilin ')

		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}

		produto = new Produtos(nome:'Hamburguer', preco:3.50 as BigDecimal, descricao:'Pão, Hamburger, alface,e um pão.')
		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}

		produto = new Produtos(nome:'X Burger', preco:5.50 as BigDecimal,
		descricao:'Pão, Hamburger, alface,queijo e um pão.')
		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}

		produto = new Produtos(nome:'Egg Burger', preco:6.50 as BigDecimal,
		descricao:'Pão, Hamburger, alface,queijo, ovo e um pão.')
		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}
		produto = new Produtos(nome:'Coca-Cola', preco:2.50 as BigDecimal,
		descricao:'Refrigerante com rato.')
		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}
		produto = new Produtos(nome:'Guaraná', preco:2.50 as BigDecimal,
		descricao:'Refrigerante com o guaraná natural da Amazônia.')
		if (!produto.save()){
			log.error "Could not save user!!"
			log.error "${produto.errors}"
		}
	}
	//today.dateTimeString // 17/06/09 14:26:51
	void criarFuncionarios(){
		Funcionario funcionario = new Funcionario(nome:'Cebolinha',sobrenome:'de Souza',celular:'02-22222222',
		endereco: null,
		contratado:new Date().format('dd/MM/yyyy'),demitido:new Date().format('dd/MM/yyyy'),
		placaMoto:"kzv-7080",carteira:'0231fdfd',numeroMultas:3,
		salario:800,
		tipoFuncionario: TipoFucionarioEnum.MOTOCICLISTA )

		if (!funcionario.save()){
			log.error "Could not save user!!"
			log.error "${funcionario.errors}"
		}
		funcionario = new Funcionario(nome:'Mônica',sobrenome:'de Souza',celular:'02-333333333',
		endereco:null,
		contratado:new Date().format('dd/MM/yyyy'),demitido:new Date().format('dd/MM/yyyy'),
		placaMoto:null, carteira:'0231fdfd',numeroMultas:0,
		salario:800,
		tipoFuncionario: TipoFucionarioEnum.RECEPCIONISTA )

		if (!funcionario.save()){
			log.error "Could not save user!!"
			log.error "${funcionario.errors}"
		}
		funcionario = new Funcionario(nome:'Magali',sobrenome:'Silva',celular:'02-22222222',
		endereco: null,
		contratado:new Date().format('dd/MM/yyyy'),demitido:new Date().format('dd/MM/yyyy'),
		placaMoto:null, carteira:'0231fdfd',numeroMultas:0,
		salario:800,
		tipoFuncionario: TipoFucionarioEnum.CUZINHEIRA )

		if (!funcionario.save()){
			log.error "Could not save user!!"
			log.error "${funcionario.errors}"
		}
		funcionario = new Funcionario(nome:'Cascao',sobrenome:'Silva',celular:'02-22222222',
		endereco: null,
		contratado:new Date().format('dd/MM/yyyy'),demitido:new Date().format('dd/MM/yyyy'),
		placaMoto:null, carteira:'0231fdfd',numeroMultas:0,
		salario:800,
		tipoFuncionario: TipoFucionarioEnum.FAXINEIRA )

		if (!funcionario.save()){
			log.error "Could not save user!!"
			log.error "${funcionario.errors}"
		}

	}
	void criarClientes(){
		//Entregas entregas = []
		entregas = criarEntregas();
		Cliente cliente= new Cliente(nome:'Gustavo',sobrenome:'Machado',celular:'02-22222222',
		endereco: new EnderecoResidencia(cidade:'niteroi',estado:EstadoEnum.RJ,rua:'rua Alcyr Amorin da Cruz nunes',
		complemento:'casa 95',referencia:'ao lado do colegio',cep:'24358-090'),
		contratado:new Date().format('dd/MM/yyyy'),email:'g.machado1@gmail.com'
		)

		if (!cliente.save()){
			log.error "Could not save user!!"
			log.error "${cliente.errors}"
		}
	}
	Enderecos criarEnderecos(){
		return new EnderecoResidencia(cidade:'niteroi',estado:EstadoEnum.RJ,rua:'Rua Alcyr Amorin da Cruz Nunes',	complemento:'casa 95',
		referencia:'perto da ponte do tibau',cep:'24358-090');
	}
	void criarPedidos(){
		Produtos produto = Produtos.get(1)
		Pedidos pedido = new Pedidos(observavao:'sem picles', quantidade:1,total:15.5, produto:produto).save();
		produto = Produtos.get(3)
		pedido = new Pedidos(observavao:'sem picles', quantidade:2,total:10.0, produto:produto).save()
		produto = Produtos.get(6)
		pedido = new Pedidos(observavao:'sem picles', quantidade:3,total:7.50, produto:produto).save()
	}
}