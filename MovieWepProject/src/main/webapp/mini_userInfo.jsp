<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
    .btn {
    	width: 120PX;
      	border: 2px solid #000; /* 외각선 스타일 및 색상 설정 */
        padding: 10px; /* 컨테이너 내부 여백 설정 */
    }
    .box-container {
	    position: fixed; /* 고정 위치 지정 */
	    top: 0; /* 화면 상단에 배치 */
	    right: 0; /* 화면 오른쪽에 배치 */
    	width: 200PX;
    	height: 500PX;
      	border: 2px solid #000; /* 외각선 스타일 및 색상 설정 */
        padding: 10px; /* 컨테이너 내부 여백 설정 */
        text-align: center;
    	position: relative;
    }
</style>
<div class="box-container">

    <P><button type="button" class="btn btn-primary">로그인</button> </P>
    
     <P><button type="button" class="btn btn-outline-primary">회원가입</button> </P>
   
</div>