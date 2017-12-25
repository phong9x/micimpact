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
								신고관리
			</div>
		</div>
		<div class="text-left">
				<div class="" style="display: inline-block; vertical-align; middle;">
						<!-- Nav tabs -->
					  <ul class="nav nav-tabs" >
					    <li  ><a href="${root}admin/report/comment" aria-controls="home" >댓글 신고</a></li>
					    <li  class="active"><a href="${root}admin/report/card" aria-controls="profile" >컨텐츠 신고</a></li>
					  </ul>
			  	</div>
		  </div>
		
		<util:message message="${message}" messages="${messages}" />
		<form method="post">
		<table class="table table-striped">
			<thead>
				<tr>
	
					<th width="15%">닉네임</th>
					<th width="55%">내용</th>
					<th width="10%">신고횟수</th>
					<th width="25%">관리</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="i">
					<tr>
						<c:url var="url_show" value="/admin/channel/edit/${i.id}"/>
						<td>${i.name}</td>
						<td>${i.body}</td>
						<td>${i.report}</td>
						<td style="text-align: center;">
							<s:url var="deleteButtonURL" value="/admin/report?delete=${i.commentId}" />
							<a class="btn btn-danger" href="javascript:void(0)" onclick="deleteCard('${i.commentId}')">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${totalPages>0 }">
		<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${totalPages}" id="" />
		</c:if>
		</form>
	</div>
	
	<SCRIPT type="text/javascript">
	function deleteCard(id) {
		if (confirm("해당 댓글을 삭제하시겠습니까?")) {
			location.href="${root}admin/report/card?delete="+id;
		}
	}

	</SCRIPT>
</div>
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
