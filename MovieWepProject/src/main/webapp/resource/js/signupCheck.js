function checkSignUpData() {
	var form = document.getElementById('signupForm');

	var userName = form.userName.value;
	var userId = form.userId.value;
	var userPw = form.userPw.value;
	var checkPassword = form.checkPassword.value;
	var userEmail_1 = form.userEmail_1.value;
	var userEmail_2 = form.userEmail_2.value;
	var birthDay = form.birthDay.value;
	var Genre_1 = form.Genre_1.value;
	var Genre_2 = form.Genre_2.value;
	var Genre_3 = form.Genre_3.value;
	var Genre_4 = form.Genre_4.value;

	var errorMessages = "";
	
	
	//이름 길이 검사
	if (userName.length < 2 || userName.length > 10) {
		errorMessages = errorMessages + "\n" + "이름은 2글자 이상 10글자 이하여야 합니다.";
	}
	//이름 유효성 검사
	if (!isValidName(userName)) {
		errorMessages = errorMessages + "\n" + "이름은 특수문자가 포함될 수 없습니다.";
	}
	
	//아이디 길이 검사
	if (userId.length < 2 || userId.length > 20) {
		errorMessages = errorMessages + "\n" + "아이디는 2글자 이상 20글자 이하여야 합니다.";
	}
	//아이디 유효성 검사
	if (!isValidIdPw(userId)) {
		errorMessages = errorMessages + "\n" + "아이디는 특수문자가 포함될 수 없습니다.";
	}
	
	//패스워드 길이 검사
	if (userPw.length < 2 || userPw.length > 20) {
		errorMessages = errorMessages + "\n" + "패스워드는 2글자 이상 20글자 이하여야 합니다.";
	}
	//패스워드 유효성 검사
	if (!isValidIdPw(userPw)) {
		errorMessages = errorMessages + "\n" + "패스워드는 특수문자가 포함될 수 없습니다.";
	}
	//패스워드 일치 확인
	if(!(userPw===checkPassword)){
		errorMessages = errorMessages + "\n" + "패스워드가 일치하지 않습니다.";
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

	//DB등록
	return true; // 유효성 검사 통과
}

function isValidEmail(userEmail_1, userEmail_2) {
	var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	return emailPattern.test(userEmail_1 + "@" + userEmail_2);
}

function isValidBirthDay(birthDay) {
	var today = new Date();
	var inputDate = new Date(birthDay);
	return inputDate < today; // 생년월일이 오늘 이후인지 확인
}

function isValidName(inputString) {
	var regex = /^[a-zA-Z0-9가-힣]*$/; // 한글, 영문, 숫자만 허용
	return regex.test(inputString);
}

function isValidIdPw(inputString) {
	var regex = /^[a-zA-Z0-9]*$/; // 영문, 숫자만 허용
	return regex.test(inputString);
}

function displayErrorMessages(messages) {
	alert(messages);
}
