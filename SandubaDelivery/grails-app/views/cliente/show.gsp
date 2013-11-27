
<%@ page import="br.com.aplicacao.sanduiche.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="cliente.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${clienteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.sobrenome}">
				<li class="fieldcontain">
					<span id="sobrenome-label" class="property-label"><g:message code="cliente.sobrenome.label" default="Sobrenome" /></span>
					
						<span class="property-value" aria-labelledby="sobrenome-label"><g:fieldValue bean="${clienteInstance}" field="sobrenome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="cliente.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${clienteInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="cliente.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:link controller="enderecos" action="show" id="${clienteInstance?.endereco?.id}">Residência</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="cliente.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clienteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.entregas}">
				<li class="fieldcontain">
					<span id="entregas-label" class="property-label"><g:message code="cliente.entregas.label" default="Entregas" /></span>
					
						<g:each in="${clienteInstance.entregas}" var="e">
						<span class="property-value" aria-labelledby="entregas-label"><g:link controller="entregas" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${clienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
