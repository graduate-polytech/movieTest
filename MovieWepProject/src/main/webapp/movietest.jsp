<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="KMDB.*,KMDB.LoadKMDBData.*, java.util.List, java.util.ArrayList, java.io.IOException, java.time.LocalDate, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 상세 정보</title>
<!-- 필요한 CSS 파일 링크 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/styles1.css">
<!-- 새로운 CSS 파일 사용 가능 -->
<script>
	// JavaScript 함수를 사용하여 영화명을 클릭하면 MovieDetailTest.jsp로 이동하도록 합니다.
	function redirectToMovieDetail(movieTitle, directorName) {
		// 영화명과 감독명을 함께 전달합니다.
		var queryParams = "?title=" + encodeURIComponent(movieTitle)
				+ "&director=" + encodeURIComponent(directorName);
		window.location.href = "MovieDetailTest.jsp" + queryParams;
	}

	function removeSpaces() {
		var titleInput = document.getElementById("title");
		titleInput.value = titleInput.value.trim();
	}
</script>
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
	<style>
/* 이미지 호버 효과 정의 */
.poster-img {
	max-width: 100%;
	transition: transform 0.3s ease-in-out; /* 호버 시에 변화를 부드럽게 적용 */
}

/* 호버 시 이미지 크기 확대 */
.poster-img:hover {
	transform: scale(1.1); /* 이미지 크기를 1.1배 확대 */
}
</style>
	<div class="container mt-5">
		<h2 class="text-center">영화 검색</h2>
		<form action="movietest.jsp" method="GET" onsubmit="removeSpaces()"
			style="display: flex; align-content: center; align-items: center; justify-content: center;">
			<div class="form-group"
				style="width: 80%; display: flex; align-content: center; align-items: center; justify-content: center; margin: 0px;">
				<label for="title"></label>
				<input type="text" class="form-control1" id="title" name="title" onsubmit="removeSpaces()"
					placeholder="" style="width: 80%;" required>
				<label>
					<input type="radio" name="types" value="title" checked>
					제목(title)
				</label>
				<label>
					<input type="radio" name="types" value="director">
					감독(director)
				</label>
				<br>
				<button type="submit" value="Search" class="btn btn-primary">검색</button>
			</div>
		</form>
		<%
		String movieTitle = request.getParameter("title");
		String resultHtml = ""; // 검색 결과를 저장할 빈 HTML 문자열
		String types = request.getParameter("types");
		ArrayList<KMDB_Data> movieInfoList = null;
		if (movieTitle != null && !movieTitle.isEmpty()) {

			LoadKMDBData loadData = new LoadKMDBData();

			if (types.equals("title")) {
				movieInfoList = loadData.getKMDB_title(movieTitle);
			} else {
				movieInfoList = loadData.getKMDB_director(movieTitle);
			}

			if (movieInfoList != null && !movieInfoList.isEmpty()) {
				for (KMDB_Data movieInfo : movieInfoList) {

					String movieSeq =  movieInfo.getMovieSeq();
					String title = movieInfo.getTitle();
					String director = movieInfo.getDirectors().get(0).getDirectorNm();
					String nation = movieInfo.getNation();
					String genre = movieInfo.getGenre();
					String prodYear = movieInfo.getProdYear();
		
					String posterUrl = movieInfo.getPosters()[0];
		
					resultHtml += "<div class='row mt-3'>";
					resultHtml += "<div class='col-md-4'>";
		
					if (posterUrl != null && !posterUrl.isEmpty() && !posterUrl.equals("")) {

				// 포스터 이미지가 있는 경우
				resultHtml += "<a href='MovieInfoOfMovieSeq.jsp?movieSeq=" + movieSeq + "'>";
				resultHtml += "<img class='poster-img' src='" + posterUrl + "' alt='포스터' style='max-width: 100%;'>";
				resultHtml += "</a>";
			} else {
				// 포스터 이미지가 없는 경우 흑백 로고 이미지 표시
				resultHtml += "<img class='poster-img' src='resource/images/흑백로고.png' alt='로고' style='max-width: 80%;'>";
			}
			resultHtml += "</div>";
			resultHtml += "<div class='col-md-8'>";
			resultHtml += "<h4><a href='MovieInfoOfMovieSeq.jsp?movieSeq=" + movieSeq + "'>" + title
					+ " (" + prodYear + ")</a></h4>";
			resultHtml += "<p>감독: " + director + "</p>";
			resultHtml += "<p>장르: " + genre + "</p>";
			resultHtml += "<p>국가: " + nation + "</p>";
			// 필요한 정보를 추가하세요
			resultHtml += "</div>";
			resultHtml += "</div>";
				}
			} else {
				resultHtml += "<p>검색 결과가 없습니다.</p>";
			}
		}
		%>
		<!-- Display the search results -->
		<div class="container mt-5">
			<h2 class="text-center"></h2>
			<%=resultHtml%>
		</div>
	</div>
	<footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>
</body>
</html>