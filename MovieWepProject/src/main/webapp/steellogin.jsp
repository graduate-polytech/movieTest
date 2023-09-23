<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>Login</h1>
	<form
		action="<%=request.getContextPath()%>/src/main/webapp/WEB-INF/classes/userLogin/LoginServlet"
		method="post">
		<label for="username">Username:</label> <input type="text"
			id="username" name="username" required><br> <label
			for="password">Password:</label> <input type="password" id="password"
			name="password" required><br> <input type="submit"
			value="Login">
	</form>

	<script>
        // 에러 메시지를 확인하고 팝업으로 표시
 <%String errorMessage = (String) request.getAttribute("errorMessage");%>
        <%if (errorMessage != null && !errorMessage.isEmpty()) {%>
            var errorMessageWithTitle = "에러 발생";
            alert(errorMessageWithTitle + ': <%=errorMessage%>
		');
	<%}%>
		
	</script>

</body>
</html>
