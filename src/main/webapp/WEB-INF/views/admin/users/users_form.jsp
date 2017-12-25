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
			<form:form class="form-horizontal" modelAttribute="users" cssClass="form-horizontal" method="POST" action="${url_form_submit}">
				<form:errors path="*" cssClass="alert alert-danger" element="div" />

				<c:if test="${mode != 'create'}">
				<!-- Store data in hidden fields in order to be POST even if the field is disabled -->
				<form:hidden path="id" />
				<form:hidden path="password" />
				<form:hidden path="createdAt" />
				<form:hidden path="updatedAt" />
				<form:hidden path="fag" />
				<form:hidden path="facebookToken" />
				<form:hidden path="kakaotalkToken" />
				<form:hidden path="lineToken" />
				<form:hidden path="isWithdrawn" />
				</c:if>
 
				<!-- DATA FIELD : roleId -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_roleId" class="col-sm-2 control-label">권한</label>
					<div class="col-sm-10">
<%--   						<form:input id="users_roleId" path="roleId" class="form-control" maxLength="11"  /> --%>
						<form:select path="roleId" class="form-control">
							<c:forEach var="role" items="${listOfUserRolesItems}">
				 				<form:option value="${role.value}" >${role.label}</form:option>
				 			</c:forEach>
						</form:select>
						<form:errors id="users_roleId_errors" path="roleId" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : name -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-10">
  						<form:input id="users_name" path="name" class="form-control" maxLength="11"  />
						<form:errors id="users_name_errors" path="name" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : email -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_email" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
  						<form:input id="users_email" path="email" class="form-control" maxLength="11"  />
						<form:errors id="users_email_errors" path="email" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : birthyear -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_birthyear" class="col-sm-2 control-label">생년</label>
					<div class="col-sm-10">
  						<form:input id="users_birthyear" path="birthyear" class="form-control" maxLength="11"  />
						<form:errors id="users_birthyear_errors" path="birthyear" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : sex -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_sex" class="col-sm-2 control-label">성별</label>
					<div class="col-sm-10">
  						<form:input id="users_sex" path="sex" class="form-control" maxLength="11"  />
						<form:errors id="users_sex_errors" path="sex" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : job -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_job" class="col-sm-2 control-label">직업</label>
					<div class="col-sm-10">
  						<form:input id="users_job" path="job" class="form-control" maxLength="11"  />
						<form:errors id="users_job_errors" path="job" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : city -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_city" class="col-sm-2 control-label">도, 시</label>
					<div class="col-sm-10">
  						<form:input id="users_city" path="city" class="form-control" maxLength="11"  />
						<form:errors id="users_city_errors" path="city" cssClass="label label-danger" />

					</div>
				</div>
 
 				<!-- DATA FIELD : users_tags -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_tags" class="col-sm-2 control-label">관심태그</label>
					<div class="col-sm-10">
  						<input type="text" id="users_tags" name="users_tags" class="form-control"  value="${users_tags}"/>
					</div>
				</div>
				
 				<c:if test="${mode == 'create'}">
				<!-- DATA FIELD : activityPoint -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_activityPoint" class="col-sm-2 control-label">activityPoint</label>
					<div class="col-sm-10">
  						<form:input id="users_activityPoint" path="activityPoint" class="form-control" maxLength="11"  readonly="${mode != 'create'}" />
						<form:errors id="users_activityPoint_errors" path="activityPoint" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : level -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_level" class="col-sm-2 control-label">level</label>
					<div class="col-sm-10">
  						<form:input id="users_level" path="level" class="form-control" maxLength="11"  readonly="${mode != 'create'}" />
						<form:errors id="users_level_errors" path="level" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : point -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_point" class="col-sm-2 control-label">point</label>
					<div class="col-sm-10">
  						<form:input id="users_point" path="point" class="form-control" maxLength="11"  readonly="${mode != 'create'}" />
						<form:errors id="users_point_errors" path="point" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : pushState -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_pushState" class="col-sm-2 control-label">pushState</label>
					<div class="col-sm-10">
  						<form:input id="users_pushState" path="pushState" class="form-control" maxLength="11" readonly="${mode != 'create'}"  />
						<form:errors id="users_pushState_errors" path="pushState" cssClass="label label-danger" />

					</div>
				</div>
 
 
				<!-- DATA FIELD : recentCardId -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_recentCardId" class="col-sm-2 control-label">recentCardId</label>
					<div class="col-sm-10">
  						<form:input id="users_recentCardId" path="recentCardId" class="form-control" maxLength="11"  readonly="${mode != 'create'}" />
						<form:errors id="users_recentCardId_errors" path="recentCardId" cssClass="label label-danger" />

					</div>
				</div>
 				</c:if>
 
				<!-- DATA FIELD : profileUrl -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_profileUrl" class="col-sm-2 control-label">프로필 이미지</label>
					<div class="col-sm-10">
<%--   						<form:input id="users_profileUrl" path="profileUrl" class="form-control" maxLength="11"  readonly="${mode != 'create'}" /> --%>
<%-- 						<form:errors id="users_profileUrl_errors" path="profileUrl" cssClass="label label-danger" /> --%>
						<c:if test="${mode != 'create' && users.profileUrl !=''}"><IMG alt="" src="https://d3i0w6mgohqrwj.cloudfront.net/${users.profileUrl}" style="max-width: 100%;" /></c:if>
					</div>
				</div>
 
 
				<!-- DATA FIELD : heartStateId -->
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_heartStateId" class="col-sm-2 control-label">heartStateId</label>
					<div class="col-sm-10">
  						<form:input id="users_heartStateId" path="heartStateId" class="form-control" maxLength="11"  readonly="${mode != 'create'}" />
						<form:errors id="users_heartStateId_errors" path="heartStateId" cssClass="label label-danger" />

					</div>
				</div>
				
				<div class="form-group">
					<!-- The field label is defined in the messages file (for i18n) -->
					<label for="users_heartStateId" class="col-sm-2 control-label">작성 채널 목록</label>
					<div class="col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="user_channel" value="/admin/user/channel/${users.id}" />
							<a role="button" class="btn btn-default btn-block" href="${user_channel}">목록보기</a>
						</c:if>
					</div>
				</div>

 
				<!-- ACTION BUTTONS -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<c:if test="${mode != 'create'}">
							<!-- "DELETE" button ( HREF link ) -->
							<s:url var="deleteButtonURL" value="/admin/manage_users/delete/${users.id}" />
							<a role="button" class="btn btn-danger btn-block" href="${deleteButtonURL}">삭제</a>
						</c:if>
					</div>
    				<div class="col-sm-offset-4 col-sm-2">
						<!-- "CANCEL" button ( HREF link ) -->
		 				<s:url var="cancelButtonURL" value="/admin/manage_users" />
						<a role="button" class="btn btn-default btn-block" href="${cancelButtonURL}">목록</a>
					</div>
    				<div class="col-sm-2">
						<!-- "SAVE" button ( SUBMIT button ) -->
						<button type="submit" class="btn btn-primary btn-lg btn-block">저장</button>
					</div>
				</div>
			</form:form>
	    </div>
	    
	</div>	
</div>
