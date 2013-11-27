x'
<%@ page import="br.com.aplicacao.sanduiche.Pedidos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedidos.label', default: 'Pedidos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedidos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedidos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedidos">
				<g:if test="${pedidosInstance?.entrega}">
				<li class="fieldcontain">
					<span id="entrega-label" class="property-label"><g:message code="pedidos.entrega.label" default="Entrega" /></span>
					
						<span class="property-value" aria-labelledby="entrega-label"><g:link controller="entregas" action="edit" id="${pedidosInstance?.entrega?.id}">Voltar a entrega</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${pedidosInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="pedidos.produto.label" default="Produto" /></span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produtos" action="show" id="${pedidosInstance?.produto?.id}">${pedidosInstance?.produto?.nome}</g:link></span>
					
				</li>
				</g:if>
				<g:if test="${pedidosInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="pedidos.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${pedidosInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidosInstance?.observacao}">
				<li class="fieldcontain">
					<span id="observacao-label" class="property-label"><g:message code="pedidos.observacao.label" default="Observacao" /></span>
					
						<span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${pedidosInstance}" field="observacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidosInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="pedidos.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${pedidosInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pedidosInstance?.id}" />
					<g:link class="edit" action="edit" id="${pedidosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
