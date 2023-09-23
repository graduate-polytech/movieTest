<!-- welcome.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome, <%= session.getAttribute("username") %></h1>
    <a href="<%= request.getContextPath() %>/src/main/webapp/WEB-INF/classes/userLogin/LogoutServlet">Logout</a>
</body>
</html>
