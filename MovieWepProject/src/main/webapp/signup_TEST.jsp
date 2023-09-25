<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&libraries=places"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/styles1.css" type="text/css">
<script src="resource/js/signupCheck.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	
	
function sample4_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			document.getElementById("userAddress").value = data.roadAddress;
		}
	}).open();
}

</script>

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

	<div class="signup-layout">
		<h1>회원가입</h1>
		<form id="signupForm" name="signupForm" method="post" action="main.jsp" onsubmit="return checkSignUpData()">
			<!--request.getRequestURI()I() %> -->
			<%
			boolean checkIdOverlap = false;
			%>

			<div class="rowMargin">
				<!-- 아이디 userName -->
				<label for="userName">이름</label> <input type="text" id="userName"
					name="userName" style="width: 100%" required>
			</div>
			<div class="rowMargin">
				<!-- 아이디 userId -->
				<label>아이디</label> <input id="idCheck_btn" type="button"
					value="중복확인" style="font-size: 14px;"> <br> <input
					type="text" id="userId" name="userId" style="width: 100%" required>
			</div>

			<div class="rowMargin">
				<!-- 패스워드 userPw -->
				<label>패스워드</label> <br> <input type="password" id="userPw"
					name="userPw" style="width: 100%" required>
			</div>

			<div class="rowMargin">
				<!-- 패스워드 확인 checkPassword -->
				<label>패스워드 확인</label> <span id="passwordGuide"
					style="color: red; display: none;"> </span> <br> <input
					id="checkPassword" type="password" style="width: 100%" required>
			</div>
			<div class="rowMargin ">
				<!-- 이메일 userEmail_1 userEmail_2 -->
				<label>이메일</label><br>
				<div class="genres">
					<input id="userEmail_1" type="text" style="width: 48%" required>@<input
						id="userEmail_2" type="text" list="email-domain" placeholder = "email 선택"
						style="width: 48%" required>
				</div>
			</div>

			<div class="rowMargin">
				<!-- 생일 birthDay -->
				<label for="birthDay">생년월일</label><br> <input id="birthDay"
					type="date" style="width: 100%" required>
			</div>
			<div class="rowMargin">
				<!-- 주소 userAddress -->
				<label>주소</label> <input type="button"
					onclick="sample4_execDaumPostcode()" value="주소 검색"
					style="font-size: 14px;"> <br>
				<div>
					<input type="hidden" class="w150" id="sample4_postcode"
						placeholder="우편번호"> <input type="text" id="userAddress"
						name="userAddress" placeholder="도로명주소" disabled = "disabled" style="width: 100%" required>
					<input type="hidden" class="w150" id="sample4_jibunAddress"
						placeholder="지번주소"> <span id="guide"
						style="color: #999; display: unset;"> </span> <input type="hidden"
						class="w150" id="sample4_detailAddress" placeholder="상세주소">
					<input type="hidden" class="w150" id="sample4_extraAddress"
						placeholder="참고항목">
				</div>
			</div>

			<div class="rowMargin">
				<!-- 장르 Genre_1 Genre_2 Genre_3 Genre_4 -->
				<label style="width: 100%">선호 장르</label> <br> <input
					type="text" id="Genre_1" name="Genre_1" list="genre"
					placeholder="선로 장르 선택" style="width: 49%"> <input
					type="text" id="Genre_2" name="Genre_2" list="genre"
					placeholder="선로 장르 선택" style="width: 49%"> <input
					type="text" id="Genre_3" name="Genre_3" list="genre"
					placeholder="선로 장르 선택" style="width: 49%"> <input
					type="text" id="Genre_4" name="Genre_4" list="genre"
					placeholder="선로 장르 선택" style="width: 49%">
			</div>

			<div style="display: flex; width: 100%; flex-direction: row-reverse;">
				<button id="login-btn" type="submit" class="btn btn-primary"
					style="margin: 10px auto; margin-right: 0px;">
					<h5>회원가입</h5>
				</button>
			</div>
		</form>
		<%
		if (request.getMethod().equalsIgnoreCase("post")) {

			if (checkIdOverlap == false) {
				return;
			}

			String name = request.getParameter("userName");
			String id = request.getParameter("userId");
			String pw = request.getParameter("userPw");
			String address = request.getParameter("userAddress");
			String genre = request.getParameter("Genre_1") + "|" + request.getParameter("Genre_2") + "|"
			+ request.getParameter("Genre_3") + "|" + request.getParameter("Genre_4");

			// JDBC를 사용하여 MySQL 데이터베이스에 연결하고 데이터 삽입 로직을 추가하세요.
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/moviedb";
				String username = "root";
				String password = "0000";
				Connection connection = DriverManager.getConnection(url, username, password);
				String query = "INSERT INTO user (name, id, pw, address, genre) VALUES (?, ?, ?, ?, ?)";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, id);
				preparedStatement.setString(3, pw);
				preparedStatement.setString(4, address);
				preparedStatement.setString(5, genre);
				int rowsInserted = preparedStatement.executeUpdate();
				preparedStatement.close();
				connection.close();

				if (rowsInserted > 0) {
		%>
		<script>
        alert("데이터가 성공적으로 삽입되었습니다.");
        //window.location.href = "main.jsp";
    </script>
		<%
		} else {
		%>
		<script>
        alert("데이터 삽입 중 오류가 발생했습니다.");
    </script>
		<%
		}
		} catch (Exception e) {
		%>
		<script>
        alert("데이터 삽입 중 오류가 발생했습니다. <%=e.getMessage()%>");
    </script>
		<%
		e.printStackTrace();
		}
		}
		%>
	</div>


	<footer>
		<p>&copy; 시네마 위키</p>
	</footer>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function () {
	    // 스크립트 내용을 이곳에 넣으세요.
	// 텍스트 상자에서 입력된 값을 제외하고 나머지 상자에서 리스트를 보여주는 함수
	document.getElementById('signupForm').addEventListener('keydown', function (e) {
		if (e.key === 'Enter') {
			e.preventDefault();
			// 원하는 작업을 수행하세요.
		}
	});
	document.getElementById('userId').addEventListener('keydown', function (e) {
		if (e.key === 'Enter') {
			idcheck_f();
			// 원하는 작업을 수행하세요.
		}
	});
	    
	function updateGenreList() {
	    const datalist = document.getElementById('genre');

	    // 모든 입력란의 값을 모으기
	    const inputs = document.querySelectorAll('input[list="genre"]');
	    const inputValues = Array.from(inputs).map(input => input.value);

	    // 모든 옵션을 다시 보이도록 설정
	    for (let i = 0; i < datalist.options.length; i++) {
	        datalist.options[i].disabled = false;
	    }

	    // 다른 모든 입력란에서 입력된 값을 비활성화
	    inputs.forEach((input, index) => {
	        const otherInputs = inputValues.slice();
	        otherInputs.splice(index, 1); // 현재 입력을 제외

	        otherInputs.forEach(otherValue => {
	            for (let j = 0; j < datalist.options.length; j++) {
	                if (datalist.options[j].value === otherValue) {
	                    datalist.options[j].disabled = true;
	                }
	            }
	        });
	    });
	}

	// 각각의 텍스트 상자에서 입력이 변경될 때마다 호출하여 업데이트
	document.getElementById('Genre_1').addEventListener('change', updateGenreList);
	document.getElementById('Genre_2').addEventListener('change', updateGenreList);
	document.getElementById('Genre_3').addEventListener('change', updateGenreList);
	document.getElementById('Genre_4').addEventListener('change', updateGenreList);
	
	function idcheck_f() {
		const button = document.getElementById('idCheck_btn');
		const input = document.getElementById("userId");
		button.style.backgroundColor = "blue"; // 색상 변경
		button.style.color = "white"; // 글자색 변경
		button.style.borderRadius = "5px";
		input.disabled = true;
		<%checkIdOverlap = true;%>
	}
	document.getElementById('idCheck_btn').addEventListener('click', idcheck_f);
	
	function checkPassword_f(){
		var guideTextBox = document.getElementById("passwordGuide");
		var userPw = document.getElementById('userPw').value;
		var checkPassword = document.getElementById('checkPassword').value;
        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		if(userPw !== checkPassword){
	        guideTextBox.innerHTML = '패스워드가 일치하지 않습니다.';
	        guideTextBox.style.display = 'block';
	        guideTextBox.style.color = "red";
        }else{
        	guideTextBox.innerHTML = '패스워드가 일치합니다.';
	        guideTextBox.style.display = 'none';
	        guideTextBox.style.color = "blue";
        }
	}
	document.getElementById('userPw').addEventListener('input', checkPassword_f);
	document.getElementById('checkPassword').addEventListener('input', checkPassword_f);
	
	var userEmail2 = document.getElementById('userEmail_2');
    
    // 선택값이 변경될 때 이벤트 처리
    userEmail2.addEventListener('input', function() {
        if (this.value === '직접입력') {
            // "직접입력"을 선택한 경우 텍스트 상자 값을 공백으로 설정
            this.placeholder = '직접입력';
            this.value = '';
        }
    });
	
});
	</script>
</body>
</html>