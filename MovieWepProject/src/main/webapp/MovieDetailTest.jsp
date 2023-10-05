<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boxOffice.*, java.util.List, java.io.IOException, java.util.ArrayList" %>

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

    List<MovieInfo> ListData = new ArrayList<>(); // ListData 리스트를 생성

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
                    // 데이터를 ListData에 추가
                    ListData.add(movieInfo);
                    break; // 일치하는 데이터를 찾았으면 루프 종료
                }
            }

            // 일치하는 데이터를 찾지 못한 경우 첫 번째 데이터를 ListData에 추가
            /*if (!matchFound) {
                ListData.add(movieInfoList.get(0));
            }*/	
        }
    }
%>


    <%-- 이제 데이터를 ListData에서 사용할 수 있습니다. --%>
    <% for (MovieInfo movieInfo : ListData) { %>
        <p>데이터 표시 :</p>
        <p>영화명: <%= movieInfo.getMovieTitle() %></p>
        <p>감독명: <%= movieInfo.getDirectorName() %></p>
        <p>줄거리 : <%= movieInfo.getPlot() %></p>
        <p>배우: <%= movieInfo.getActors() %></p>
        <p>개봉일 : <%= movieInfo.getRepRlsDate() %>
        <%-- 포스터 이미지를 표시 --%>
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
        %>
    <% } %>

</body>
</html>
