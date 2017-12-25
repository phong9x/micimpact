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

	<div class="container">
		<div style="float: left">
			<div class="list-group">
				<a href="/res/res_manage/error_code" class="list-group-item">에러코드관리</a>
				<a href="/res/res_manage/domain" class="list-group-item active">도메인관리</a>
				<a href="/res/res_manage/file" class="list-group-item">파일관리</a>
				<a href="/res/res_manage/locale" class="list-group-item">언어관리</a>
			</div>
		</div>
		
		<div style="width: 700px; float: left; margin-left: 30px;">
			<div style="margin-bottom: 25px;">
				 <legend class="legende">도메인 관리
					<div class="search_box">
						<div class="row">
							<select class="form-control" id="options">
								<option value="1" selected="selected">domain</option>
								<option value="2">logical_name</option>
								<option value="3">value</option>
							</select>
							<div class="col-lg-6" >
								<div class="input-group">
									<span class="input-group-addon" id="sizing-addon1">
										<span class="glyphicon glyphicon-search"></span>
									</span>
									<input type="text" name="keyword" class="form-control" placeholder=""  onkeypress="if(event.keyCode==13) {search(); return false;}">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick="search()">검색</button>
										<button class="btn btn-default" type="button" onclick="register()">등록</button>
									</span>
								</div><!-- /input-group -->
							</div><!-- /.col-lg-6 -->
						</div><!-- /.row -->
					</div>
				</legend>
			</div>
			<a class="btn btn-default export" href="/res/res_manage/export_excel?rType=${rType}" ><img src="/images/excel-icon.png"/>export</a>
			<table class="table table-bordered">
				<thead>
				    <tr>
				      <th>id</th>
				      <th>domain</th>
				      <th>logical_name</th>
				      <th>value</th>
				      <th>parent_id</th>
				      <th>locale</th>
				      <th>삭제</th>
				    </tr>
				</thead>
				<tbody>
				    <c:forEach items="${list}" var="domain">
						<tr>
							<td>${domain.id}</td>
							<td>${domain.domain}</td>
							<td>${domain.logicalValue}</td>
							<td>${domain.value}</td>
							<td>${domain.parentId}</td>
							<td>${domain.locale}</td>
							<td><a class="btn btn-default" href="/res/res_manage/domain/delete/${domain.id}" >삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<trams_c:pagnation currentIndex="${currentIndex}" url="${url}" totalPages="${page.totalPages}" id="" />
		</div>
		<div style="clear: left;"></div>
	</div>	
</div>
<script type="text/javascript">
$(function(){
	if (GetQueryStringParams('option')!=null)
	{
		$('#options option[value="'+GetQueryStringParams('option')+'"]').attr("selected",true);
	}
	
	if (GetQueryStringParams('keyword')!=null)
	{
		$("input[name=keyword]").val(GetQueryStringParams('keyword'))
	}
});
function search() {
	var option = $("#options").val();
	var keyword = $("input[name=keyword]").val();
	
	if (keyword.length > 0 && option != 0 ){
		var url = "/res/res_manage/domain/search?option="+ option + "&keyword=" + keyword;
		location.href = url;
	}else {
		location.href = "/res/res_manage/domain/";
	}
}

function register() {
	location.href = "/res/res_manage/domain/register"
}
</script>
