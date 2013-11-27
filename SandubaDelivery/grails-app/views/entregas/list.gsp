
<%@ page import="br.com.aplicacao.sanduiche.Entregas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entregas.label', default: 'Entregas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entregas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entregas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="entregas.funcionario.label" default="Funcionario" /></th>
					
						<th><g:message code="entregas.endereco.label" default="Endereco" /></th>
					
						<g:sortableColumn property="dtEntrega" title="${message(code: 'entregas.dtEntrega.label', default: 'Dt Entrega')}" />
					
						<g:sortableColumn property="dtSolicitacao" title="${message(code: 'entregas.dtSolicitacao.label', default: 'Dt Solicitacao')}" />
					
						<th><g:message code="entregas.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="situacaoEntrega" title="${message(code: 'entregas.situacaoEntrega.label', default: 'Situacao Entrega')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entregasInstanceList}" status="i" var="entregasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entregasInstance.id}">${fieldValue(bean: entregasInstance, field: "funcionario")}</g:link></td>
					
						<td>${fieldValue(bean: entregasInstance, field: "endereco")}</td>
					
						<td><g:formatDate date="${entregasInstance.dtEntrega}" /></td>
					
						<td><g:formatDate date="${entregasInstance.dtSolicitacao}" /></td>
					
						<td>${fieldValue(bean: entregasInstance, field: "cliente")}</td>
					
						<td>${fieldValue(bean: entregasInstance, field: "situacaoEntrega")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entregasInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
