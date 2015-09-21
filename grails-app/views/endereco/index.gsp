
<%@ page import="controle_viagens.Endereco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-endereco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-endereco" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="cep" title="${message(code: 'endereco.cep.label', default: 'Cep')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'endereco.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="logradouro" title="${message(code: 'endereco.logradouro.label', default: 'Logradouro')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="complemento" title="${message(code: 'endereco.complemento.label', default: 'Complemento')}" />
					
						<g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "cep")}</g:link></td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
					
						<td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enderecoInstanceCount ?: 0}" params="${params}" />
			</div>
		</div>
	</body>
</html>
