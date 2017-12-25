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
					<th width="5%">
						<input type="checkbox" id="check_all" name="delete_all" onclick="check_all_checkbox()" />
					</th>
					<th width="35%">작성자</th>
					<th width="35%">채널 이름</th>
					<th width="10%">좋아요</th>
					<th width="15%">공개여부</th>
					<th width="10%">삭제</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="i">
					<tr>
						<c:url var="url_show" value="/admin/channel/edit/${i.id}"/>
						<td>
							<a href="${url_show}">
								<input type="checkbox" name="delete_channel" value="${i.id}"/>
							</a>
						</td>
						<td><a href="${url_show}">${i.users.name}</a></td>
						<td>${i.title}</td>
						<td>${i.likes}</td>
						<td>
						<c:if test="${i.isShow==0}">
							<a href="${url_show}">비공개</a>
						</c:if>
						<c:if test="${i.isShow==1}">
							<a href="${url_show}">공개</a>
						</c:if>
						</td>
						<td style="text-align: center;">
							<s:url var="deleteButtonURL" value="/admin/manage_chanels/delete/${i.id}" />
							<a role="button" class="btn btn-danger" href="${deleteButtonURL}">삭제
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		
		<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" />
		<BUTTON class="btn btn-danger" type="submit" name="delete" value="1">선택 삭제</BUTTON>
		</form>
	</div>
	
	<SCRIPT type="text/javascript">
		function check_all_checkbox(){
			if($("#check_all").is(':checked')==true){
				$('input:checkbox[name=delete_channel]').prop("checked", true);
			}else{
				$('input:checkbox[name=delete_channel]').prop("checked", false);
			}
		}
	</SCRIPT>
</div>
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
