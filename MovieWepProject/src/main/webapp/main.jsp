<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main 페이지</title>
    <style>
    
    .container-with-box {

	    btn-border-width : 100px
	}
    </style>
</head>
<body>
    <h1>Main 페이지</h1>
    
    <div class="main-content">
        <!-- 메인 페이지의 내용을 추가합니다. -->
    </div>
    
    <!-- 박스형 컨테이너 포함 -->

    <jsp:include page="mini_userInfo.jsp"/>
    
    <div class="other-content">
        <!-- 다른 내용을 추가합니다. -->
    </div>
</body>
</html>
