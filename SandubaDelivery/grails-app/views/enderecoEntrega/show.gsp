
<%@ page import="br.com.aplicacao.sanduiche.EnderecoEntrega" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enderecoEntrega.label', default: 'EnderecoEntrega')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-enderecoEntrega" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enderecoEntrega" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enderecoEntrega">
			
				<g:if test="${enderecoEntregaInstance?.cidade}">
				<li class="fieldcontain">
					<span id="cidade-label" class="property-label"><g:message code="enderecoEntrega.cidade.label" default="Cidade" /></span>
					
						<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="cidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="enderecoEntrega.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.bairro}">
				<li class="fieldcontain">
					<span id="bairro-label" class="property-label"><g:message code="enderecoEntrega.bairro.label" default="Bairro" /></span>
					
						<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="bairro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.rua}">
				<li class="fieldcontain">
					<span id="rua-label" class="property-label"><g:message code="enderecoEntrega.rua.label" default="Rua" /></span>
					
						<span class="property-value" aria-labelledby="rua-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="rua"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.cep}">
				<li class="fieldcontain">
					<span id="cep-label" class="property-label"><g:message code="enderecoEntrega.cep.label" default="Cep" /></span>
					
						<span class="property-value" aria-labelledby="cep-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="cep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="enderecoEntrega.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="enderecoEntrega.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.complemento}">
				<li class="fieldcontain">
					<span id="complemento-label" class="property-label"><g:message code="enderecoEntrega.complemento.label" default="Complemento" /></span>
					
						<span class="property-value" aria-labelledby="complemento-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="complemento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.entrega}">
				<li class="fieldcontain">
					<span id="entrega-label" class="property-label"><g:message code="enderecoEntrega.entrega.label" default="Entrega" /></span>
					
						<span class="property-value" aria-labelledby="entrega-label"><g:link controller="entregas" action="show" id="${enderecoEntregaInstance?.entrega?.id}">${enderecoEntregaInstance?.entrega?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoEntregaInstance?.referencia}">
				<li class="fieldcontain">
					<span id="referencia-label" class="property-label"><g:message code="enderecoEntrega.referencia.label" default="Referencia" /></span>
					
						<span class="property-value" aria-labelledby="referencia-label"><g:fieldValue bean="${enderecoEntregaInstance}" field="referencia"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enderecoEntregaInstance?.id}" />
					<g:link class="edit" action="edit" id="${enderecoEntregaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
