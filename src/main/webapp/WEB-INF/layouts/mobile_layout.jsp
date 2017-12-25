<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
<c:url value="/" var="root"><jsp:text/></c:url>
<c:url value="https://d3i0w6mgohqrwj.cloudfront.net/" var="url_image"><jsp:text/></c:url>
<%
response.addHeader("Access-Control-Allow-Origin", "*");
request.getHeader("Origin");
%>
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
 	<meta charset="utf-8">
    <meta name="viewport" content="width=720, user-scalable=no, minimal-ui">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="Access-Control-Allow-Credentials" content="true">
    <meta name="copyright" content="Copyright (c) 2015 ArtPhil">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta property="og:title" content="${title }"/>
    <meta property="og:url" content="http://52.69.130.124/share/sys_1/${c.id}"/>

    <meta property="og:image" content="http://52.69.130.124/images/logo.png"/>
    <meta property="og:site_name" content="${site_name}"/>
    <meta property="og:description" content="${description}"/>
    
    <link href="${root}css/flex-grid/normalize.css" rel="stylesheet">
    <link href="${root}css/flex-grid/flexboxgrid.min.css" rel="stylesheet">
    <link href="${root}css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${root}css/share_page/style.dist.css" rel="stylesheet">
    
    <link href="${root}js/libs/video-js/dist/video-js.min.css" rel="stylesheet">
    <link href="${root}js/libs/swiper-sider/dist/css/swiper.min.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
     	<script>
		var root = "${root}";
    </script>
<tiles:insertAttribute name="body" />
</html>