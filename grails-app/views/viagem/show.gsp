
<%@ page import="controle_viagens.Viagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'viagem.label', default: 'Viagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-viagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-viagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list viagem">
			
				<g:if test="${viagemInstance?.ida}">
				<li class="fieldcontain">
					<span id="ida-label" class="property-label"><g:message code="viagem.ida.label" default="Ida" /></span>
					
						<span class="property-value" aria-labelledby="ida-label"><g:formatDate date="${viagemInstance?.ida}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.volta}">
				<li class="fieldcontain">
					<span id="volta-label" class="property-label"><g:message code="viagem.volta.label" default="Volta" /></span>
					
						<span class="property-value" aria-labelledby="volta-label"><g:formatDate date="${viagemInstance?.volta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.objetivo}">
				<li class="fieldcontain">
					<span id="objetivo-label" class="property-label"><g:message code="viagem.objetivo.label" default="Objetivo" /></span>
					
						<span class="property-value" aria-labelledby="objetivo-label"><g:fieldValue bean="${viagemInstance}" field="objetivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="viagem.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${viagemInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.passageiro}">
				<li class="fieldcontain">
					<span id="passageiro-label" class="property-label"><g:message code="viagem.passageiro.label" default="Passageiro" /></span>
					
						<span class="property-value" aria-labelledby="passageiro-label"><g:link controller="passageiro" action="show" id="${viagemInstance?.passageiro?.id}">${viagemInstance?.passageiro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.origem}">
				<li class="fieldcontain">
					<span id="origem-label" class="property-label"><g:message code="viagem.origem.label" default="Origem" /></span>
					
						<span class="property-value" aria-labelledby="origem-label"><g:link controller="endereco" action="show" id="${viagemInstance?.origem?.id}">${viagemInstance?.origem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${viagemInstance?.destino}">
				<li class="fieldcontain">
					<span id="destino-label" class="property-label"><g:message code="viagem.destino.label" default="Destino" /></span>
					
						<span class="property-value" aria-labelledby="destino-label"><g:link controller="endereco" action="show" id="${viagemInstance?.destino?.id}">${viagemInstance?.destino?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:viagemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${viagemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
