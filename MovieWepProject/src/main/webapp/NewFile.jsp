<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "boxOffice.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Company</th>
            
        </tr>
        <%
        List<datamovie> movie = null;//KoficApi.data();

      for (datamovie cinema : movie) {
        %>
        <tr>
            <td><%= cinema.getMovieNm() %></td>
            <td><%= cinema.getRank() %></td>
            <td><%= cinema.getAudiAcc() %></td>
            
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>