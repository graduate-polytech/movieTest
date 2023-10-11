<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>시네마 위키</title>
<!-- 부트스트랩 CSS 링크 추가 -->
<!-- 부트스트랩 및 jQuery 및 Popper.js JavaScript 라이브러리 링크 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&libraries=places"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/styles1.css">
<!-- 기존 CSS 스타일 시트 링크 -->
</head>
<body>
	<!-- 로고 이미지 -->
	<header>
		<div id="top">
			<!-- 다운후 변경 -->
			<jsp:include page="loadFile/top.jsp" />
			<jsp:include page="loadFile/menuBar.jsp" />
		</div>
	</header>
	<script type="text/javascript">
		
		var userId = '<%=session.getAttribute("userId")%>';
		if (userId != 'null') {
			//alert(userId);
		}
	</script>
<div class="reviewTable" style="margin: 50px;">
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
	</div>
	<footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>
</body>
</html>