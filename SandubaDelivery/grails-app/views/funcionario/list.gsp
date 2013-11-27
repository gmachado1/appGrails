
<%@ page import="br.com.aplicacao.sanduiche.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-funcionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-funcionario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'funcionario.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="sobrenome" title="${message(code: 'funcionario.sobrenome.label', default: 'Sobrenome')}" />
					
						<g:sortableColumn property="celular" title="${message(code: 'funcionario.celular.label', default: 'Celular')}" />
					
						<th><g:message code="funcionario.endereco.label" default="Endereco" /></th>
					
						<g:sortableColumn property="contratado" title="${message(code: 'funcionario.contratado.label', default: 'Contratado')}" />
					
						<g:sortableColumn property="salario" title="${message(code: 'funcionario.salario.label', default: 'Salario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${funcionarioInstanceList}" status="i" var="funcionarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${funcionarioInstance.id}">${fieldValue(bean: funcionarioInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: funcionarioInstance, field: "sobrenome")}</td>
					
						<td>${fieldValue(bean: funcionarioInstance, field: "celular")}</td>
					
						<td>${fieldValue(bean: funcionarioInstance, field: "endereco")}</td>
					
						<td><g:formatDate date="${funcionarioInstance.contratado}" /></td>
					
						<td>${fieldValue(bean: funcionarioInstance, field: "salario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${funcionarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
