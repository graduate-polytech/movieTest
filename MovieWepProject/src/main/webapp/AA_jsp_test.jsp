<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%
request.setCharacterEncoding("UTF-8");
%>

<meta charset="UTF-8">
<title>이미지 표시 범위 조절</title>

</head>
<body>
	<div style="position: relative;">
		<%
		for (int i = 0; i < 5; i++) {
		%><div class="reviews">
			<jsp:include page="loadFile/reviewBox.jsp">

				<jsp:param name="sessionId" value="sessionId" />
				<jsp:param name="no" value="<%=i%>" />
				<jsp:param name="director" value="director" />
				<jsp:param name="title" value="title" />
				<jsp:param name="userid" value="userid" />
				<jsp:param name="score" value="<%=i*2%>" />
				<jsp:param name="review" value="review>" />
				<jsp:param name="date" value="date" />
			</jsp:include></div>
		<%
		}
		%>
	</div>
	
</body>
</html>
