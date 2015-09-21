<%@ page import="controle_viagens.Viagem" %>



<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'ida', 'error')} required">
	<label for="ida">
		<g:message code="viagem.ida.label" default="Ida" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="ida" precision="minute"  value="${viagemInstance?.ida}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'volta', 'error')} required">
	<label for="volta">
		<g:message code="viagem.volta.label" default="Volta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="volta" precision="minute"  value="${viagemInstance?.volta}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'objetivo', 'error')} required">
	<label for="objetivo">
		<g:message code="viagem.objetivo.label" default="Objetivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="objetivo" cols="40" rows="5" required="" value="${viagemInstance?.objetivo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'passageiro', 'error')} required">
	<label for="passageiro">
		<g:message code="viagem.passageiro.label" default="Passageiro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="passageiro" name="passageiro.id" from="${controle_viagens.Passageiro.list()}" optionKey="id" required="" value="${viagemInstance?.passageiro?.id}" class="many-to-one"/>
	<g:link class="create" controller="passageiro" action="create">${message(code: 'default.new.label', args: [message(code: 'passageiro.label', default: 'Passageiro')])}</g:link>
	
</div>

<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'origem', 'error')} required">
	<label for="origem">
		<g:message code="viagem.origem.label" default="Origem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="origem" name="origem.id" from="${controle_viagens.Endereco.list()}" optionKey="id" required="" value="${viagemInstance?.origem?.id}" class="many-to-one"/>
	<g:link class="create" controller="endereco" action="create">${message(code: 'default.new.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: viagemInstance, field: 'destino', 'error')} required">
	<label for="destino">
		<g:message code="viagem.destino.label" default="Destino" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="destino" name="destino.id" from="${controle_viagens.Endereco.list()}" optionKey="id" required="" value="${viagemInstance?.destino?.id}" class="many-to-one"/>
	<g:link class="create" controller="endereco" action="create">${message(code: 'default.new.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>

</div>

