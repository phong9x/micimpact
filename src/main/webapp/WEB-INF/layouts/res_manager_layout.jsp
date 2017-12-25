<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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

	<!-- style -->
	<spring:url value="/css/bootstrap.min.css" var="css_url_bootstrap" />
	<spring:url value="/css/bootstrap-theme.min.css" var="css_url_bootstrap_theme" />
	<spring:url value="/css/datepicker3.css" var="css_url_datepicker" />
	<spring:url value="/css/styles.css" var="css_url_styles" />
	<link href="${css_url_bootstrap}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_bootstrap_theme}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_datepicker}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_styles}" rel="stylesheet"  type="text/css" />
	
	<!-- javascript -->
	<spring:url value="/js/validation.js" var="js_url_validation" />
	<spring:url value="/js/jquery-1.10.2.min.js" var="js_url_jquery" />
	<spring:url value="/js/bootstrap.js" var="js_url_bootstrap" />
	<spring:url value="/js/bootstrap-datepicker.js" var="js_url_bootstrap_datepicker" />
	<spring:url value="/js/locales/bootstrap-datepicker.${fn:substring(plocale, 0, 2)}.js" var="js_url_bootstrap_datepicker_locale" />
	<spring:url value="/js/index.js" var="js_url_index" />
	
	<script type="text/javascript" src="${js_url_validation}"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_jquery}"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_bootstrap}"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker}"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker_locale}" charset="UTF-8"><jsp:text/></script>
	<script type="text/javascript" src="${js_url_index}"><jsp:text/></script>

</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/res">Resource Manager Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">리소스 관리<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/res/res_manage/error_code">에러코드관리</a></li>
	            <li><a href="/res/res_manage/domain">도메인관리</a></li>
	            <li><a href="/res/res_manage/file">파일관리</a></li>
	            <li><a href="/res/res_manage/locale">언어관리</a></li>
			</ul>
	    </li>
        <li><a href="/res/auth_manage/authority">권한 관리</a></li>
        <li><a href="/res/manage_users">유저 권한 관리</a></li>
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