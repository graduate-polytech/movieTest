<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 생성</title>
</head>
<body>
	<%
	//session.setAttribute("abc", 123);
	//session.setAttribute("name", "이름d");
	%>
	<a href="sessionGet.jsp">세션값 확인</a>
	<input type="button" value="세션 생성" onclick="ddd()">
	<script type="text/javascript">
		function ddd() {
	</script>
	session.setAttribute("abc", 123);
	session.setAttribute("name", "이름dd");
	<script>
	var targetPageUrl = "sessionGet.jsp"; // 이동할 페이지 URL을 여기에 입력하세요

		// 페이지 이동
		window.location.href = targetPageUrl;
	}
	</script>
</body>
</html>