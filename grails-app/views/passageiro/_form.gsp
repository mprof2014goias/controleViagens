<%@ page import="controle_viagens.Passageiro" %>



<div class="fieldcontain ${hasErrors(bean: passageiroInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="passageiro.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${passageiroInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passageiroInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="passageiro.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" maxlength="11" pattern="${passageiroInstance.constraints.cpf.matches}" required="" value="${passageiroInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passageiroInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="passageiro.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" maxlength="11" required="" value="${passageiroInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passageiroInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="passageiro.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${passageiroInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: passageiroInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="passageiro.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endereco" name="endereco.id" from="${controle_viagens.Endereco.list()}" optionKey="id" required="" value="${passageiroInstance?.endereco?.id}" class="many-to-one"/>

</div>

