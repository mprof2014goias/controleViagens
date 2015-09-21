
<%@ page import="controle_viagens.Viagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'viagem.label', default: 'Viagem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-viagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-viagem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<form class="pesquisar" name="pesquisar" method="get">
				<span class="menuButton">
					<g:textField name="keyword" value="${keyword}" placeholder="${message(code: 'default.pesquisar.label', default: 'Pesquisar')}" />
				</span>
			</form>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="ida" title="${message(code: 'viagem.ida.label', default: 'Ida')}" />
					
						<g:sortableColumn property="volta" title="${message(code: 'viagem.volta.label', default: 'Volta')}" />
					
						<g:sortableColumn property="objetivo" title="${message(code: 'viagem.objetivo.label', default: 'Objetivo')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'viagem.status.label', default: 'Status')}" />
					
						<th><g:message code="viagem.passageiro.label" default="Passageiro" /></th>
					
						<th><g:message code="viagem.origem.label" default="Origem" /></th>
						
						<th><g:message code="viagem.destino.label" default="Destino" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${viagemInstanceList}" status="i" var="viagemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${viagemInstance.id}"><g:formatDate format="dd/MM/yyyy HH:mm" date="${viagemInstance.ida}" /></g:link></td>
					
						<td><g:formatDate format="dd/MM/yyyy HH:mm" date="${viagemInstance.volta}" /></td>
					
						<td>${fieldValue(bean: viagemInstance, field: "objetivo")}</td>
					
						<td>${fieldValue(bean: viagemInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: viagemInstance, field: "passageiro")}</td>
					
						<td>${fieldValue(bean: viagemInstance, field: "origem")}</td>
						
						<td>${fieldValue(bean: viagemInstance, field: "destino")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${viagemInstanceCount ?: 0}" params="${params}" />
			</div>
		</div>
	</body>
</html>
