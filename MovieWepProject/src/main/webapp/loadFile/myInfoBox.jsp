<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DB.DAO.*,DB.Data.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
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
String parm_type = request.getParameter("type");
parm_type = parm_type.equals("load") ? "load" : "insert";

Object sessionObj = session.getAttribute("userId");
String sessionId = sessionObj == null ? "" : (String) sessionObj;

DAO_UserDB userDB = new DAO_UserDB();
Data_User userData = userDB.loadUserData(sessionId);

String pram_userName = userData.getName();

String pram_userId = userData.getId();

String pram_email = userData.getEmail();
String[] email = {"", ""};
if (!pram_email.equals("")) {
	email = pram_email.split("@");
}
String pram_birthDay = userData.getBirthday().toString();

String pram_adress = userData.getAddress();
String pram_genre_1 = userData.getGenre_1();
String pram_genre_2 = userData.getGenre_2();
String pram_genre_3 = userData.getGenre_3();
String pram_genre_4 = userData.getGenre_4();

System.out.println("myInfoBox에서 출력[" + parm_type + "]");
System.out.println("pram_userName : " + pram_userName);
System.out.println("pram_userId : " + pram_userId);
System.out.println("pram_email : " + pram_email);
System.out.println("pram_birthDay : " + pram_birthDay);
System.out.println("pram_adress : " + pram_adress);
System.out.println("pram_genre_1 : " + pram_genre_1);
System.out.println("pram_genre_2 : " + pram_genre_2);
System.out.println("pram_genre_3 : " + pram_genre_3);
System.out.println("pram_genre_4 : " + pram_genre_4);
%>
<script type="text/javascript">
	function sample4_execDaumPostcode() {
		new daum.Postcode( {
				oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				document.getElementById("userAddress").value = data.roadAddress;
			}
		}).open();
	}

</script>
<datalist id="email_List">
	<option value="직접입력" />
	<option value="naver.com" />
	<option value="gmail.com" />
	<option value="daum.net" />
	<option value="hanmail.net" />
	<option value="hotmail.com" />
	<option value="korea.com" />
	<option value="yahoo.com" />
	<option value="nate.com" />
</datalist>
<datalist id="genre_List">
</datalist>
<div class="myInfoBox-60">
	<h1 id="noMargin">내 정보</h1>
	<form id="userInfoEdit" name="userInfoEdit" method="post" action="main.jsp"
		onsubmit="return userInfoEdit_F()"
	>
		<!-- userInfoEdit() -->
		<!--request.getRequestURI()I() %> -->
		<!-- 
			pram_userName
			pram_userId
			pram_email
			pram_birthDay
			pram_adress
			pram_genre_1
			 -->
		<div class="mar-tb-10">
			<!-- 이름 userName -->
			<label for="userName">이름</label>
			<input type="text" id="userName" name="userName" class="genreList form-control"
				value="<%=pram_userName%>" required
			>
		</div>
		<div class="mar-tb-10">
			<!-- 아이디 userId -->
			<label>아이디</label>
			<input type="text" id="userId" name="userId" class="genreList form-control"
				value="<%=pram_userId%>" required disabled='<%=parm_type.equals("load") ? "disabled" : ""%>'
			>
		</div>
		<input type="hidden" id="userPw" name="userPw" style="width: 100%" required>
		<div class="mar-tb-10">
			<!-- 이메일 userEmail_1 userEmail_2 -->
			<label>이메일</label>
			<br>
			<div class="input-group">
				<input id="userEmail_1" type="text" class="form-control" placeholder="Username"
					aria-label="Username" value="<%=email[0]%>" required
				>
				<span class="input-group-text">@</span>
				<input id="userEmail_2" type="text" class="form-control" list="email_List"
					placeholder="email 선택" aria-label="email 선택" value="<%=email[1]%>" required
				>
			</div>
		</div>
		<div class="input-group">
			<!-- 생일 birthDay -->
			<label for="birthDay">생년월일</label>
			<br>
			<jsp:include page="selectDate.jsp">
				<jsp:param name="param_date" value="<%=pram_birthDay%>" />
			</jsp:include>
		</div>
		<div class="input-group mar-tb-10">
			<!-- 주소 userAddress -->
			<label>주소</label>
			<div class="input-group mar-bot-10">
				<textarea type="text" id="userAddress" class="form-control" placeholder="거주지 입력"
					disabled="disabled"
				><%=pram_adress%></textarea>
				<button class="btn btn-outline-secondary" type="button" onclick="sample4_execDaumPostcode()">주소
					검색</button>
			</div>
		</div>
		<div class="mar-tb-10">
			<!-- 장르 Genre_1 Genre_2 Genre_3 Genre_4 -->
			<label>선호 장르</label>
			<div class="input-group">
				<input type="text" id="Genre_1" class="genreList form-control" list="genre_List"
					placeholder="선호 장르 선택" value="<%=pram_genre_1%>"
				>
				<input type="text" id="Genre_2" class="genreList form-control" list="genre_List"
					placeholder="선호 장르 선택" value="<%=pram_genre_2%>"
				>
			</div>
			<div class="input-group">
				<input type="text" id="Genre_3" class="genreList form-control" list="genre_List"
					placeholder="선호 장르 선택" value="<%=pram_genre_3%>"
				>
				<input type="text" id="Genre_4" class="genreList form-control" list="genre_List"
					placeholder="선호 장르 선택" value="<%=pram_genre_4%>"
				>
			</div>
		</div>
		<div style="display: flex; width: 100%; flex-direction: row-reverse;">
			<button id="login-btn" type="submit" class="btn btn-primary"
				style="margin: 10px auto; margin-right: 0px;"
			>
				<h5>저장</h5>
			</button>
		</div>
	</form>
</div>
<script type="text/javascript">
	function enterBreak(event) {
		if (event === 'Enter') {
			event.preventDefault();
			//idcheck_f();
			// 원하는 작업을 수행하세요.
		}
	}
	var email = [];
	email.push("직접입력");
	email.push("naver.com");
	email.push("gmail.com");
	email.push("kakao.com");
	email.push("hanmail.net");
	email.push("daum.net");
	email.push("hotmail.com");
	email.push("korea.com");
	email.push("yahoo.com");
	email.push("nate.com");

	var genre = [];
	genre.push("드라마");
	genre.push("첩보");
	genre.push("옴니버스");
	genre.push("뮤직");
	genre.push("동성애");
	genre.push("로드무비");
	genre.push("아동");
	genre.push("하이틴(고교)");
	genre.push("전기");
	genre.push("청춘영화");
	genre.push("재난");
	genre.push("문예");
	genre.push("연쇄극");
	genre.push("신파");
	genre.push("활극");
	genre.push("반공/분단");
	genre.push("군사");
	genre.push("계몽");
	genre.push("사회물(경향)");
	genre.push("스포츠");
	genre.push("합작(번안물)");
	genre.push("종교");
	genre.push("무협");
	genre.push("미스터리");
	genre.push("SF");
	genre.push("코메디");
	genre.push("느와르");
	genre.push("액션");
	genre.push("범죄");
	genre.push("어드벤처");
	genre.push("가족");
	genre.push("에로");
	genre.push("멜로/로맨스");
	genre.push("공포");
	genre.push("뮤지컬");
	genre.push("시대극/사극");
	genre.push("실험");
	genre.push("스릴러");
	genre.push("서부");
	genre.push("전쟁");
	genre.push("갱스터");
	genre.push("판타지");
	genre.push("해양액션");

	
	$(document).ready(function() {
		$(".genreList").on("focus", function() {
			var $this = $(this);
			var allElements = $(".genreList").not($this); // 현재 포커스된 요소를 제외한 다른 요소들
			var list_1 = genre;
			var list_2 = [];
			allElements.each(function() {
				var otherValue = $(this).val();
				var listName = $(this).attr('list');
				list_2.push(otherValue);
				
				var difference = list_1.filter(otherValue => !list_2.includes(otherValue));
				
				//console.log(difference);

				updateDataList(listName,difference);
			});
			
		});
	});
	function updateDataList(dataListName,arr) {
		console.log(dataListName);
		var dataList = document.getElementById(dataListName);
		dataList.innerHTML = "";
		
		arr.forEach(function(option) {
			var optionElement = document.createElement("option");
			optionElement.value = option;
			dataList.appendChild(optionElement);
		});
	}
	</script>
</html>