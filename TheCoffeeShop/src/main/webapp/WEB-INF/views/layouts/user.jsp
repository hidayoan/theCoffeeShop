<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp" %>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><decorator:title default="Master-layout"></decorator:title></title>

<link href="<c:url value="/assets/user/css/bootstrap.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/assets/user/style.css"/>" rel="stylesheet" />
<link
	href="<c:url value="/assets/user/font-awesome/css/font-awesome.css"/>"
	rel="stylesheet">
<link href="<c:url value="/assets/user/css/tch.css"/>" rel="stylesheet" />
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
	<!-- body -->
	<div class="body">
		<decorator:body />
	</div>

	<!-- footer -->
	<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
	
	<script type="text/javascript"
		src='<c:url value="/assets/user/js/main.js"/>'></script>
</body>
</html>