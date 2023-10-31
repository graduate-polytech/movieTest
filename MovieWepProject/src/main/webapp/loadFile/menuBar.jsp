<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="../resource/css/styles1.css">
<!-- 기존 CSS 스타일 시트 링크 -->
<script src="resource/js/signin.js">/*로그인, 로그아웃*/</script>
<script src="resource/js/setFooter.js">/*푸터 위치 설정용*/</script>
</head>
<body>
	<%
	Object sessionId = session.getAttribute("userId");
	
	String userid = "";
	if(sessionId != null && !sessionId.equals("") && !sessionId.equals("null")){
		userid = (String)sessionId;
	} else{
		userid = ""; 
	}
	
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="movietest.jsp" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 영화 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="movietest.jsp">영화 검색</a>
								</li>
								<!-- 
								<li>
									<a class="dropdown-item" href="MovieRecommendation.jsp">영화추천</a>
								</li> -->
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 박스오피스 </a>
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
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 극장 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="map.jsp">주변 영화관</a>
								</li>
								<li>
									<a class="dropdown-item" href="map.jsp">지역별 영화관</a>
								</li>
							</ul>
						</li>
						<%if(userid.equals("admin")) {%>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 관리자 페이지 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="Admin_userPage.jsp">유저관리</a>
								</li>
								<li>
									<a class="dropdown-item" href="Admin_reviewPage.jsp">리뷰 관리</a>
								</li>
								<li>
									<a class="dropdown-item" href="Admin_cinemaPage.jsp">영화관 관리</a>
								</li>
							</ul>
						</li>
						<%}else{%>
						
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 마이 페이지 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<a class="dropdown-item" href="myPage.jsp">내 정보</a>
								</li>
								<li>
									<a class="dropdown-item" href="reviewPage.jsp">내 리뷰</a>
								</li>
							</ul>
						</li>
						<%} %>
					</ul>
					<form class="navbar-nav ml-auto">
						<input id="title" class="form-control me-2" type="search" placeholder="Search"
							aria-label="Search">
						<button class="btn btn-outline-success" type="button" onclick="bar_search()">Search</button>
						<!-- http://localhost:9001/MovieWepProject/movietest.jsp?title=제목&types=title -->
					</form>
				</div>
			</div>
			<button class="btn btn-secondary" type="button" onclick="trySignOut('<%=userid%>')">로그아웃</button>
		</div>
	</nav>
	<script type="text/javascript">
		function bar_search() {
			var title = document.getElementById("title").value;
			if (title.length == 0) {
				return;
			} else {
				window.location.href = "movietest.jsp?title=" + title + "&types=title";
			}
		}

		document.getElementById('title').addEventListener('keydown',
				function(e) {
					if (e.key === 'Enter') {
						e.preventDefault();
						bar_search();
					}
				});
	</script>
</body>
</html>