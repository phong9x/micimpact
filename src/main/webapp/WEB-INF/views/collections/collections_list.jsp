<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.0 ) - Date 2015-12-09 ( Time 16:26:40 ) -->

<div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/display" prefix="display"%>


	<div class="container">
		<fieldset class="col-sm-12 bordure">
			<legend class="legende"><s:message code="collections"/></legend>
		
			<util:message message="${message}" messages="${messages}" />

			<table class="table table-striped">
				<thead>
					<tr>
						<th><s:message code="collections.id"/></th>
						<th><s:message code="collections.cardId1"/></th>
						<th><s:message code="collections.cardId2"/></th>
						<th><s:message code="collections.name"/></th>
						<th><s:message code="collections.body"/></th>
						<th><s:message code="collections.reveal"/></th>
						<s:url var="url_create" value="/collections/form"  />
						<th><a class="btn btn-info" href='${url_create}'><s:message code="create"/></a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="collections">
						<tr>
							<td>${collections.id}</td>
							<td>${collections.cardId1}</td>
							<td>${collections.cardId2}</td>
							<td>${collections.name}</td>
							<td>${collections.body}</td>
							<td>${collections.reveal}</td>
							<s:url var="url_update" value="/collections/form/${collections.id}"/>
							<td><a class="btn btn-info" href="${url_update}"><s:message code="edit"/></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</div>
</div>