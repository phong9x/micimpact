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
<c:url value="/" var="root"></c:url>
	<div class="container">
		<div class="search_box admin_user">
			<div class="title">
				회원관리
			</div>
			<div class="form-inline">
				<div class="form_group">
					<select class="form-control" id="option">
						<option value="0">선택</option>
						<option value="4">아이디</option>
						<option value="2">이름</option>
					</select>
					
<%-- 					<select class="form-control" id="sort_select"> --%>
<!-- 						<option value="id">가입일순</option> -->
<!-- 						<option value="locale">국가별</option> -->
<!-- 						<option value="late">등급별</option> -->
<%-- 					</select> --%>
				
					<div class="input-group">
						<span class="input-group-addon" id="sizing-addon1">
							<span class="glyphicon glyphicon-search"></span>
						</span>
						<input type="text" name="keyword" value="${keyword }" class="form-control" placeholder=""  onkeypress="if(event.keyCode==13) {search(); return false;}">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" onclick="search()">검색</button>
						</span>
					</div><!-- /input-group -->
				</div>
			</div><!-- /.row -->
		</div>
		
	
		<util:message message="${message}" messages="${messages}" />

		<table class="table table-striped">
			<thead>
				<tr>
					<th width="25%">회원번호</th>
					<th width="25%">이름</th>
					<th width="25%">아이디(이메일)</th>
					<th width="25%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="users">
					<tr>
						<c:url var="url_show" value="/admin/manage_users/${users.id}"/>
						<td><a href="${url_show}">${users.id}</a></td>
						<td><a href="${url_show}">${users.name}</a></td>
						<td><a href="${url_show}">${users.email}</a></td>
						<td style="text-align: center;">
							<s:url var="deleteButtonURL" value="/admin/manage_users/delete/${users.id}" />
							<a role="button" class="btn btn-danger" href="${deleteButtonURL}">바로삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" param_url="state=${state}"/>
		
		<SCRIPT type="text/javascript">
			$(function(){
				if (GetQueryStringParams('option')!=null)
				{
					$('#options option[value="'+GetQueryStringParams('option')+'"]').attr("selected",true);
				}
				
				if (GetQueryStringParams('keyword')!=null)
				{
					//$("input[name=keyword]").val(GetQueryStringParams('keyword'))
				}
				if (GetQueryStringParams('sort')!=null)
				{
					$('#sort_select').val(GetQueryStringParams('sort'));
				}
			});
			function search(){ 
				
				if($("input[name=keyword]").val().length > 0 && $("#option").val() != 0 ){
					var url = "${root}admin/manage_users/search?option="+ $("#option").val() + "&keyword=" + $("input[name=keyword]").val();
					location.href = url;
				}else if($("input[name=keyword]").val().length == 0){
					alert("검색어를 입력해주세요.");
				}else if( $("#option").val() == 0){
					alert("검색조건을 선택해주세요.");
				}
			}

			$('#sort_select').change(function(){
				location.href = "${root}admin/users?sort="+$('#sort_select').val();
			});
			
		</SCRIPT>
	</div>
</div>
