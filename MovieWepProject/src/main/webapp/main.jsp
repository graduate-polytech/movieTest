<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="resource/css/styles1.css"> <!-- 기존 CSS 스타일 시트 링크 -->
   
</head>
<body>

	 <!-- 로고 이미지 -->
	<header>
		<a class="navbar-brand" href="index.html"><img src="resource/images/컬러로고.png" alt="로고 이미지"  width="100px;" height="200px;"></a>
	</header>

	  <!-- 네비게이션 바 위쪽의 오른쪽에 로그인 및 회원가입 버튼 추가 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-right"> <!-- 오른쪽 정렬 클래스 추가 -->
				<a class="btn btn-outline-primary" href="login.html">로그인</a>
				<a class="btn btn-primary" href="register.html">회원가입</a>
			</div>
		</div>
	</div>

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" >
		<div class="container">
		  <div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			  <span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">
				  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					영화
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#">영화 검색</a></li>
					<li><a class="dropdown-item" href="#">영화추천</a></li>
				  </ul>
				</li>
				<li class="nav-item dropdown">
				  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					박스오피스
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#">일별 박스오피스</a></li>
					<li><a class="dropdown-item" href="#">주간 박스오피스</a></li>
				  </ul>
				</li>
				<li class="nav-item dropdown">
				  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					극장
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#">주변 영화관</a></li>
					<li><a class="dropdown-item" href="#">지역별 영화관</a></li>
				  </ul>
				</li>
				<li class="nav-item dropdown">
				  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					마이 페이지
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#">내 정보</a></li>
					<li><a class="dropdown-item" href="#">내 리뷰</a></li>
				  </ul>
				</li>
			  </ul>
			  <div class="navbar-nav ml-auto">
				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> <button class="btn btn-outline-success" type="submit">Search</button>
			  </div>
			</div>
		  </div>
		</div>
	</nav>

	<!-- 인기 영화 목록 -->
	<div class="container mt-5">
		<h2 class="text-center">인기 영화</h2>
		<div class="row" id="popularMoviesContainer">
		 <!-- 여기에 랜덤한 10개의 인기 영화 포스터가 추가됩니다. -->
		</div>
	</div>
			
	<div class="container mt-5">
		<h2 class="text-center">추천 영화</h2>
		<div class="row" id="recommendedMoviesContainer">
			  
		</div>
	</div>

	<h2 class="text-center">나의 영화관</h2>
		<div id="map" style="width: 80%; height: 250px; margin: 0 auto;">
			

		</div>

	<!-- CGV 영화관 사진 및 링크 -->
		<div class="container text-center mt-5">
			<h2>지금 당장 영화관으로</h2>
				<a href="https://www.cgv.co.kr/" target="_blank">
				<img src="cgv_movie_theater.jpg" alt="CGV 영화관 사진" style="width: 80%; max-width: 800px; height: auto; margin: 0 auto;">
				</a>
		</div>



	 <footer>
		<p>&copy; 시네마 위키</p>
	</footer>

	 <script src="resource/js/script1.js"></script>  <!-- JavaScript 파일 링크  -->

	<script>
	document.addEventListener("DOMContentLoaded", function() {
		// 로그인 버튼 클릭 시 login.html로 이동
		const loginButton = document.querySelector("#loginButton");
		loginButton.addEventListener("click", function() {
			window.location.href = "login.html";
		});

		// 회원가입 버튼 클릭 시 register.html로 이동
		const registerButton = document.querySelector("#registerButton");
		registerButton.addEventListener("click", function() {
			window.location.href = "register.html";
		});
	});
</script>
	</body>
</html>