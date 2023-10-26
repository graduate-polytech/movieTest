<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&libraries=places"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
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
		
		var userId = '<%=session.getAttribute("userId")%>
		';
		if (userId != 'null') {
			//alert(userId);
		}
	</script>
	<div class="mainCenterDiv">
				<div class="container mt-5">
					<h2 class="text-center">인기 영화</h2>
					<div id="movie-list" class="row">
						<!-- 여기에 랜덤한 10개의 인기 영화 포스터가 추가됩니다. -->
					</div>
				</div>
				<div class="container mt-5 ">
					<h2 class="text-center">추천 영화</h2>
					<div id="recommended-movie-list" class="row"></div>
				</div>
				<h2 class="text-center">나의 영화관</h2>
				<div id="map" style="width: 80%; height: 250px; margin: 0 auto;"></div>
				<!-- CGV 영화관 사진 및 링크 -->
				<div class="container text-center mt-5">
					<h2>지금 당장 영화관으로</h2>
					<a href="https://www.cgv.co.kr/" target="_blank">
						<img src="resource/images/cgv_movie_theater.jpg" alt="CGV 영화관 사진"
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
							window.location.href = "signup.jsp";
						});
					});

					$(document).ready(function() {
						// 페이지 로드 시 실행할 내용
						fetchMovieData();
					});

					$(document).ready(function() {
						// 좌우 화살표 클릭 이벤트 처리
						$("#scroll-left").click(function() {
							$(".movie-gallery").animate({
								scrollLeft : "-=200"
							}, "slow");
						});

						$("#scroll-right").click(function() {
							$(".movie-gallery").animate({
								scrollLeft : "+=200"
							}, "slow");
						});
					});

					function formatDate(date) {
						// 날짜를 "yyyymmdd" 형식으로 변환
						var year = date.getFullYear();
						var month = (date.getUTCMonth() + 1).toString()
								.padStart(2, '0');
						var day = date.getUTCDate().toString().padStart(2, '0');
						return year + month + day;
					}

					function fetchMovieData() {
						var today = new Date();
						var yesterday = new Date(today);
						yesterday.setDate(today.getDate() - 1);
						var formattedDate = formatDate(yesterday);

						$.ajax({
							type : "GET",
							url : "MainBoxServlet", // AJAX 요청을 처리하는 서블릿 경로
							data : {
								targetDate : formattedDate
							}, // 날짜를 지정
							dataType : "json",
							success : function(data) {
								// 영화 정보를 성공적으로 받았을 때 실행될 함수
								displayMovieData(data);
							},
							error : function() {
								alert("영화 정보를 불러오는데 실패했습니다.");
							}
						});
					}

					function displayMovieData(data) {
						var movieList = $("#movie-list");
						movieList.empty(); // 기존 데이터 삭제

						var gallery = $("<div class='movie-gallery'></div>");

						$
								.each(
										data,
										function(index, movieData) {
											
											//
											
											var movieSeq = movieData.movieSeq;
											var posterDiv = $("<div class='text-center'>");
											//MovieInfoOfMovieSeq.jsp?movieSeq=55873
											var url = "MovieInfoOfMovieSeq.jsp?movieSeq=" + movieSeq;
											//onclick='"+url+""'
											var movieDiv = $("<div class='col-md-3 movie-item' onclick=location.href='"+url+"';>");
											var posterUrl = movieData.posterUrl
													|| "resource/images/흑백로고.png";
											var poster = $("<img src='" + posterUrl + "' alt='포스터' class='poster'>");
											
											// 제목과 개봉일을 감싸는 div를 추가하고 스타일 적용
											var infoDiv = $("<div class='movie-info text-center'>");
											var title = $("<p class='movie-title'><strong>"
													+ movieData.movieNm
													+ "</strong></p>");
											var releaseDate = $("<p class='movie-release-date'><strong>"
													+ movieData.openDt
													+ "</strong></p>");

											posterDiv.append(poster);
											infoDiv.append(title);
											infoDiv.append(releaseDate);

											movieDiv.append(poster);
											movieDiv.append(infoDiv);
											movieList.append(movieDiv);
											gallery.append(movieDiv);
											
											//alert(movieData.movieSeq)
										});
						movieList.append(gallery);
					}

					//추천 영화 형식을 인기 영화 형식으로 만들었습니다.
					function displayRecommendedMovieData(recommendedData) {
						var recommendedMovieList = $("#recommended-movie-list");
						recommendedMovieList.empty(); // 기존 데이터 삭제

						var recommendedGallery = $("<div class='movie-gallery'>");

						$
								.each(
										recommendedData,
										function(index, movieData) {
											var recommendedPosterDiv = $("<div class='text-center'>");
											var recommendedMovieDiv = $("<div class='col-md-3 movie-item'>");
											var posterUrl = movieData.posterUrl
													|| "resource/images/흑백로고.png";
											var poster = $("<img src='" + posterUrl + "' alt='포스터' class='poster'>");

											var infoDiv = $("<div class='movie-info text-center'>");
											var title = $("<p class='movie-title'><strong>"
													+ movieData.movieNm
													+ "</strong></p>");
											var releaseDate = $("<p class='movie-release-date'><strong>"
													+ movieData.openDt
													+ "</strong></p>"); 

											recommendedPosterDiv.append(poster);
											infoDiv.append(title);
											infoDiv.append(releaseDate);

											recommendedMovieDiv
													.append(recommendedPosterDiv);
											recommendedMovieDiv.append(infoDiv);
											recommendedMovieList
													.append(recommendedMovieDiv);
											recommendedGallery
													.append(recommendedMovieDiv);
										});
						recommendedMovieList.append(recommendedGallery);
					}
				</script>
			</div>
	
	<footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>
</body>
</html>