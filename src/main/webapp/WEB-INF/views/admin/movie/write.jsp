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
<c:url value="/" var="root"></c:url>
	<div class="container">
		<div class="search_box admin_user">
			<div class="title">
				동영상 관리
			</div>
		</div>
		<c:if test="${message ne null}" >
		 <div class="alert alert-danger" style="width: 100%; display: inline-block;">
		 	<a class="close" data-dismiss="alert">x</a>
		 	<strong>${message}</strong>
		</div>
		</c:if>
		
		<form:form class="form-horizontal" action="${root}admin/movie_create"  method="POST" id="write-form" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="body" class="col-sm-2 control-label" >파일 첨부</label>
				<div class="col-sm-10" id="fileInputs">
					<input class="file" type="file" id="file0"  name="movie"/>	
				</div>
			</div>
			
			<div class="col-sm-2" style="float: right;">
				<!-- "SAVE" button ( SUBMIT button ) -->
				<button type="submit" class="btn btn-primary btn-lg btn-block">save</button>
			</div>
		</form:form >
	</div>	
</div>

<script type="text/javascript">
	
	
</script>
