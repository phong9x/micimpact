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
	<FORM method="post">
		<div class="search_box admin_user">
			<div class="title" >
				해시태그 추가
			</div>
			<div class="form-inline">
				<div class="form_group">
					<div class="input-group">
						<input type="text" name="name" class="form-control" placeholder=""  >
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default" >추가</button>
						</span>
					</div><!-- /input-group -->
				</div>
			</div><!-- /.row -->
			<div class="title" style="border-bottom:none">
				해시태그 목록
			</div>
		</div>
		</FORM>
		<FORM method="post">
		<table class="table table-striped">
			
			<tbody>
				<c:forEach items="${list}" var="i">
					<tr>
						
						<td>${i.name}</td>
						
						<td style="text-align: center;">
							<button name="delete" value="${i.id }"  class="btn btn-danger" >삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</FORM>
		<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" param_url="state=${state}"/>
		
		
	</div>
</div>
