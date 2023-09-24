<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&libraries=places"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/styles1.css" type="text/css">

<style>

	.form-control {
		
		max-width: 60%;
		height: 60px; 
		font-size: 80px;
		padding: 5px;
		background-color: white;
		margin: 10px auto;
	}
</style>
</head>
<body>

	<header>
		<div id="top">
			<jsp:include page="loadFile/top.jsp" />
			<jsp:include page="loadFile/menuBar.jsp" />
		</div>
	</header>

	<div class="login-box" style="margin-top: 50px auto;">
		<img  class="logo-title" src="resource/images/Title.png" alt="로고 이미지">

		<div style="margin-top: 20px auto;">
			<div class="form-floating mb-3" style="margin: 40px auto;">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="ID"
					style="height: 40px; font-size: 20px; padding: 5px;"> <input
					type="password" class="form-control" id="floatingPassword"
					placeholder="Password"
					style="height: 40px; font-size: 20px; padding: 5px;">
			</div>

			<br>

			<button id="login-btn" type="button" class="btn btn-outline-primary"
				style="margin: 30px; margin-bottom: 5px; height: 50px; width: 60%; margin:5px;"
				onclick="location.href='main.jsp'">로그인</button>
			<br> <a href="signup.jsp" style="text-align: end; width: 80%; display: flex; flex-direction: row-reverse;">회원가입</a>
		</div>

	</div>
	<footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>

</body>
</html>