<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boxOffice.*, java.util.List, java.util.ArrayList, java.io.IOException, java.time.LocalDate, java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Search</title>
    <script>
        // JavaScript 함수를 사용하여 영화명을 클릭하면 MovieDetailTest.jsp로 이동하도록 합니다.
        function redirectToMovieDetail(movieTitle, directorName) {
            // 영화명과 감독명을 함께 전달합니다.
            var queryParams = "?title=" + encodeURIComponent(movieTitle) + "&director=" + encodeURIComponent(directorName);
            window.location.href = "MovieDetailTest.jsp" + queryParams;
        }

        // 입력된 영화명에서 공백을 제거하는 함수
        function cleanTitle() {
            var titleInput = document.getElementById("title");
            titleInput.value = titleInput.value.trim();
        }
    </script>
</head>
<body>
    <h1>Movie Search</h1>
    <form action="movietest.jsp" method="GET">
        <label for="title">Enter Movie Title:</label>
        <input type="text" id="title" name="title" required oninput="cleanTitle()">
        <input type="submit" value="Search">
    </form>

    <%
        String movieTitle = request.getParameter("title");

        if (movieTitle != null && !movieTitle.isEmpty()) {
            List<MovieInfo> movieInfoList = boxOffice.MovieDetail2.searchMovieInfo(movieTitle);

            if (movieInfoList != null && !movieInfoList.isEmpty()) {
                %>
                <h2>Movie Information for "<%= movieTitle %>":</h2>
                <ul>
                    <%
                    for (MovieInfo movieInfo : movieInfoList) {
                        %>
                        <li>
                            <!-- 영화명을 클릭하면 JavaScript 함수를 호출하여 MovieDetailTest.jsp로 이동합니다. -->
                            <a href="#" onclick="redirectToMovieDetail('<%= movieInfo.getMovieTitle() %>', '<%= movieInfo.getDirectorName() %>')">
                                <%= movieInfo.getMovieTitle() %>
                            </a>
                        </li>
                        <li>Director: <%= movieInfo.getDirectorName() %></li>
                        <li>Nation: <%= movieInfo.getNation() %></li>
                        <li>poster: <%
                        List<String> posters = movieInfo.getPosters();
                        if (!posters.isEmpty()) {
                            // 하나의 포스터만 표시하도록 변경
                            String firstPoster = posters.get(0);
                        %>
                                <img src="<%= firstPoster %>" alt="Movie Poster"><br>
                        <%
                        } else {
                        %>
                            No posters available.
                        <%
                        }
                        %></li>
                        <br>
                        <%
                    }
                    %>
                </ul>
                <%
            }
        }
    %>

</body>
</html>
