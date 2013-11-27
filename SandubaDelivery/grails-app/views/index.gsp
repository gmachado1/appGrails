<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Aplicação de Sanduiches</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="status" role="complementary">
		<h1>Menu Lateral</h1>
		<ul>
			<li class="controller"><g:link controller="cliente"
					action="list">Cadastro de Clientes</g:link></li>
			<li class="controller"><g:link controller="entregas"
					action="list">Cadastro de Entregas</g:link></li>
			<li class="controller"><g:link controller="produtos"
					action="list">Cadastro de Produtos</g:link></li>
			<li class="controller"><g:link controller="funcionario"
					action="list">Cadastro de Funcionarios</g:link></li>
		</ul>
	</div>
	<div id="page-body" role="main">
		<h1>Especificação do Projeto</h1>
		<p>Crie um sistema que registre pedidos de entrega de hambúrguer. 
		O sistema deve auxiliar um atendente a registrar o pedido,os dados do 
		solicitante do pedido e o local de entrega. Ao receber uma ligação o atendente 
		deve anotar os dados relevantes do solicitante, como telefone e  nome. Logo após deve 
		ser apresentando ao atendente as opções de sanduíches e bebidas, possibilitando o mesmo 
		montar o pedido do usuário. Ao finalizar o pedido deve-se gerar um total do pedido e 
		solicitar o endereço de entrega, que deve ser indicado em um mapa. A indicação deve conter 
		os dados do pedido, nome e telefone do solicitante.</p>

		<div id="controller-list" role="navigation">
			<h2>Ações:</h2>
			<ul>
				<li class="controller"><g:link controller="cliente"
						action="list">Cadastro de Clientes</g:link> Fluxo de pedido cadastrando cliente</li>
				<li class="controller"><g:link controller="entregas"
						action="list">Cadastro de Entregas</g:link>Fluxo de pedido sem cadasto de cliente</li>
				<li class="controller"><g:link controller="produtos"
						action="list">Cadastro de Produtos</g:link></li>
				<li class="controller"><g:link controller="funcionario"
						action="list">Cadastro de Funcionarios</g:link></li>

			</ul>
		</div>
	</div>
</body>
</html>
