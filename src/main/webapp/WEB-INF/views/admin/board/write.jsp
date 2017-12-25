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
<c:url value="${url}" var="write"></c:url>
	<div class="container">
		<form:form class="form-horizontal" action="${url}/create" modelAttribute="posting" 
		method="POST" id="write-form" enctype="multipart/form-data">
			<form:input type="hidden" path="parentId"/>
			<form:input type="hidden" path="typeId" id="posting-type" value="1"/>
			<div class="form-group">
				<label for="title" class="col-sm-1 control-label">제목</label>
				<div class="col-sm-11">
					<form:input class="form-control" path="title" id="title"/>	
				</div>
			</div>
			<div class="form-group">
				<label for="body" class="col-sm-1 control-label">내용</label>
				<div class="col-sm-11">
					<form:textarea path="body" id="body" style="width: 100%; height: 350px;" />	
				</div>
			</div>
		</form:form >
		<!-- 
		<form:form id="file-form" enctype="multipart/form-data" modelAttribute="fileTransfer" action="${url}/create_files" method="POST">	
			<div class="form-group">
				<label for="body" class="col-sm-1 control-label" >파일 첨부</label>
				<div class="col-sm-11" id="fileInputs">
					<input class="file" type="file" id="file0"  name="files[0]"/>	
				</div>
			</div>
		</form:form>
		 -->
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-11 btn-container">
					<button class="btn btn-default" onclick="submitContents();">저장</button>
					<a href="${write}?bType=${bType}" class="btn btn-default">취소</a>
				</div>
			</div>
		<input type="hidden" value="0" id="index"/>
	</div>	
</div>
<s:url value="/js/board/write.js" var="js_url_write" />
<script type="text/javascript" src="${js_url_write}" charset="UTF-8"></script>
<script type="text/javascript">
	$(document).on("change", "input[type='file']", function(){
		var index = $("#index").val();
		var fileId = $(this).attr('id');
		var fileIndex = fileId.split('file')[1];
		var file = pathToFile($(this).val());
		var fileName = file.name+"."+file.extension;
		var fileNameHtml = '<div>'+fileName+' <span class="glyphicon glyphicon-remove" fileId="'+ fileId +'" onclick="deleteNewFile(this)"></span></div>';
		$(this).addClass('hide');
		$("#fileInputs").append(fileNameHtml);
		addFileInput();
	});
	
	function deleteNewFile(ele){
		var fileId = "#"+$(ele).attr('fileId');
		$(ele).parent().remove();
		$(fileId).remove();
	
		return false;
	}
	function addFileInput(){
		var index = $("#index").val();
		var newIndex = Number(index) + 1;
		$("#index").val(newIndex);
		var fileHtml = '<input class="file" name="files['+ newIndex +']" type="file" id="file' + newIndex + '"></input>';
		$("#fileInputs").append(fileHtml);
	}
	function pathToFile(str)
	{
	    var nOffset = Math.max(0, Math.max(str.lastIndexOf('\\'), str.lastIndexOf('/')));
	    var eOffset = str.lastIndexOf('.');
	    if(eOffset < 0)
	    {
	        eOffset = str.length;
	    }
	    return {isDirectory: eOffset == str.length,
	            path: str.substring(0, nOffset),
	            name: str.substring(nOffset > 0 ? nOffset + 1 : nOffset, eOffset),
	            extension: str.substring(eOffset > 0 ? eOffset + 1 : eOffset, str.length)};
	}
	
</script>