<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <% for (int i = 1; i <= 3; i++) { %>
            <jsp:include page="template.jsp">
                <jsp:param name="pageTitle" value="Page <%= i %>"/>
                <jsp:param name="pageContent" value="This is the content for Page <%= i %>."/>
            </jsp:include>
        <% } %>
    </div>
</body>
</html>