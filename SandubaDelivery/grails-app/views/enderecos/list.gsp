
<%@ page import="br.com.aplicacao.sanduiche.Enderecos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enderecos.label', default: 'Enderecos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enderecos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enderecos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cidade" title="${message(code: 'enderecos.cidade.label', default: 'Cidade')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'enderecos.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="bairro" title="${message(code: 'enderecos.bairro.label', default: 'Bairro')}" />
					
						<g:sortableColumn property="rua" title="${message(code: 'enderecos.rua.label', default: 'Rua')}" />
					
						<g:sortableColumn property="cep" title="${message(code: 'enderecos.cep.label', default: 'Cep')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'enderecos.latitude.label', default: 'Latitude')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enderecosInstanceList}" status="i" var="enderecosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enderecosInstance.id}">${fieldValue(bean: enderecosInstance, field: "cidade")}</g:link></td>
					
						<td>${fieldValue(bean: enderecosInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: enderecosInstance, field: "bairro")}</td>
					
						<td>${fieldValue(bean: enderecosInstance, field: "rua")}</td>
					
						<td>${fieldValue(bean: enderecosInstance, field: "cep")}</td>
					
						<td>${fieldValue(bean: enderecosInstance, field: "latitude")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enderecosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
