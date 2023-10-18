
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
.text-box {
	position: relative;
	height: 150px;
	border: 1px solid #ccc;
	padding: 10px;
	min-width: 500px;
	margin-top: 10px;
}

.title {
	position: absolute;
	top: 10px;
	left: 10px;
	font-weight: bold;
}

.userid {
	position: absolute;
	top: 30px;
	left: 60px;
}

.score {
	position: absolute;
	top: 30px;
	left: 15px;
}

.review {
	position: absolute;
	top: 55px;
	left: 10px;
	right: 10px;
	bottom: 10px;
	padding: 5px;
	resize: none;
}

.trbtn {
	position: absolute;
	top: 10px;
	right: 10px;
	padding: 5px 10px;
	background-color: #0077FF;
	color: #fff;
	border: none;
	cursor: pointer;
}

.top-right-button:hover {
	background-color: #0055CC;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}
</style>
</head>
<body>
	<%
	String sessionId = request.getParameter("sessionId");
	String no = request.getParameter("no");
	String director = request.getParameter("director");
	String title = request.getParameter("title");
	String userid = request.getParameter("userid");
	String score = request.getParameter("score");
	String review = request.getParameter("review");
	String date = request.getParameter("date");
	%>
	<form class="id">
		<input type="hidden" id="no" value=<%=no%>>
		<a href="MovieDetailTest.jsp?title=<%=title%>">
			<label class="title"><%=title%></label>
		</a>
		<label class="userid"><%=userid%></label>
			<jsp:include page="/loadFile/star.jsp" />
		<textarea class="review" id="review"> <%=review%> </textarea>
		<input class="trbtn" type="submit" value="저장">
	</form>
	<script type="text/javascript">
	const drawStar = (target) => {
		  document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
		}
	 </script>
</body>
</html>