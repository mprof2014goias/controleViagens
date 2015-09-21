
<%@ page import="controle_viagens.Endereco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-endereco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-endereco" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list endereco">
			
				<g:if test="${enderecoInstance?.cep}">
				<li class="fieldcontain">
					<span id="cep-label" class="property-label"><g:message code="endereco.cep.label" default="Cep" /></span>
					
						<span class="property-value" aria-labelledby="cep-label"><g:fieldValue bean="${enderecoInstance}" field="cep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="endereco.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${enderecoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.logradouro}">
				<li class="fieldcontain">
					<span id="logradouro-label" class="property-label"><g:message code="endereco.logradouro.label" default="Logradouro" /></span>
					
						<span class="property-value" aria-labelledby="logradouro-label"><g:fieldValue bean="${enderecoInstance}" field="logradouro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="endereco.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${enderecoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.complemento}">
				<li class="fieldcontain">
					<span id="complemento-label" class="property-label"><g:message code="endereco.complemento.label" default="Complemento" /></span>
					
						<span class="property-value" aria-labelledby="complemento-label"><g:fieldValue bean="${enderecoInstance}" field="complemento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.bairro}">
				<li class="fieldcontain">
					<span id="bairro-label" class="property-label"><g:message code="endereco.bairro.label" default="Bairro" /></span>
					
						<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${enderecoInstance}" field="bairro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="endereco.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:fieldValue bean="${enderecoInstance}" field="municipio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enderecoInstance?.uf}">
				<li class="fieldcontain">
					<span id="uf-label" class="property-label"><g:message code="endereco.uf.label" default="Uf" /></span>
					
						<span class="property-value" aria-labelledby="uf-label"><g:fieldValue bean="${enderecoInstance}" field="uf"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:enderecoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${enderecoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
