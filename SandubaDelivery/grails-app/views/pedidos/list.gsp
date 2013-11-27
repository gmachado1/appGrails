
<%@ page import="br.com.aplicacao.sanduiche.Pedidos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedidos.label', default: 'Pedidos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pedidos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pedidos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'pedidos.quantidade.label', default: 'Quantidade')}" />
					
						<th><g:message code="pedidos.produto.label" default="Produto" /></th>
					
						<th><g:message code="pedidos.entrega.label" default="Entrega" /></th>
					
						<g:sortableColumn property="observacao" title="${message(code: 'pedidos.observacao.label', default: 'Observacao')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'pedidos.total.label', default: 'Total')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidosInstanceList}" status="i" var="pedidosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pedidosInstance.id}">${fieldValue(bean: pedidosInstance, field: "quantidade")}</g:link></td>
					
						<td>${fieldValue(bean: pedidosInstance, field: "produto")}</td>
					
						<td>${fieldValue(bean: pedidosInstance, field: "entrega")}</td>
					
						<td>${fieldValue(bean: pedidosInstance, field: "observacao")}</td>
					
						<td>${fieldValue(bean: pedidosInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pedidosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
