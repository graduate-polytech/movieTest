<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
.sub-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.sub-div {
	display: inline-block;
	padding: 10px;
	position: relative; /* 부모 요소를 relative로 설정 */
}

.sub-div img {
	max-width: 100%;
	max-height: 100%;
	height: auto;
	width: auto;
	position: absolute; /* 이미지 요소를 absolute로 설정 */
}


body, html {
	height: 100%;
	margin: 0;
}

#container {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<div id="container">
		<div class="sub-container">
			<div class="sub-div">
				<img src="your_image_url_1.jpg" alt="Image 1">
			</div>
			<div class="sub-div">
				<img src="your_image_url_2.jpg" alt="Image 2">
			</div>
			<!-- 추가하려는 하위 div 계속 추가 -->
		</div>
	</div>
</body>
</html>
