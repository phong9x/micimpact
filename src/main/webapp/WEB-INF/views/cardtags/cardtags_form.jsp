<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.0 ) - Date 2015-12-09 ( Time 16:26:39 ) -->

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
		
			
	    	<s:url value="${saveAction}" var="url_form_submit" />
			<form:form class="form-horizontal" modelAttribute="cardTags" cssClass="well form-horizontal" method="POST" action="${url_form_submit}">
				<form:errors path="*" cssClass="alert alert-danger" element="div" />

<c:if test="${mode != 'create'}">
				<!-- Store data in hidden fields in order to be POST even if the field is disabled -->
</c:if>
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="cardTags_name" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
  						<form:input id="cardTags_id" path="id" class="form-control" maxLength="11"  />
						<form:errors id="cardTags_id_errors" path="id" cssClass="label label-danger" />

					</div>
				</div>
 
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="cardTags_name" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
  						<form:input id="cardTags_name" path="name" class="form-control" maxLength="64"  />
						<form:errors id="cardTags_name_errors" path="name" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : cardId -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="cardTags_cardId" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
  						<form:input id="cardTags_cardId" path="cardId" class="form-control" maxLength="11"  />
						<form:errors id="cardTags_cardId_errors" path="cardId" cssClass="label label-danger" />

					</div>
				</div>

 

				<!-- ACTION BUTTONS -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="deleteButtonURL" value="/cardTags/delete/no_primary_key_for_entity_CardTags" />
							<a role="button" class="btn btn-danger btn-block" href="${deleteButtonURL}">Delete</a>
						</c:if>
					</div>
    				<div class="col-sm-offset-4 col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<s:url var="cancelButtonURL" value="/cardTags" />
						<a role="button" class="btn btn-default btn-block" href="${cancelButtonURL}">cancel</a>
					</div>
    				<div class="col-sm-2">
						<!-- "SAVE" button ( SUBMIT button ) -->
						<button type="submit" class="btn btn-primary btn-lg btn-block">save</button>
					</div>
				</div>
			</form:form>
	    </fieldset>
	</div>	
</div>
