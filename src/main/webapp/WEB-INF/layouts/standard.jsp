<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" scope="request"
	value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
@IMPORT url("${contextPath}/resources/styles/css/bootstrap.min.css");
@IMPORT url("${contextPath}/resources/styles/css/bootstrap-select.css");
@IMPORT url("${contextPath}/resources/styles/css/sweet-alert.css");
</style>
<!--[if lt IE 8]>
	        <link rel="stylesheet" href="<c:url value="/resources/blueprint/ie.css" />" type="text/css" media="screen, projection" />
	<![endif]-->
<script type="text/javascript"
	src="<c:url value="/resources/javascript/jquery/jquery-1.11.1.min.js" />"></script>
</head>
<body>
	<div id="page" class="container">
		<div id="header">
			<!-- <a href="<c:url value="/" />"> <img
				src="<c:url value="/resources/images/header.jpg"/>"
				alt="Evaluate Tool" width="960" height="180" />
			</a> -->
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<!-- <hr /> -->
		</div>
	</div>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/styles/js/bootstrap-select.js"></script>
		<script type="text/javascript"
		src="${contextPath}/resources/styles/js/sweet-alert.js"></script>
</body>
</html>