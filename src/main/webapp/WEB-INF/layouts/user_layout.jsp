<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@commonConfig['cdn.url']" var="cdnUrl"/>

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
	<spring:url value="/css/style_sm.css" var="css_url_styles_sm" />
	<link href="${css_url_bootstrap}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_bootstrap_theme}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_datepicker}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_styles}" rel="stylesheet"  type="text/css" />
	<link href="${css_url_styles_sm}" rel="stylesheet"  type="text/css" />
	
	<!-- javascript -->
	<spring:url value="/js/validation.js" var="js_url_validation" />
	<spring:url value="/js/jquery-1.11.0.min.js" var="js_url_jquery" />
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
	

	<!-- end default -->

	<spring:url value="/smartEditor/js/HuskyEZCreator.js" var="js_url_HuskyEZCreator" />
	<script type="text/javascript" src="${js_url_HuskyEZCreator}" charset="UTF-8"></script>
	<spring:url value="/js/jquery.form.min.js" var="js_url_jquery_form" />
	<script type="text/javascript" src="${js_url_jquery_form}"></script>
	
</head>
<c:url value="/" var="root"><jsp:text/></c:url>
    <script>
		//var root = "http://52.69.130.124";
		var root = "${root}";
		var api = "${api}";
    </script>
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
	      <a class="navbar-brand" href="/">MICIMPACT</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	   
	      
	        
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
