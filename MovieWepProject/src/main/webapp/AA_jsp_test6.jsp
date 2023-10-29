<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10-Column Table</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5 JavaScript 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<link rel="stylesheet" href="resource/css/styles1.css">
<link rel="stylesheet" href="resource/css/reviewStyle_remake.css">
</head>
<body>
	<jsp:include page="loadFile/startImgTest.jsp">
		<jsp:param value="userid" name="userid"/>
		<jsp:param value="docid" name="docid"/>
	</jsp:include>
</body>
</html>
