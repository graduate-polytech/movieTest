<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boxOffice.*, java.util.List, java.util.ArrayList, java.io.IOException, java.time.LocalDate, java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html>
<head>
    <title>Movie Detail</title>
</head>
<body>
    <h1>Movie Detail</h1>

    <%
    String movieTitle = request.getParameter("title");
    String dName = request.getParameter("director");

    if (movieTitle != null && !movieTitle.isEmpty()) {
        List<MovieInfo> movieInfoList = boxOffice.MovieDetail2.searchMovieInfo(movieTitle);

        // 영화 정보가 있을 때 처리
        if (movieInfoList != null && !movieInfoList.isEmpty()) {
            int matchingIndex = -1; // 매칭된 인덱스를 저장할 변수

            // movieInfoList를 순회하며 movieTitle과 dName이 동일한 데이터가 있는지 확인
            for (int i = 0; i < movieInfoList.size(); i++) {
                MovieInfo movieInfo = movieInfoList.get(i);
                if (movieInfo.getMovieTitle().equals(movieTitle) && movieInfo.getDirectorName().equals(dName)) {
                    matchingIndex = i;
                    break; // 일치하는 데이터를 찾으면 루프 종료
                }
            }

            // 일치하는 데이터를 찾았을 때 결과를 화면에 표시
            if (matchingIndex != -1) {
                %>
                <p>영화 제목과 감독명이 동일한 데이터는 리스트의 <%= matchingIndex %>번째에 있습니다.</p>
                <p>Movie Title: <%= movieInfoList.get(matchingIndex).getMovieTitle() %></p>
                <p>Director Name: <%= movieInfoList.get(matchingIndex).getDirectorName() %></p>
                <%
            } else {
                %>
                <p>일치하는 데이터를 찾을 수 없습니다.</p>
                <p>Movie Title: <%= movieInfoList.get(0).getMovieTitle() %></p>
                <p>Director Name: <%= movieInfoList.get(0).getDirectorName() %></p>
                <p>Movie Title: <%= movieTitle %></p>
                <p>Director Name: <%= dName %></p>
                <%
            }
        }
    }
    %>

</body>
</html>
