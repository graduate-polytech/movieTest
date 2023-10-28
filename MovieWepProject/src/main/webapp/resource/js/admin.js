function admin_F(data) {
	
	var data_1 = document.getElementById('data_1').value;
	
	var errorMessages = "";
	var data = {
		"type" : data_1
	};
	
	var result = -1;
	$.ajax({
		type : "POST",
		url : "adminServlet", // 서블릿 경로
		data : JSON.stringify(data), // JSON 형식으로 데이터 전송
		contentType : "application/json",
		async : false,
		success : function(response) {
			// 서버로부터의 응답 처리
			result = response.result;

			// alert(response.message + ":" + (result == 1)); // 서버의 응답 메시지 출력
		}
	});

	alert("js파일 함수 실행	");
	
	//return true; // 유효성 검사 통과
}
