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
				전체 채널 관리
			</div>
		</div>
		<util:message message="${message}" messages="${messages}" />
		<form method="post">
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="15%">닉네임</th>
					<th width="35%">내용</th>
					<th width="20%">작성일</th>
					<th width="35%">관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="i">
					<tr>
						<td>${i.userName}</td>
						<td>${i.body}</td>
						<td><fmt:formatDate value="${i.createdAt}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center;">
							
							<c:if test="${i.isShow==1 }">
								<button type="submit" value="${i.id}" name="hide" class="btn btn-primary" >숨기기</button>
							</c:if>
							<c:if test="${i.isShow==0 }">
								<button type="submit" value="${i.id}" name="show" class="btn  btn-success" >보이기</button>
							</c:if>
							<s:url var="deleteButtonURL" value="/admin/report?delete=${i.id}" />
							<a class="btn btn-danger" href="javascript:void(0)" onclick="deleteCard('${id}','${i.id}')">삭제</a>
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
	function deleteCard(card_id,comment_id) {
		if (confirm("삭제하시겠습니까?")) {
			location.href="${root}admin/card_reple/"+card_id+"?delete="+comment_id;
		}
	}

	</SCRIPT>

</div>
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
