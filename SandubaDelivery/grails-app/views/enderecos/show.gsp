<%@ page import="br.com.aplicacao.sanduiche.Enderecos"%>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'enderecos.label', default: 'Enderecos')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<script>

</script>
<body>
	<a href="#show-enderecos" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-enderecos" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<tr>
				<td>
					<ol class="property-list enderecos">

						<g:if test="${enderecosInstance?.cidade}">
							<li class="fieldcontain"><span id="cidade-label"
								class="property-label"><g:message
										code="enderecos.cidade.label" default="Cidade" /></span> <span
								class="property-value" aria-labelledby="cidade-label"><g:fieldValue
										bean="${enderecosInstance}" field="cidade" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.estado}">
							<li class="fieldcontain"><span id="estado-label"
								class="property-label"><g:message
										code="enderecos.estado.label" default="Estado" /></span> <span
								class="property-value" aria-labelledby="estado-label"><g:fieldValue
										bean="${enderecosInstance}" field="estado" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.bairro}">
							<li class="fieldcontain"><span id="bairro-label"
								class="property-label"><g:message
										code="enderecos.bairro.label" default="Bairro" /></span> <span
								class="property-value" aria-labelledby="bairro-label"><g:fieldValue
										bean="${enderecosInstance}" field="bairro" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.rua}">
							<li class="fieldcontain"><span id="rua-label"
								class="property-label"><g:message
										code="enderecos.rua.label" default="Rua" /></span> <span
								class="property-value" aria-labelledby="rua-label"><g:fieldValue
										bean="${enderecosInstance}" field="rua" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.cep}">
							<li class="fieldcontain"><span id="cep-label"
								class="property-label"><g:message
										code="enderecos.cep.label" default="Cep" /></span> <span
								class="property-value" aria-labelledby="cep-label"><g:fieldValue
										bean="${enderecosInstance}" field="cep" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.latitude}">
							<li class="fieldcontain" style="display: none"><span
								id="latitude-label" class="property-label"><g:message
										code="enderecos.latitude.label" default="Latitude" /></span> <span
								class="property-value" aria-labelledby="latitude-label"><g:fieldValue
										bean="${enderecosInstance}" field="latitude" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.longitude}">
							<li class="fieldcontain" style="display: none"><span
								id="longitude-label" class="property-label"><g:message
										code="enderecos.longitude.label" default="Longitude" /></span> <span
								class="property-value" aria-labelledby="longitude-label"><g:fieldValue
										bean="${enderecosInstance}" field="longitude" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.complemento}">
							<li class="fieldcontain"><span id="complemento-label"
								class="property-label"><g:message
										code="enderecos.complemento.label" default="Complemento" /></span> <span
								class="property-value" aria-labelledby="complemento-label"><g:fieldValue
										bean="${enderecosInstance}" field="complemento" /></span></li>
						</g:if>

						<g:if test="${enderecosInstance?.referencia}">
							<li class="fieldcontain"><span id="referencia-label"
								class="property-label"><g:message
										code="enderecos.referencia.label" default="Referencia" /></span> <span
								class="property-value" aria-labelledby="referencia-label"><g:fieldValue
										bean="${enderecosInstance}" field="referencia" /></span></li>
						</g:if>
				</td>
				<td>
					<div id="map_canvas" style="height: 300px; width: 600px;"></div>
				</td>
			</tr>
		</table>
		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${enderecosInstance?.id}" />
				<g:link class="edit" action="edit" id="${enderecosInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>

</body>
</html>
