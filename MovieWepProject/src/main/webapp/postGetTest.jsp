<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<h1>결과</h1>
	<%
	String userName = request.getParameter("userName");
	if (userName != null) {
	%><p>
		안녕하세요,
		<%=userName%>님!
	</p>
	<%
	} else {
	%><p>비정상적인 접근입니다.</p>
	<%
	}
	%>


</body>
</html>
