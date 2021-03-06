<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.0 ) - Date 2015-12-09 ( Time 16:26:40 ) -->

<div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/input" prefix="input"%>

	<div class="container">
		<fieldset class="col-sm-12 bordure">
			<legend class="legende"><s:message code="collections"/></legend>
		
			<util:message message="${message}" messages="${messages}" />
			
	    	<s:url value="${saveAction}" var="url_form_submit" />
			<form:form class="form-horizontal" modelAttribute="collections" cssClass="well form-horizontal" method="POST" action="${url_form_submit}">
				<form:errors path="*" cssClass="alert alert-danger" element="div" />

<c:if test="${mode != 'create'}">
				<!-- Store data in hidden fields in order to be POST even if the field is disabled -->
				<form:hidden path="id" />
</c:if>
 
				<!-- PRIMARY KEY FIELD : id -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_id" class="col-sm-2 control-label"><s:message code="collections.id"/></label>
					<div class="col-sm-10">
						<form:input id="collections_id" path="id" class="form-control" maxLength="11" disabled="${mode != 'create'}" />
						<form:errors id="collections_id_errors" path="id" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : cardId1 -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_cardId1" class="col-sm-2 control-label"><s:message code="collections.cardId1"/></label>
					<div class="col-sm-10">
  						<form:input id="collections_cardId1" path="cardId1" class="form-control" maxLength="11"  />
						<form:errors id="collections_cardId1_errors" path="cardId1" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : cardId2 -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_cardId2" class="col-sm-2 control-label"><s:message code="collections.cardId2"/></label>
					<div class="col-sm-10">
  						<form:input id="collections_cardId2" path="cardId2" class="form-control" maxLength="11"  />
						<form:errors id="collections_cardId2_errors" path="cardId2" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_name" class="col-sm-2 control-label"><s:message code="collections.name"/></label>
					<div class="col-sm-10">
  						<form:input id="collections_name" path="name" class="form-control" maxLength="256"  />
						<form:errors id="collections_name_errors" path="name" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : body -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_body" class="col-sm-2 control-label"><s:message code="collections.body"/></label>
					<div class="col-sm-10">
  						<form:input id="collections_body" path="body" class="form-control" maxLength="512"  />
						<form:errors id="collections_body_errors" path="body" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : reveal -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="collections_reveal" class="col-sm-2 control-label"><s:message code="collections.reveal"/></label>
					<div class="col-sm-10">
  						<form:input id="collections_reveal" path="reveal" class="form-control" maxLength="11"  />
						<form:errors id="collections_reveal_errors" path="reveal" cssClass="label label-danger" />

					</div>
				</div>

 

				<!-- ACTION BUTTONS -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="deleteButtonURL" value="/collections/delete/${collections.id}" />
							<a role="button" class="btn btn-danger btn-block" href="${deleteButtonURL}"><s:message code="delete"/></a>
						</c:if>
					</div>
    				<div class="col-sm-offset-4 col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<s:url var="cancelButtonURL" value="/collections" />
						<a role="button" class="btn btn-default btn-block" href="${cancelButtonURL}"><s:message code="cancel"/></a>
					</div>
    				<div class="col-sm-2">
						<!-- "SAVE" button ( SUBMIT button ) -->
						<button type="submit" class="btn btn-primary btn-lg btn-block"><s:message code="save"/></button>
					</div>
				</div>
			</form:form>
	    </fieldset>
	</div>	
</div>
