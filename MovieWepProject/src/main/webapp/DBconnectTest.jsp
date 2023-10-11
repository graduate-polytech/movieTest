<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cinema Data</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Company</th>
            <th>Address</th>
            <th>Call No</th>
            <th>WEP</th>
        </tr>
        <%
        CinemaDataAccess cinemaAccess = new CinemaDataAccess();
		List<Cinema> cinemaList = cinemaAccess.getAllCinemaData();

		for (Cinema cinema : cinemaList) {
        %>
        <tr>
            <td><%= cinema.getNo() %></td>
            <td><%= cinema.getName() %></td>
            <td><%= cinema.getCompany() %></td>
            <td><%= cinema.getAddress() %></td>
            <td><%= cinema.getCallno() %></td>
            <td><a href = <%= cinema.getWep() %>>사이트</a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
