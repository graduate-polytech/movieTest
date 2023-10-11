<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0">
		<tr>
			<th>userId</th>
			<th>Title</th>
			<th>Director</th>
			<th>score</th>
			<th>review</th>
			<th>date</th>
			<th>movie</th>
		</tr>
		<%
		DAO_ReviewDB cinemaAccess = new DAO_ReviewDB();
		ArrayList<Data_Review> reviewList = cinemaAccess.getReviewList();

		for (Data_Review review : reviewList) {
		%>
		<tr>
			<td><%=review.getUserid()%></td>
			<td><%=review.getTitle()%></td>
			<td><%=review.getDirector()%></td>
			<td><%=review.getScore()%></td>
			<td><%=review.getReview()%></td>
			<td><%=review.getDate()%></td>
			<td>
				<a
					href="MovieDetailTest.jsp?title=<%=review.getTitle()%>&director=<%=review.getDirector()%>">사이트</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>