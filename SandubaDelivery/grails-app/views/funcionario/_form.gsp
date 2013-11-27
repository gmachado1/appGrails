<%@ page import="br.com.aplicacao.sanduiche.Funcionario" %>



<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="funcionario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" required="" value="${funcionarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'sobrenome', 'error')} required">
	<label for="sobrenome">
		<g:message code="funcionario.sobrenome.label" default="Sobrenome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sobrenome" maxlength="30" required="" value="${funcionarioInstance?.sobrenome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'celular', 'error')} required">
	<label for="celular">
		<g:message code="funcionario.celular.label" default="Celular" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="celular" required="" value="${funcionarioInstance?.celular}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'error')} ">
	<label for="endereco">
		<g:message code="funcionario.endereco.label" default="Endereco" />
		
	</label>
	<g:select id="endereco" name="endereco.id" from="${br.com.aplicacao.sanduiche.Enderecos.list()}" optionKey="id" value="${funcionarioInstance?.endereco?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'contratado', 'error')} required">
	<label for="contratado">
		<g:message code="funcionario.contratado.label" default="Contratado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="contratado" precision="day"  value="${funcionarioInstance?.contratado}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'salario', 'error')} required">
	<label for="salario">
		<g:message code="funcionario.salario.label" default="Salario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="salario" value="${fieldValue(bean: funcionarioInstance, field: 'salario')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'placaMoto', 'error')} ">
	<label for="placaMoto">
		<g:message code="funcionario.placaMoto.label" default="Placa Moto" />
		
	</label>
	<g:textField name="placaMoto" value="${funcionarioInstance?.placaMoto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'demitido', 'error')} ">
	<label for="demitido">
		<g:message code="funcionario.demitido.label" default="Demitido" />
		
	</label>
	<g:datePicker name="demitido" precision="day"  value="${funcionarioInstance?.demitido}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'numeroMultas', 'error')} required">
	<label for="numeroMultas">
		<g:message code="funcionario.numeroMultas.label" default="Numero Multas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroMultas" type="number" min="0" value="${funcionarioInstance.numeroMultas}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'tipoFuncionario', 'error')} required">
	<label for="tipoFuncionario">
		<g:message code="funcionario.tipoFuncionario.label" default="Tipo Funcionario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoFuncionario" from="${br.com.aplicacao.sanduiche.TipoFucionarioEnum?.values()}" keys="${br.com.aplicacao.sanduiche.TipoFucionarioEnum.values()*.name()}" required="" value="${funcionarioInstance?.tipoFuncionario?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'carteira', 'error')} ">
	<label for="carteira">
		<g:message code="funcionario.carteira.label" default="Carteira" />
		
	</label>
	<g:textField name="carteira" value="${funcionarioInstance?.carteira}"/>
</div>

