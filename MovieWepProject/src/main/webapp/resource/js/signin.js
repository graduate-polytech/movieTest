function displayErrorMessages(messages) {
	alert(messages);
	// DBConTest();
}

function userInfoEdit_F() {

//	alert("userInfoEdit");
	var form = document.getElementById('userInfoEdit');

	var userName = form.userName.value;
	var userId = form.userId.value;
	var userPw = form.userPw.value;
	var userEmail_1 = form.userEmail_1.value;
	var userEmail_2 = form.userEmail_2.value;
	var birthDay = form.birthDay.value;
	var userAddress = form.userAddress.value;
	var Genre_1 = form.Genre_1.value;
	var Genre_2 = form.Genre_2.value;
	var Genre_3 = form.Genre_3.value;
	var Genre_4 = form.Genre_4.value;
	var errorMessages = "";
	var data = {
		"userName" : userName,
		"userId" : userId,
		"userPw" : userPw,
		"userEmail" : userEmail_1 + '@' + userEmail_2,
		"birthDay" : birthDay,
		"userAddress" : userAddress,
		"Genre_1" : Genre_1,
		"Genre_2" : Genre_2,
		"Genre_3" : Genre_3,
		"Genre_4" : Genre_4
	};
	// 이름 길이 검사
	if (userName.length < 2 || userName.length > 10) {
		errorMessages = errorMessages + "\n" + "이름은 2글자 이상 10글자 이하여야 합니다.";
	}
	// 이름 유효성 검사
	if (!isValidName(userName)) {
		errorMessages = errorMessages + "\n" + "이름은 특수문자가 포함될 수 없습니다.";
	}

	// 아이디 길이 검사
	if (userId.length < 8 || userId.length > 20) {
		errorMessages = errorMessages + "\n" + "아이디는 8글자 이상 20글자 이하여야 합니다.";
	}
	// 아이디 유효성 검사
	if (!isValidIdPw(userId)) {
		errorMessages = errorMessages + "\n" + "아이디는 영어와 숫자만 사용할수 있습니다.";
	}

	if (!isValidEmail(userEmail_1, userEmail_2)) {
		errorMessages = errorMessages + "\n" + "올바른 이메일 주소 형식이 아닙니다.";
	}

	if (!isValidBirthDay(birthDay)) {
		errorMessages = errorMessages + "\n" + '잘못된 날짜입니다.';
	}

	if (errorMessages.length > 0) {
		// 에러 메시지를 화면에 표시하거나 다른 방법으로 사용자에게 알릴 수 있습니다.
		displayErrorMessages(errorMessages);
		return false; // 폼 제출을 막음
	}
	var result = -1;
	$.ajax({
		type : "POST",
		url : "userInfoEditServlet", // 서블릿 경로
		data : JSON.stringify(data), // JSON 형식으로 데이터 전송
		contentType : "application/json",
		async : false,
		success : function(response) {
			// 서버로부터의 응답 처리
			result = response.result;

			// alert(response.message + ":" + (result == 1)); // 서버의 응답 메시지 출력
		}
	});

	if (result == 0) {
		alert("정보를 수정했습니다.");
	} else if (result == 1) {
		alert("정보를 수정할수 없습니다.");
		return false;
	} else {
		alert("정보 수정중 문제가 발생했습니다.");
		return false;
	}
	// DB등록
	return true; // 유효성 검사 통과
}

function trySignOut(id) {
	// alert("로그아웃" + id);
	var data = {
		"userId" : id,
	};
	$.ajax({
		type : "POST",
		url : "SignOut", // 서블릿 경로
		data : JSON.stringify(data), // JSON 형식으로 데이터 전송
		contentType : "application/json",
		async : false,
		success : function(response) {
			// 서버로부터의 응답 처리
			result = response.result;
		}
	});
	alert("로그아웃" + result);
	window.location.reload();
}

function trySignIn() {

	var form = document.getElementById('signinForm');
	
	var userId = form.userId.value;
	var userPw = form.userPw.value;
	//alert("로그인 시도");
	var errorMessages = "";
	var data = {
		"userId" : userId,
		"userPw" : userPw
	};
	if (errorMessages.length > 0) {
		// 에러 메시지를 화면에 표시하거나 다른 방법으로 사용자에게 알릴 수 있습니다.
		displayErrorMessages(errorMessages);
		return false; // 폼 제출을 막음
	}
	var result = -1;
	$.ajax({
		type : "POST",
		url : "SignIn", // 서블릿 경로
		data : JSON.stringify(data), // JSON 형식으로 데이터 전송
		contentType : "application/json",
		async : false,
		success : function(response) {
			// 서버로부터의 응답 처리
			result = response.result;
			//alert("result=" + result);
		}
	});

	if (result == 0) {
		alert("로그인 성공");

	} else if (result == 1) {
		alert("로그인 실패");
		return false;
	} else {
		alert("로그인 에러");
		return false;
	}
	// 로그인
	return true; // 유효성 검사 통과
}