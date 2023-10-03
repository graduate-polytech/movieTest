<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boxOffice.*, java.util.List, java.io.IOException" %>

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
            // 일치하는 데이터가 있는지 확인
            boolean matchFound = false;

            // movieInfoList를 순회하며 영화 제목과 감독명이 포함된 데이터가 있는지 확인
            for (MovieInfo movieInfo : movieInfoList) {
                if (movieInfo.getMovieTitle().contains(movieTitle) && movieInfo.getDirectorName().equals(dName)) {
                    matchFound = true;
                    %>
                    <p>일치하는 데이터가 있습니다:</p>
                    <p>Movie Title: <%= movieInfo.getMovieTitle() %></p>
                    <p>Director Name: <%= movieInfo.getDirectorName() %></p>
                    // 포스터 이미지를 표시
                    <%
                    List<String> posters = movieInfo.getPosters();
                    if (!posters.isEmpty()) {
                        String firstPoster = posters.get(0);
                    %>
                        <p>Poster:</p>
                        <img src="<%= firstPoster %>" alt="Movie Poster"><br>
                    <%
                    } else {
                    %>
                        <p>포스터 없음.</p>
                    <%
                    }
                    break; // 일치하는 데이터를 찾았으면 루프 종료
                }
            }

            // 일치하는 데이터를 찾지 못한 경우 첫 번째 데이터 표시
            if (!matchFound) {
                %>
                <p>일치하는 데이터를 찾을 수 없습니다. 첫 번째 데이터를 표시합니다:</p>
                <p>Movie Title: <%= movieInfoList.get(0).getMovieTitle() %></p>
                <p>Director Name: <%= movieInfoList.get(0).getDirectorName() %></p>
                // 첫 번째 데이터의 포스터 이미지를 표시
                <%
                List<String> posters = movieInfoList.get(0).getPosters();
                if (!posters.isEmpty()) {
                    String firstPoster = posters.get(0);
                %>
                    <p>Poster:</p>
                    <img src="<%= firstPoster %>" alt="Movie Poster"><br>
                <%
                } else {
                %>
                    <p>포스터 없음.</p>
                <%
                }
            }
        } else {
    %>
    <p>영화 정보를 찾을 수 없습니다.</p>
    <%
    }
}
%>

</body>
</html>
