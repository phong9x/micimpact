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
	
	<!-- default by telosys -->
	
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
	<spring:url value="/js/jquery.form.min.js" var="js_url_jquery_form" />
	<spring:url value="/js/bootstrap.js" var="js_url_bootstrap" />
	<spring:url value="/js/bootstrap-datepicker.js" var="js_url_bootstrap_datepicker" />
	<spring:url value="/js/locales/bootstrap-datepicker.${fn:substring(plocale, 0, 2)}.js" var="js_url_bootstrap_datepicker_locale" />
	<spring:url value="/js/index.js" var="js_url_index" />
	<script type="text/javascript" src="${js_url_validation}"></script>
	<script type="text/javascript" src="${js_url_jquery}"></script>
	<script type="text/javascript" src="${js_url_jquery_form}"></script>
	<script type="text/javascript" src="${js_url_bootstrap}"></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker}"></script>
	<script type="text/javascript" src="${js_url_bootstrap_datepicker_locale}" charset="UTF-8"></script>
	<script type="text/javascript" src="${js_url_index}"><jsp:text/></script>

	<!-- end default -->

	<spring:url value="/smartEditor/js/HuskyEZCreator.js" var="js_url_HuskyEZCreator" />
	<script type="text/javascript" src="${js_url_HuskyEZCreator}" charset="UTF-8"></script>
	
	<!-- amchart 관련 -->
    <script src="/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="/amcharts/serial.js" type="text/javascript"></script>
	
</head>
<body>
	<tiles:insertAttribute name="body" />
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("a[href='"+this.location.pathname+"']").parent().addClass("active");
});
</script>

</html>
