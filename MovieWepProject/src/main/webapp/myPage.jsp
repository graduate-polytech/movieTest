<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/styles1.css" type="text/css">

<script src="resource/js/signin.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	function sample4_execDaumPostcode() {
		new daum.Postcode( {
				oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				document.getElementById("userAddress").value = data.roadAddress;
			}
		}).open();
	}
	document.addEventListener('DOMContentLoaded', function() {
		
	});
    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
      // 세션에 데이터를 체크하는 예시
      var sessionData = '<%=session.getAttribute("userId")%>';

		if (sessionData.trim() == 'null') {
			// 세션에 데이터가 없는 경우, 'signin.jsp'로 리다이렉트
			window.location.href = 'signin.jsp';
		}
	}
</script>
<style>
label {
	margin-top: 10px;
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<datalist id="email-domain">
		<option value="직접입력" />
		<option value="gmail.com" />
		<option value="hanmail.net" />
		<option value="daum.net" />
		<option value="hotmail.com" />
		<option value="korea.com" />
		<option value="naver.com" />
		<option value="yahoo.com" />
		<option value="nate.com" />
	</datalist>
	<datalist id="genre">
		<option value="드라마" />
		<option value="첩보" />
		<option value="옴니버스" />
		<option value="뮤직" />
		<option value="동성애" />
		<option value="로드무비" />
		<option value="아동" />
		<option value="하이틴(고교)" />
		<option value="전기" />
		<option value="청춘영화" />
		<option value="재난" />
		<option value="문예" />
		<option value="연쇄극" />
		<option value="신파" />
		<option value="활극" />
		<option value="반공/분단" />
		<option value="군사" />
		<option value="계몽" />
		<option value="사회물(경향)" />
		<option value="스포츠" />
		<option value="합작(번안물)" />
		<option value="종교" />
		<option value="무협" />
		<option value="미스터리" />
		<option value="SF" />
		<option value="코메디" />
		<option value="느와르" />
		<option value="액션" />
		<option value="범죄" />
		<option value="어드벤처" />
		<option value="가족" />
		<option value="에로" />
		<option value="멜로/로맨스" />
		<option value="공포" />
		<option value="뮤지컬" />
		<option value="시대극/사극" />
		<option value="실험" />
		<option value="스릴러" />
		<option value="서부" />
		<option value="전쟁" />
		<option value="갱스터" />
		<option value="판타지" />
		<option value="해양액션" />
	</datalist>
	<header>
		<div id="top">
			<jsp:include page="loadFile/top.jsp" />
			<jsp:include page="loadFile/menuBar.jsp" />
		</div>
	</header>
	<body_main>
	<div class="signup-layout">
		<h1>내 정보</h1>
		<form id="userInfoEdit" name="userInfoEdit" method="post" action="main.jsp" onsubmit="return userInfoEdit_F()"><!-- userInfoEdit() -->
			<!--request.getRequestURI()I() %> -->
			<!-- 
			userName
			userId
			userPw
			checkPassword
			userEmail_1
			userEmail_2
			birthDay
			userAddress
			Genre_1
			Genre_2
			Genre_3
			Genre_4
			 -->
			<div class="rowMargin">
				<!-- 이름 userName -->
				<label for="userName">이름</label>
				<input type="text" id="userName" name="userName" style="width: 100%" required>
			</div>
			<div class="rowMargin">
				<!-- 아이디 userId -->
				<label>아이디</label>
				<input type="text" id="userId" name="userId" style="width: 100%" required>
			</div>
			<input type="hidden" id="userPw" name="userPw" style="width: 100%" required>
			<div class="rowMargin ">
				<!-- 이메일 userEmail_1 userEmail_2 -->
				<label>이메일</label>
				<br>
				<div class="genres">
					<input id="userEmail_1" type="text" style="width: 48%" required>
					@
					<input id="userEmail_2" type="text" list="email-domain" placeholder="email 선택" style="width: 48%" required>
				</div>
			</div>
			<div class="rowMargin">
				<!-- 생일 birthDay -->
				<label for="birthDay">생년월일</label>
				<br>
				<input id="birthDay" type="date" style="width: 100%" required>
			</div>
			<div class="rowMargin">
				<!-- 주소 userAddress -->
				<label>주소</label>
				<input type="button" onclick="sample4_execDaumPostcode()" value="주소 검색" style="font-size: 14px;">
				<br>
				<div>
					<input type="hidden" class="w150" id="sample4_postcode" placeholder="우편번호">
					<input type="text" id="userAddress" name="userAddress" placeholder="도로명주소" disabled="disabled" style="width: 100%" required>
					<input type="hidden" class="w150" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="AddressGuide" style="color: #999; display: unset;"> </span>
					<input type="hidden" class="w150" id="sample4_detailAddress" placeholder="상세주소">
					<input type="hidden" class="w150" id="sample4_extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div class="rowMargin">
				<!-- 장르 Genre_1 Genre_2 Genre_3 Genre_4 -->
				<label style="width: 100%">선호 장르</label>
				<br>
				<input type="text" id="Genre_1" name="Genre_1" list="genre" placeholder="선로 장르 선택" style="width: 49%">
				<input type="text" id="Genre_2" name="Genre_2" list="genre" placeholder="선로 장르 선택" style="width: 49%">
				<input type="text" id="Genre_3" name="Genre_3" list="genre" placeholder="선로 장르 선택" style="width: 49%">
				<input type="text" id="Genre_4" name="Genre_4" list="genre" placeholder="선로 장르 선택" style="width: 49%">
			</div>
			<div style="display: flex; width: 100%; flex-direction: row-reverse;">
				<button id="login-btn" type="submit" class="btn btn-primary" style="margin: 10px auto; margin-right: 0px;">
					<h5>저장</h5>
				</button>
			</div>
		</form>
	</div>
	</body_main>
	<footer>
		<p>&copy; 시네마 위키</p>
	</footer>
	<script type="text/javascript">
	function enterBreak(event) {
		if (event === 'Enter') {
			event.preventDefault();
			//idcheck_f();
			// 원하는 작업을 수행하세요.
		}
	}
	document.addEventListener('DOMContentLoaded', function() {
		// 스크립트 내용을 이곳에 넣으세요.
		// 텍스트 상자에서 입력된 값을 제외하고 나머지 상자에서 리스트를 보여주는 함수
		document.getElementById('userInfoEdit').addEventListener('keydown', enterBreak);
		document.getElementById('userId').addEventListener('keydown', enterBreak);

		// 각각의 텍스트 상자에서 입력이 변경될 때마다 호출하여 업데이트
		document.getElementById('Genre_1').addEventListener('change', updateGenreList);
		document.getElementById('Genre_2').addEventListener('change', updateGenreList);
		document.getElementById('Genre_3').addEventListener('change', updateGenreList);
		document.getElementById('Genre_4').addEventListener('change', updateGenreList);

		//document.getElementById('idCheck_btn').addEventListener('click', idcheck_f);
		//document.getElementById('userPw').addEventListener('input', checkPassword_f);
		//document.getElementById('checkPassword').addEventListener('input', checkPassword_f);
		document.getElementById('userEmail_2').addEventListener('input', inputEmail_2);
		
		document.getElementById('userName').value = '<%=session.getAttribute("userName")%>';
		document.getElementById('userId').value = '<%=session.getAttribute("userId")%>';
		document.getElementById('userPw').value = '<%=session.getAttribute("userPw")%>';
		document.getElementById('userEmail_1').value = '<%=session.getAttribute("userEmail")%>'.split("@")[0];
		document.getElementById('userEmail_2').value = '<%=session.getAttribute("userEmail")%>'.split("@")[1];
		document.getElementById('birthDay').value = '<%=session.getAttribute("birthDay")%>';
		document.getElementById('userAddress').value = '<%=session.getAttribute("userAddress")%>';
		document.getElementById('Genre_1').value = '<%=session.getAttribute("Genre_1")%>';
		document.getElementById('Genre_2').value = '<%=session.getAttribute("Genre_2")%>';
		document.getElementById('Genre_3').value = '<%=session.getAttribute("Genre_3")%>';
		document.getElementById('Genre_4').value = '<%=session.getAttribute("Genre_4")%>';
	});
	</script>
</body>
</html>