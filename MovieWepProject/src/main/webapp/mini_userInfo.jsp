<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!--
<style>
    .btn {
    	width: 120PX;
      	border: 2px solid #000; /* 외각선 스타일 및 색상 설정 */
        padding: 10px; /* 컨테이너 내부 여백 설정 */
    }

</style>
-->

    	<P><button id="login-btn" type="button" class="btn btn-primary">로그인</button> </P>
    
     <P><button id="signup-btn" type="button" class="btn btn-outline-primary">회원가입</button> </P>
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
   