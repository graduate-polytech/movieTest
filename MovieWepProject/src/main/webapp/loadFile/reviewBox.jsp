<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String sessionId = request.getParameter("sessionId");
	String no = request.getParameter("no");
	String director = request.getParameter("director");
	String title = request.getParameter("title");
	String userid = request.getParameter("userid");
	String score = request.getParameter("score");
	String review = request.getParameter("review");
	String date = request.getParameter("date");
	String isMyReview = (sessionId != null && !sessionId.equals("null") && !sessionId.trim().equals("")
			&& !sessionId.isEmpty() && sessionId.equals(userid)) ? "t" : "f";
	/*
	String sessionId = "sessionId";
	String no = "no";
	String director = "director";
	String title = "title";
	String userid = "userid";
	String score = "score";
	String review = "review";
	String date = "date";*/
	%>
	<div class="review_text-box">

			<input id="<%=no%>_no" type="hidden" value=<%=no%>>
			<input id="<%=no%>_title" type="hidden" value=<%=title%>>
			<input id="<%=no%>_director" type="hidden" value=<%=director%>>
			<a href="MovieDetailTest.jsp?title=<%=title%>&director=<%=director%>">
				<output></output>
				<label id="<%=no%>_movie_title" class="review_title"><%=title%></label>
			</a>
			<div>
				<div class="score">
					<jsp:include page="star.jsp">
						<jsp:param name="count" value="<%=no%>" />
						<jsp:param name="score" value="<%=score%>" />
						<jsp:param name="activate" value="<%=isMyReview%>" />
					</jsp:include>
				</div>
				<label id="<%=no%>_userid" class="userid"><%=userid%></label>
			</div>
			<textarea class="review" id="<%=no%>_review"> <%=review%> </textarea>
			<%
			if (isMyReview.equals("t")) {
			%>
			<input id="<%=no%>" class="trbtn" type="button" onclick="onSubmitBtn()" value="저장">
			<%
			}
			%>

	</div>
	<script type="text/javascript">
		function onSubmitBtn() {
			//var title = document.getElementById("movie_title");
			var no = event.target.id;
			var number = "번호: " + document.getElementById(no + "_no").value
			var title = "제목: " + document.getElementById(no + "_title").value
			var director = "감독: " + document.getElementById(no + "_director").value
			var review = "리뷰: " + document.getElementById(no + "_review").value
			var score = "점수: " + document.getElementById("rangeInput_" + no).value
			alert(title)
			alert(number + "\n" + title + "\n" + director + "\n" + review + "\n" + score);
		}
	</script>
</body>
</html>