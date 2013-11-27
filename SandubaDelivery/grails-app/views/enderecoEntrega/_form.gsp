<%@ page import="br.com.aplicacao.sanduiche.EnderecoEntrega" %>



<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="enderecoEntrega.cidade.label" default="Cidade" />
		
	</label>
	<g:textField name="cidade" value="${enderecoEntregaInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="enderecoEntrega.estado.label" default="Estado" />
		
	</label>
	<g:select name="estado" from="${br.com.aplicacao.sanduiche.EstadoEnum?.values()}" keys="${br.com.aplicacao.sanduiche.EstadoEnum.values()*.name()}" value="${enderecoEntregaInstance?.estado?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'bairro', 'error')} ">
	<label for="bairro">
		<g:message code="enderecoEntrega.bairro.label" default="Bairro" />
		
	</label>
	<g:textField name="bairro" value="${enderecoEntregaInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'rua', 'error')} ">
	<label for="rua">
		<g:message code="enderecoEntrega.rua.label" default="Rua" />
		
	</label>
	<g:textField name="rua" value="${enderecoEntregaInstance?.rua}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="enderecoEntrega.cep.label" default="Cep" />
		
	</label>
	<g:textField name="cep" value="${enderecoEntregaInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="enderecoEntrega.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: enderecoEntregaInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="enderecoEntrega.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: enderecoEntregaInstance, field: 'longitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="enderecoEntrega.complemento.label" default="Complemento" />
		
	</label>
	<g:textField name="complemento" value="${enderecoEntregaInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'entrega', 'error')} required">
	<label for="entrega">
		<g:message code="enderecoEntrega.entrega.label" default="Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrega" name="entrega.id" from="${br.com.aplicacao.sanduiche.Entregas.list()}" optionKey="id" required="" value="${enderecoEntregaInstance?.entrega?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoEntregaInstance, field: 'referencia', 'error')} ">
	<label for="referencia">
		<g:message code="enderecoEntrega.referencia.label" default="Referencia" />
		
	</label>
	<g:textField name="referencia" value="${enderecoEntregaInstance?.referencia}"/>
</div>

