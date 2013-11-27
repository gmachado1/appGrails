<%@ page import="br.com.aplicacao.sanduiche.Produtos" %>



<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produtos.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtosInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="produtos.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: produtosInstance, field: 'preco')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="produtos.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" maxlength="200" value="${produtosInstance?.descricao}"/>
</div>

