<?xml version="1.0" encoding="UTF-8" standalone="no"?>

<div class="wrap">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/input" prefix="input"%>

	<div class="container">
		<h3></h3>
		<fieldset class="col-sm-12 bordure">
			<legend class="legende">유저 권한 관리</legend>
		
			<util:message message="${message}" messages="${messages}" />
			
	    	<s:url value="${saveAction}" var="url_form_submit" />
			<form:form class="form-horizontal" modelAttribute="users" cssClass="well form-horizontal" method="POST" action="${url_form_submit}">
				<form:errors path="*" cssClass="alert alert-danger" element="div" />

<c:if test="${mode != 'create'}">
				<!-- Store data in hidden fields in order to be POST even if the field is disabled -->
				<form:hidden path="id" />
				<form:hidden path="password" />
</c:if>
 
				<!-- PRIMARY KEY FIELD : id -->
<c:if test="${mode != 'create'}">
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_id" class="col-sm-2 control-label"><s:message code="users.id"/></label>
					<div class="col-sm-10">
						<form:input id="users_id" path="id" class="form-control" maxLength="11" disabled="${mode != 'create'}" />
						<form:errors id="users_id_errors" path="id" cssClass="label label-danger" />

					</div>
				</div>
</c:if>

 
				<!-- DATA FIELD : username -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_username" class="col-sm-2 control-label"><s:message code="users.username"/></label>
					<div class="col-sm-10">
  						<form:input id="users_username" path="username" class="form-control" maxLength="255" readonly="${mode != 'create'}" />
						<form:errors id="users_username_errors" path="username" cssClass="label label-danger" />

					</div>
				</div>
 
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_name" class="col-sm-2 control-label"><s:message code="users.name"/></label>
					<div class="col-sm-10">
  						<form:input id="users_name" path="name" class="form-control" maxLength="255" readonly="${mode != 'create'}" />
						<form:errors id="users_name_errors" path="name" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : email -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_email" class="col-sm-2 control-label"><s:message code="users.email"/></label>
					<div class="col-sm-10">
  						<form:input id="users_email" path="email" class="form-control" maxLength="255"  />
						<form:errors id="users_email_errors" path="email" cssClass="label label-danger" />

					</div>
				</div>

 
				<!-- DATA FIELD : phone -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_phone" class="col-sm-2 control-label"><s:message code="users.phone"/></label>
					<div class="col-sm-10">
  						<form:input id="users_phone" path="phone" class="form-control" maxLength="128"  />
						<form:errors id="users_phone_errors" path="phone" cssClass="label label-danger" />

					</div>
				</div>
<c:if test="${mode != 'create'}">
				<!-- DATA FIELD : createDate -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_createDate" class="col-sm-2 control-label"><s:message code="users.createDate"/></label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${mode == 'create'}">
								<input:date id="users_createDate" name="createDate"/> <!-- DATE type -->
							</c:when>
							<c:otherwise>
								<form:input id="users_phone" path="createDate" class="form-control" maxLength="128" readonly="${mode != 'create'}"  />
							</c:otherwise>
						</c:choose>
						<form:errors id="users_createDate_errors" path="createDate" cssClass="label label-danger"/>

					</div>
				</div>

 
				<!-- DATA FIELD : updateDate -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_updateDate" class="col-sm-2 control-label"><s:message code="users.updateDate"/></label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${mode == 'create'}">
								<input:date id="users_updateDate" name="updateDate" readOnly="${mode != 'create'}" />  <!-- DATE type -->
							</c:when>
							<c:otherwise>
								<form:input id="users_phone" path="updateDate" class="form-control" maxLength="128" readonly="${mode != 'create'}"  />
							</c:otherwise>
						</c:choose>
  						
						<form:errors id="users_updateDate_errors" path="updateDate" cssClass="label label-danger" />

					</div>
				</div>

 
 				<!-- DATA FIELD : roleId -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_roleId" class="col-sm-2 control-label"><s:message code="users.roleId"/></label>
					<div class="col-sm-10">
  						<form:select id="users_roleId" path="roleId" cssClass="form-control">
							<form:option value=""></form:option>
							<form:options items="${listOfUserRolesItems}" itemValue="value" itemLabel="label" />
						</form:select>
						<form:errors id="users_roleId_errors" path="roleId" cssClass="label label-danger" />

					</div>
				</div>

 </c:if>

				<!-- ACTION BUTTONS -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="deleteButtonURL" value="/res/manage_users/delete/${users.id}" />
							<a role="button" class="btn btn-danger btn-block" href="${deleteButtonURL}"><s:message code="delete"/></a>							
						</c:if>
					</div>
					
    				<div class="col-sm-offset-2 col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<s:url var="cancelButtonURL" value="/res/manage_users" />
						<a role="button" class="btn btn-default btn-block" href="${cancelButtonURL}"><s:message code="cancel"/></a>
					</div>
					<div class="col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<BUTTON type="button" class="btn btn-default btn-block" onclick="pswReset()">RESET</BUTTON>
					</div>
    				<div class="col-sm-2">
						<!-- "SAVE" button ( SUBMIT button ) -->
						<button type="submit" class="btn btn-primary btn-default btn-block"><s:message code="save"/></button>
					</div>
				</div>
			</form:form>
	    </fieldset>
	    <SCRIPT type="text/javascript">
		    function pswReset(){
				var jsonData = JSON.stringify({
					"user":$("#id").val()});
				
				$.ajax({
					type:"post",
					url:"/passwordReset",
					data:jsonData,
					contentType:"application/json; charset=utf-8",
					dataType:"json",
					success:function(req){
						if (req.success) {
							alert(req.message);
						}else{
							alert(req.message);
						}
					},error: function(err){
						alert(err);
					}
				});
				
			}
	    </SCRIPT>
	</div>	
</div>
