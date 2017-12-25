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
		<div class="search_box admin_user">
			<div class="title">
				동영상 관리
			</div>
		</div>
		
		<div class="form-horizontal">
		<table class="table row">
			<thead>
				<tr class="active">
					<th class="col-sm-1">ID</th>
					<th class="col-sm-1">InputKey</th>
					<th class="col-sm-7">OutputKey</th>
					<th class="col-sm-2">Preset-ID</th>
					<th class="col-sm-2">Status</th>
					<th class="col-sm-2">TargetUrl</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="stream_output" value="stream_output/" />
				<c:set var="delimiter" value="/" />
				<c:set var="extension" value=".m3u8" />
				<c:forEach items="${jobs}" var="List" varStatus="listCount">
					<tr>
						<td class="title"> ${List.id} </td>
						<td>${List.input.key}</td>
						<td>${List.output.key}</td>
						<td>${List.output.presetId}</td>
						<td>${List.output.status}</td>
						<td>${stream_output}${List.input.key.split('/')[1]}${delimiter}${List.output.key}${extension}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>	
</div>
