<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="cache-control" content="no-cache" />	

	<!-- Get the user locale from the page context (it was set by Spring MVC's locale resolver) -->
	<c:set var="plocale">${pageContext.response.locale}</c:set>
	<c:set var="userLocale">  
		<c:out value="${fn:replace(plocale, '_', '-')}" default="en" />
	</c:set>

	<spring:message code="application_name" var="app_name" htmlEscape="false" />
	<title><c:out value="${app_name}" /></title>
	
	<!-- default by telosys -->
	
	<!-- style -->
	<spring:url value="/css/bootstrap.min.css" var="css_url_bootstrap" />
	<spring:url value="/css/bootstrap-theme.min.css" var="css_url_bootstrap_theme" />
	<spring:url value="/css/datepicker3.css" var="css_url_datepicker" />
	<spring:url value="/css/styles.css" var="css_url_styles" />
	<spring:url value="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" var="jquery_ui" />
	<spring:url value="/css/jquery-ui.css" var="css_jquery_ui_styles" />
	<spring:url value="/css/custom.css" var="css_custom_styles" />
	<link href="${css_custom_styles}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_bootstrap}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_bootstrap_theme}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_datepicker}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_styles}" rel="stylesheet"  type="text/css" />
	<link href="${jquery_ui}" rel="stylesheet"  type="text/css" />
	<link href="${css_jquery_ui_styles}" rel="stylesheet"  type="text/css" />
	<!-- end default -->

	<!-- javascript -->
	<spring:url value="/js/validation.js" var="js_url_validation" />
	<spring:url value="/js/jquery-1.10.2.min.js" var="js_url_jquery" />
	<spring:url value="/js/jquery.form.min.js" var="js_url_jquery_form" />
	<spring:url value="/js/bootstrap.js" var="js_url_bootstrap" />
	<spring:url value="/js/bootstrap-datepicker.js" var="js_url_bootstrap_datepicker" />
	<spring:url value="/js/locales/bootstrap-datepicker.${fn:substring(plocale, 0, 2)}.js" var="js_url_bootstrap_datepicker_locale" />
	<spring:url value="/js/index.js" var="js_url_index" />
	<spring:url value="http://code.jquery.com/ui/1.11.4/jquery-ui.js" var="js_url_jquery_ui" />
	<script type="text/javascript" src="${js_url_validation}"></script>
	<script type="text/javascript" src="${js_url_jquery}"></script>
	<script type="text/javascript" src="${js_url_jquery_form}"></script>
	<script type="text/javascript" src="${js_url_bootstrap}"></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker}"></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker_locale}" charset="UTF-8"></script>
	<script src="${root}js/jquery-ui.js"></script>
	<script type="text/javascript" src="${js_url_index}"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_jquery_ui}"></script>
	<script src="${root}js/custom.js"></script>
<%-- 	<script type="text/javascript" src="${js_url_jquery_ui}"></script> --%>
	<spring:url value="/smartEditor/js/HuskyEZCreator.js" var="js_url_HuskyEZCreator" />
	<script type="text/javascript" src="${js_url_HuskyEZCreator}" charset="UTF-8"></script>
	<!-- amchart 관련 -->
    <script src="/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="/amcharts/serial.js" type="text/javascript"></script>
</head>
<c:url value="/" var="root"><jsp:text/></c:url>
     <script>
		var root_url = "${root}";
		var api = "${api}";
    </script>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar">&#160;</span>
        <span class="icon-bar">&#160;</span>
        <span class="icon-bar">&#160;</span>
      </button>
      <a class="navbar-brand" href="${root}admin">홈</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

        <li><a href="${root}admin/manage_users">유저 관리</a></li>
        <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">카드 관리<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${root}admin/manage_cards">카드관리</a></li>
	            <li><a href="${root}admin/manage_chanels">채널목록</a></li>
			</ul>
		</li>
		
        <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">추천카드관리<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${root}admin/manage_recommend_cards">추천카드</a></li>
	            <li><a href="${root}admin/admin_chanels">관리자채널</a></li>
			</ul>
		</li>
		
        <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">동영상관리<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${root}admin/movie_list">변환상태보기</a></li>
	            <li><a href="${root}admin/movie_register">변환등록 </a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${root}admin/hashtag">해시태그</a></li>
	            <li><a href="${root}admin/category">카테고리</a></li>
	            <li><a href="${root}admin/report/comment">신고관리 </a></li>
	            <li><a href="${root}admin/stats">통계관리 </a></li>
			</ul>
		</li>
		
        <li><a href="${root}admin/manage_boards?bType=1">공지사항관리</a></li>
		<li><a href="${root}logout"><s:message code="gnb.logout"/></a></li>
		<!--
        <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">통계<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/admin/google_analytics">구글 어날리틱스</a></li>
	            <li><a href="/admin/statistics_1">그래프</a></li>
			</ul>
		</li>
 	    <li><a href="/admin/popup">팝업 관리</a></li> 
 	    -->

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

	<tiles:insertAttribute name="body" />

</body>
<script type="text/javascript">
$(document).ready(function() {
	$("a[href='"+this.location.pathname+"']").parent().addClass("active");
});
</script>

</html>


