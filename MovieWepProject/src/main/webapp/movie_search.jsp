<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 검색</title>
    <!-- 필요한 CSS 파일 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/styles1.css">
</head>
<body>
    <!-- 상단 메뉴바 추가 (동일한 형식으로) -->
    <jsp:include page="loadFile/top.jsp" />
    <jsp:include page="loadFile/menuBar.jsp" />

    <!-- 검색창 추가 -->
    <div class="container mt-5">
        <h2 class="text-center">영화 검색</h2>
        <form action="searchMovieResults.jsp" method="GET" style="
    	display: flex;
    	align-content: center;
    	align-items: center;
    	justify-content: center;"
        >
     <div class="form-group" style="
    	width: 80%;
    	display: flex;
    	align-content: center;
    	align-items: center;
    	justify-content: center;
    	margin: 0px;
            ">
     <label for="searchQuery"></label>
     <input type="text" class="form-control1" id="searchQuery" name="query" placeholder="영화 제목을 입력하세요" style= "
    	width: 80%; 
    	
                ">
    <button type="submit" class="btn btn-primary">검색</button>
            </div>      
        </form>
    </div> 

    <!-- 하단 메뉴 및 스크립트 추가 (동일한 형식으로) -->
    <!-- ... -->
   <footer>
		<p>&copy; 시네마 위키</p>
	</footer>
</body>
</html>
