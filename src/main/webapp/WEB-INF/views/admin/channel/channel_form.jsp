<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.0 ) - Date 2015-12-09 ( Time 16:26:40 ) -->

<div class="wrap">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/input" prefix="input"%>
<%@ taglib tagdir="/WEB-INF/tags/trams" prefix="trams_c"%>

	<div class="container">
		<div class="search_box admin_user">
			<div class="title">
				회원관리
			</div>
		</div>
		
		<div id="user_form">
		
	    	<s:url value="${saveAction}" var="url_form_submit" />
			<form:form class="form-horizontal" modelAttribute="channel" cssClass="form-horizontal" method="POST" action="${url_form_submit}">
				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<c:if test="${mode != 'create'}">
				<!-- Store data in hidden fields in order to be POST even if the field is disabled -->
				<form:hidden path="id" />
				<form:hidden path="title" />
				<form:hidden path="introduce" />
				<form:hidden path="isShow" />
				</c:if>
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
  						<form:input id="users_name" path="title" class="form-control" maxLength="11"  />
						<form:errors id="users_name_errors" path="title" cssClass="label label-danger" />
					</div>
				</div>
 
 
				<!-- DATA FIELD : email -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_email" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
  						<form:input id="users_email" path="introduce" class="form-control" maxLength="11"  />
						<form:errors id="users_email_errors" path="introduce" cssClass="label label-danger" />

					</div>
				</div>
 
				<!-- DATA FIELD : job -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_job" class="col-sm-2 control-label">직업</label>
					<div class="col-sm-10">
  						<form:input id="users_job" path="isShow" class="form-control" maxLength="11"  />
						<form:errors id="users_job_errors" path="isShow" cssClass="label label-danger" />

					</div>
				</div>
 
 
				
 			

 
 				<div class="form-group">
 					<label for="users_heartStateId" class="col-sm-2 control-label">작성 채널 목록</label>
					<div class=" col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="channel_list" value="/admin/manage_chanels" />
							<a role="button" class="btn btn-default btn-block" href="${channel_list}">목록보기</a>
						</c:if>
					</div>
				</div>
 				
				<!-- ACTION BUTTONS -->
				<div class="form-group">
					<div class="col-sm-offset-6 col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="deleteButtonURL" value="/admin/manage_users/delete/${users.id}" />
							<a role="button" class="btn btn-danger btn-block" href="${deleteButtonURL}">삭제</a>
						</c:if>
					</div>
    				<div class=" col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<s:url var="cancelButtonURL" value="/admin/manage_users" />
						<a role="button" class="btn btn-default btn-block" href="${cancelButtonURL}">목록</a>
					</div>
    				<div class="col-sm-2">
						<!-- "SAVE" button ( SUBMIT button ) -->
						<button type="submit" class="btn btn-primary  btn-block">저장</button>
					</div>
				</div>
				
			</form:form>
	    </div>
	    
	</div>	
</div>
