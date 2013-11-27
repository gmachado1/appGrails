<%@ page import="br.com.aplicacao.sanduiche.Pedidos" %>



<div class="fieldcontain ${hasErrors(bean: pedidosInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="pedidos.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" min="1" value="${pedidosInstance.quantidade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidosInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="pedidos.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${br.com.aplicacao.sanduiche.Produtos.list()}" optionKey="id" optionValue="nome" required="" value="${pedidosInstance?.produto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidosInstance, field: 'entrega', 'error')} required" style="display: none">
	<label for="entrega">
		<g:message code="pedidos.entrega.label" default="Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrega" name="entrega.id" from="${br.com.aplicacao.sanduiche.Entregas.list()}" optionKey="id" required="" value="${pedidosInstance?.entrega?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidosInstance, field: 'observacao', 'error')} ">
	<label for="observacao">
		<g:message code="pedidos.observacao.label" default="Observacao" />
		
	</label>
	<g:textField name="observacao" value="${pedidosInstance?.observacao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidosInstance, field: 'total', 'error')} required" style="display: none">
	<label for="total">
		<g:message code="pedidos.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" value="${fieldValue(bean: pedidosInstance, field: 'total')}" required=""/>
</div>

