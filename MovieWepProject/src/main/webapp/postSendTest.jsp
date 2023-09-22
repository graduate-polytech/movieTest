<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 입력</title>
</head>
<body>
    <h1>사용자 입력</h1>
    <%
    String name = request.getParameter("userName");
    if(name != null){ %>
    	<script>alert("<%= name %>")</script><%
    }
    %>
    <form action="#" method="post">
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName" required>
        <input type="submit" value="제출">
    </form>
</body>
</html>
