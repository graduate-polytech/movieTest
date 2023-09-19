<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
testtesttesttest
	<div class="row">
		<!-- 인기 영화 목록 -->
		<div class="col"></div>
		<div class="col-8">
			<div class="side-center">
				<div class="container mt-5">
					<h2 class="text-center">인기 영화</h2>
					<div class="row" id="popularMoviesContainer">
						<!-- 여기에 랜덤한 10개의 인기 영화 포스터가 추가됩니다. -->
					</div>
				</div>


				<div class="container mt-5 ">
					<h2 class="text-center">추천 영화</h2>

					<div class="row" id="recommendedMoviesContainer"></div>

				</div> 

				<h2 class="text-center">나의 영화관</h2>
				<div id="map" style="width: 80%; height: 250px; margin: 0 auto;">
				</div>

				<!-- CGV 영화관 사진 및 링크 -->
				<div class="container text-center mt-5">
					<h2>지금 당장 영화관으로</h2>
					<a href="https://www.cgv.co.kr/" target="_blank"> <img
						src="cgv_movie_theater.jpg" alt="CGV 영화관 사진"
						style="width: 80%; max-width: 800px; height: auto; margin: 0 auto;">
					</a>
				</div>

				<script src="resource/js/script1.js"></script>
				<!-- JavaScript 파일 링크  -->

				<script>
					document.addEventListener("DOMContentLoaded", function() {
						// 로그인 버튼 클릭 시 login.html로 이동
						const loginButton = document
								.querySelector("#loginButton");
						loginButton.addEventListener("click", function() {
							window.location.href = "login.html";
						});

						// 회원가입 버튼 클릭 시 register.html로 이동
						const registerButton = document
								.querySelector("#registerButton");
						registerButton.addEventListener("click", function() {
							window.location.href = "register.html";
						});
					});
				</script>
			</div>
		</div>
		<div class="col">
			<div class="side-right">
				<div class="mini-login-box">
					<jsp:include page="mini_userInfo.jsp" />
				</div>
			</div>
		</div>
	</div>
	<footer>
		<p>&copy; 시네마 위키</p>
	</footer>
</body>

</html>