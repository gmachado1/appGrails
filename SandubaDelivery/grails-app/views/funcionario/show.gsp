
<%@ page import="br.com.aplicacao.sanduiche.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-funcionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-funcionario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list funcionario">
			
				<g:if test="${funcionarioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="funcionario.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${funcionarioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.sobrenome}">
				<li class="fieldcontain">
					<span id="sobrenome-label" class="property-label"><g:message code="funcionario.sobrenome.label" default="Sobrenome" /></span>
					
						<span class="property-value" aria-labelledby="sobrenome-label"><g:fieldValue bean="${funcionarioInstance}" field="sobrenome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="funcionario.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${funcionarioInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="funcionario.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:link controller="enderecos" action="show" id="${funcionarioInstance?.endereco?.id}">${funcionarioInstance?.endereco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.contratado}">
				<li class="fieldcontain">
					<span id="contratado-label" class="property-label"><g:message code="funcionario.contratado.label" default="Contratado" /></span>
					
						<span class="property-value" aria-labelledby="contratado-label"><g:formatDate date="${funcionarioInstance?.contratado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.salario}">
				<li class="fieldcontain">
					<span id="salario-label" class="property-label"><g:message code="funcionario.salario.label" default="Salario" /></span>
					
						<span class="property-value" aria-labelledby="salario-label"><g:fieldValue bean="${funcionarioInstance}" field="salario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.placaMoto}">
				<li class="fieldcontain">
					<span id="placaMoto-label" class="property-label"><g:message code="funcionario.placaMoto.label" default="Placa Moto" /></span>
					
						<span class="property-value" aria-labelledby="placaMoto-label"><g:fieldValue bean="${funcionarioInstance}" field="placaMoto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.demitido}">
				<li class="fieldcontain">
					<span id="demitido-label" class="property-label"><g:message code="funcionario.demitido.label" default="Demitido" /></span>
					
						<span class="property-value" aria-labelledby="demitido-label"><g:formatDate date="${funcionarioInstance?.demitido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.numeroMultas}">
				<li class="fieldcontain">
					<span id="numeroMultas-label" class="property-label"><g:message code="funcionario.numeroMultas.label" default="Numero Multas" /></span>
					
						<span class="property-value" aria-labelledby="numeroMultas-label"><g:fieldValue bean="${funcionarioInstance}" field="numeroMultas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.tipoFuncionario}">
				<li class="fieldcontain">
					<span id="tipoFuncionario-label" class="property-label"><g:message code="funcionario.tipoFuncionario.label" default="Tipo Funcionario" /></span>
					
						<span class="property-value" aria-labelledby="tipoFuncionario-label"><g:fieldValue bean="${funcionarioInstance}" field="tipoFuncionario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.carteira}">
				<li class="fieldcontain">
					<span id="carteira-label" class="property-label"><g:message code="funcionario.carteira.label" default="Carteira" /></span>
					
						<span class="property-value" aria-labelledby="carteira-label"><g:fieldValue bean="${funcionarioInstance}" field="carteira"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${funcionarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${funcionarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
