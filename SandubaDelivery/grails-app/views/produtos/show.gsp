
<%@ page import="br.com.aplicacao.sanduiche.Produtos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produtos.label', default: 'Produtos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-produtos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-produtos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list produtos">
			
				<g:if test="${produtosInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="produtos.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${produtosInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtosInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="produtos.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${produtosInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${produtosInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="produtos.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${produtosInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${produtosInstance?.id}" />
					<g:link class="edit" action="edit" id="${produtosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
