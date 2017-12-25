
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
		<div class="main_box new_member">
			<div>
				<span class="left">신규회원목록</span><span class="right"><a href="/admin/manage_users?state=1">더보기 &gt;</a></span>	
			</div>
			<table width="100%">
				<thead>
					<tr>
						<th width="20%"></th>
						<th width="40%"></th>
						<th width="40%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list1}" var="users">
						<tr>
							<td>${users.name}</td>
							<td>${users.email}</td>
							<td>${users.createdAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="main_box quit_member">
			<div>
				<span class="left">탈퇴회원목록</span><span class="right"><a href="/admin/manage_users?state=0">더보기 &gt;</a></span>	
			</div>
			<table width="100%">
				<thead>
					<tr>
						<th width="20%"></th>
						<th width="40%"></th>
						<th width="40%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list2}" var="users">
						<tr>
							<td>${users.name}</td>
							<td>${users.email}</td>
							<td>${users.createdAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
    </div> <!-- /container -->
</div>