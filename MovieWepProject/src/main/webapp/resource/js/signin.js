function displayErrorMessages(messages) {
	alert(messages);
//	DBConTest();
}

function trySignIn() {
	alert("로그인 시도");
	var form = document.getElementById('signinForm');

	var userId = form.userId.value;
	var userPw = form.userPw.value;
	
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