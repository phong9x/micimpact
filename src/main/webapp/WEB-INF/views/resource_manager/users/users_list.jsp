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
<%@ taglib tagdir="/WEB-INF/tags/display" prefix="display"%>
<%@ taglib tagdir="/WEB-INF/tags/trams" prefix="trams_c"%>

	<div class="container">
		<fieldset class="col-sm-12 bordure">		
			<legend class="legende">유저 권한 관리
				<div class="search_box">
						<div class="row">
							<select class="form-control" id="options">
								<option value="0">ALL</option>
								<option value="1">아이디</option>
								<option value="2">이름</option>
								<option value="3">전화번호</option>
								<option value="4">이메일</option>
							</select>
						<div class="col-lg-6" >
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1">
									<span class="glyphicon glyphicon-search"></span>
								</span>
								<input type="text" name="keyword" class="form-control" placeholder=""  onkeypress="if(event.keyCode==13) {search(); return false;}">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="search()">검색</button>
								</span>
							</div><!-- /input-group -->
						</div><!-- /.col-lg-6 -->
					</div><!-- /.row -->
				</div>
			</legend>
		
			<util:message message="${message}" messages="${messages}" />

			<table class="table table-striped">
				<thead>
					<tr>
						<th width="10%"><s:message code="users.id"/></th>
						<th width="15%"><s:message code="users.username"/></th>
						<th width="15%"><s:message code="users.name"/></th>
						<th width="20%"><s:message code="users.email"/></th>
						<th width="15%"><s:message code="users.phone"/></th>
						<th width="25%">
							
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="users">
						<tr>
							<td>${users.id}</td>
							<td>${users.username}</td>
							<td>${users.name}</td>
							<td>${users.email}</td>
							<td>${users.phone}</td>
							<td style="text-align: center;">
								<s:url var="url_update" value="/res/manage_users/form/${users.id}"/>
								<s:url var="deleteButtonURL" value="/res/manage_users/delete/${users.id}" />
								<a class="btn btn-info" href="${url_update}"><s:message code="edit"/></a>
								<a role="button" class="btn btn-danger" href="${deleteButtonURL}"><s:message code="delete"/></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" />
		</fieldset>
		<SCRIPT type="text/javascript">
			$(function(){
				if (GetQueryStringParams('option')!=null)
				{
					$('#options option[value="'+GetQueryStringParams('option')+'"]').attr("selected",true);
				}
				
				if (GetQueryStringParams('keyword')!=null)
				{
					$("input[name=keyword]").val(GetQueryStringParams('keyword'))
				}
			});
			function search(){ 
				
				if($("input[name=keyword]").val().length > 0 && $("#options").val() != 0 ){
					var url = "/res/manage_users/search?option="+ $("#options").val() + "&keyword=" + $("input[name=keyword]").val();
					location.href = url;
				}else{
					location.href = "/res/manage_users/";
				}
			}
		</SCRIPT>
	</div>
</div>
