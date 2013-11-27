
<%@ page import="br.com.aplicacao.sanduiche.Produtos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produtos.label', default: 'Produtos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-produtos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-produtos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'produtos.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'produtos.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'produtos.descricao.label', default: 'Descricao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${produtosInstanceList}" status="i" var="produtosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${produtosInstance.id}">${fieldValue(bean: produtosInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: produtosInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: produtosInstance, field: "descricao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${produtosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
