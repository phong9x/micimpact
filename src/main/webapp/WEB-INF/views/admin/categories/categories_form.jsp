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
<%@ taglib tagdir="/WEB-INF/tags/trams" prefix="trams_c"%>
<c:url value="/js/custom.js" var="custom_js"></c:url>
	<script type="text/javascript" src="${custom_js}"><jsp:text/></script>
	<div class="container">
		<div class="search_box admin_user">
			<div class="title">
				동영상 관리
			</div>
		</div>
		
		<div class="form-horizontal">
		<table class="table row">
			
			<tbody>

				<form method="post" enctype="multipart/form-data">
					<tr >
						<td class="title"> 
							<DIV class="" style="margin-top: 10px">카테고리 명</DIV>
							<DIV class="" style="margin-top: 10px">이미지</DIV>
					    </td>
						<td>
							<DIV class="form-group"><input type="text" name="name" class="form-control" value="${i.name }" ></DIV>
							<DIV class="form-group"><input type="text" id="file_name_1" name="imageUrl" class="form-control" value="${i.imageUrl }" ></DIV>
						</td>
						<td>
							<DIV class="form-group">&#160;</DIV>
							<DIV class="form-group">
								<button type="button" class="btn btn-default" style="margin-top: 13px" onclick="click_upload('1')">이미지 등록</button>
								<input type="file" id="file_1" name="file" accept="image/*" class="form-control hidden" value="${i.imageUrl }" onchange="loadFile(event,'1')" >
							</DIV>
						</td>

					</tr>
					<tr >
						<td class="title"> 
							&#160;
					    </td>
						<td>
							<button  class="btn btn-default" >추가</button>
						</td>
						<td>
							&#160;
						</td>

					</tr>
						</form>		

			</tbody>
		</table>
		</div>
	</div>	
</div>
