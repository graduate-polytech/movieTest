<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<link rel="stylesheet" href="resource/css/styles1.css">


<div class="miniLoginBox">
	<div style="margin: 0px auto;">
		<input type="text" class="" id="floatingInput" placeholder="ID"
			style="width: 100%; margin: auto;"> <input type="password"
			class="" id="" placeholder="Password" style="width: 100%">
	</div>
	<input id="login-btn" type="submit" class="btn btn-primary" value="로그인"
		style="width: 60px; height: 60px; font-size: 15px; padding: 3px;">
</div>
	



<a href="signup.jsp" class="">회원가입</a>
/
<a href="#" class="">비밀번호 찾기</a>


<!-- <P><button id="signup-btn" type="button" class="btn btn-outline-primary">회원가입</button> </P> -->
<script>
	// 버튼 요소를 가져오기
	var moveButton = document.getElementById("login-btn");

	// 버튼 클릭 이벤트 리스너 추가
	moveButton.addEventListener("click", function() {
		// 이동할 페이지 URL을 설정
		var targetPageUrl = "login.jsp"; // 이동할 페이지 URL을 여기에 입력하세요

		// 페이지 이동
		window.location.href = targetPageUrl;
	});
</script>
