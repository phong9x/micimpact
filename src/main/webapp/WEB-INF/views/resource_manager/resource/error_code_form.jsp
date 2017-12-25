<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.1 ) - Date 2015-04-29 ( Time 14:15:53 ) -->

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
		<div style="float: left">
			<div class="list-group">
				<a href="/res/res_manage/error_code" class="list-group-item active">에러코드관리</a>
				<a href="/res/res_manage/domain" class="list-group-item">도메인관리</a>
				<a href="/res/res_manage/file" class="list-group-item">파일관리</a>
				<a href="/res/res_manage/locale" class="list-group-item">언어관리</a>
			</div>
		</div>
		
		<form:form class="form-horizontal" action="/res/res_manage/error_code/register/complete" modelAttribute="error" 
		method="POST" id="write-form">
		<div style="width: 700px; float: left; margin-left: 30px;">
			 <legend class="legende">에러코드 등록</legend>
			<table class="table table-bordered">
				<thead>
				    <tr>
				      <th>에러코드</th>
				      <th>에러메세지</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				      <td><form:input  type="text" class="form-control" placeholder="에러코드" path="errorCode" id="errorCode"/></td>
				      <td><form:input  type="text" class="form-control" placeholder="에러메세지" path="errorMassage" id="errorMassage"/></td>
				    </tr>
				</tbody>
			</table>
			<div class="form-group" style="float: right; width: 156px;">
				<div class="col-sm-offset-1 col-sm-11">
					<button class="btn btn-default" type="submit">저장</button>
					<a href="/res/res_manage/error_code" class="btn btn-default">취소</a>
				</div>
			</div>
		</div>
		</form:form>
		<div style="clear: left;"></div>
	</div>	
</div>
