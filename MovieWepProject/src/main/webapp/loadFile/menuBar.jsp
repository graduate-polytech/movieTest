<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resource/css/styles1.css">
<!-- 기존 CSS 스타일 시트 링크 -->
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"">
		<div class="container">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="movie_search.jsp" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 영화 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="movie_search.jsp">영화 검색</a>
								</li>
								<li>
									<a class="dropdown-item" href="#">영화추천</a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 박스오피스 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="DayBoxoffice.jsp">일별 박스오피스</a>
								</li>
								<li>
									<a class="dropdown-item" href="WeeklyBoxoffice.jsp">주간 박스오피스</a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 극장 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="map.jsp">주변 영화관</a>
								</li>
								<li>
									<a class="dropdown-item" href="map.jsp">지역별 영화관</a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 마이 페이지 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="myPage.jsp">내 정보</a>
								</li>
								<li>
									<a class="dropdown-item" href="#">내 리뷰</a>
								</li>
							</ul>
						</li>
					</ul>
					<div class="navbar-nav ml-auto">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>