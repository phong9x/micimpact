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
<c:url value="${url}" var="write"></c:url>
	<div class="container">

		<table class="table row">
			<thead>
				<tr class="active">
					<th class="col-sm-1">순번</th>
					<th class="col-sm-7">제목</th>
					<th class="col-sm-2">작성자</th>
					<th class="col-sm-2">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="List" varStatus="listCount">
					<tr>
						<c:choose>
							<c:when test="${List.postingTypes.id == 12}">
								<td>중요공지</td>
							</c:when>
							<c:otherwise>
								<td>${List.id}</td>
							</c:otherwise>
						</c:choose>
						<td class="title">
							<c:if test="${List.parentId != List.id}">
								<div class="re_mark"></div>
							</c:if> 
							<a	href="${url}/${List.id}">${List.title}</a>
						</td>
						<td>${List.users.name}</td>
						<td><fmt:formatDate
								value="${List.createdAt}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" param_url="bType=${bType}"/>
		<div class="btn-container">
			<a class="btn btn-default" href="${write}/write?bType=${bType}">글쓰기</a>
		</div>
		
	</div>	
</div>
