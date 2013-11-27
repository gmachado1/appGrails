
<%@ page import="br.com.aplicacao.sanduiche.Entregas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entregas.label', default: 'Entregas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-entregas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entregas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entregas">
			
				<g:if test="${entregasInstance?.funcionario}">
				<li class="fieldcontain">
					<span id="funcionario-label" class="property-label"><g:message code="entregas.funcionario.label" default="Funcionario" /></span>
					
						<span class="property-value" aria-labelledby="funcionario-label"><g:link controller="funcionario" action="show" id="${entregasInstance?.funcionario?.id}">${entregasInstance?.funcionario?.nome}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="entregas.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:link controller="enderecoentrega" action="show" id="${entregasInstance?.endereco?.id}">${entregasInstance?.endereco?.rua} ${entregasInstance?.endereco?.complemento}, ${entregasInstance?.endereco?.bairro} -${entregasInstance?.endereco?.cidade} </g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.dtEntrega}">
				<li class="fieldcontain">
					<span id="dtEntrega-label" class="property-label"><g:message code="entregas.dtEntrega.label" default="Dt Entrega" /></span>
					
						<span class="property-value" aria-labelledby="dtEntrega-label"><g:formatDate date="${entregasInstance?.dtEntrega}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.dtSolicitacao}">
				<li class="fieldcontain">
					<span id="dtSolicitacao-label" class="property-label"><g:message code="entregas.dtSolicitacao.label" default="Dt Solicitacao" /></span>
					
						<span class="property-value" aria-labelledby="dtSolicitacao-label"><g:formatDate date="${entregasInstance?.dtSolicitacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="entregas.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${entregasInstance?.cliente?.id}">${entregasInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.situacaoEntrega}">
				<li class="fieldcontain">
					<span id="situacaoEntrega-label" class="property-label"><g:message code="entregas.situacaoEntrega.label" default="Situacao Entrega" /></span>
					
						<span class="property-value" aria-labelledby="situacaoEntrega-label"><g:fieldValue bean="${entregasInstance}" field="situacaoEntrega"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entregasInstance?.pedidos}">
				<li class="fieldcontain">
					<span id="pedidos-label" class="property-label"><g:message code="entregas.pedidos.label" default="Pedidos" /></span>
					
						<g:each in="${entregasInstance.pedidos}" var="p">
						<span class="property-value" aria-labelledby="pedidos-label"><g:link controller="pedidos" action="show" id="${p.id}">Qtd: ${p?.quantidade} - ${p?.produto?.nome} - R$ ${p?.total}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entregasInstance?.id}" />
					<g:link class="edit" action="edit" id="${entregasInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
