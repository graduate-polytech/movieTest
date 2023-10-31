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
<%
Object sessionObj = session.getAttribute("userId");
String sessionId = "";
System.out.println(sessionObj);
if(sessionObj == null){
	%>
	<script type="text/javascript">
		window.location.href = 'signin.jsp';
	</script>
	<%
} else{
	sessionId = (String)sessionObj;
}
	
%>

<script type="text/javascript">

    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
      // 세션에 데이터를 체크하는 예시
      var sessionData = "<%=sessionId%>";

		if (sessionData.trim() == "") {
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
	<main>
		<header>
			<div id="top">
				<jsp:include page="loadFile/top.jsp" />
				<jsp:include page="loadFile/menuBar.jsp" />
			</div>
		</header>
		<div class="shadowBox myInfoBox">
		<!-- 내 정보 불러오기 load -->
		<!-- 내 정보 등록하기(회원가입) insert -->
			<jsp:include page="loadFile/myInfoBox.jsp">
				<jsp:param name="type" value="load" />
			</jsp:include>
		</div>
		<footer>
			<p>&copy; 시네마 위키</p>
		</footer>
		
	</main>
</body>
</html>