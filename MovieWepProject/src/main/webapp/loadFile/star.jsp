<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#star_color {
	clip: rect(0, 0, 0, 0);
}

.star_score {
	position: absolute;
	left: 0px;
	top: 0px;
}

#rangeInput {
	opacity: 0;
}
</style>
</head>
<body>

	<%
	String score = request.getParameter("score");
	System.out.println(score);
	%>
	<!-- range input 요소 추가 -->
	<!-- 이미지 요소 -->
	<div>
		<img id="star_gray" class="star_score" src="..\resource\images\star_gray.png" alt="이미지">
		<img id="star_color" class="star_score" src="..\resource\images\star_color.png" alt="이미지">
		<input type="range" id="rangeInput" class="star_score" min="0" max="10" value="<%=score %>" step="1">
	</div>
	<output id="scoreSpan"></output>
	<script>
		// range input 요소와 이미지 요소 가져오기
		// star_gray 이미지 요소와 rangeInput 요소 가져오기
			window.onload = function(){
				setScore();
    }
		var starGray = document.getElementById("star_gray");

		var rangeInput = document.getElementById("rangeInput");
		// star_gray 이미지의 폭을 가져와서 rangeInput의 폭으로 설정
		
		var starGrayWidth = starGray.clientWidth; // 이미지의 폭을 가져옴
		rangeInput.style.width = starGrayWidth + "px"; // rangeInput의 폭을 설정
		
		var starGrayHeight = starGray.clientHeight; // 이미지의 폭을 가져옴
		rangeInput.style.height = starGrayHeight + "px"; // rangeInput의 폭을 설정
		
		var image = document.getElementById("star_color");
		
		// range input 값이 변경될 때 이미지의 표시 범위 조절
		rangeInput.addEventListener("input", setScore);
		
		function setScore() {
			// 이미지 요소 가져오기
			var rangeValue = rangeInput.value;
			//alert("A. " + rangeValue);
			var result = calculateWidthFromPercentage(rangeValue);
			//alert("B. " + rangeValue);
			// 이미지의 clip 속성을 동적으로 설정
			var clipValue = "rect(0, " + result.width + ", " + result.height + ", 0)";
			
			//alert(clipValue);
			
			image.style.clip = clipValue;

			//document.getElementById("scoreSpan").value=rangeValue + "점";
		}
		
		function calculateWidthFromPercentage(value) {
			// 이미지 요소 가져오기
			var image = document.getElementById("star_color");
			
			// 이미지의 현재 너비(px) 가져오기
			var height = parseInt(getComputedStyle(image).height) + "px";
			var currentWidth = parseFloat(getComputedStyle(image).width);
			// 매개변수 값을 퍼센트로 변환하여 좌우 폭(px) 계산
			
			var max = rangeInput.max;
			//alert(max);
			var width = parseInt(currentWidth * (value / max)) + "px";

			//alert("높이:\t" + height + "\n폭:\t" + width);
			return {width, height};
		}

		
	</script>
</body>
</html>
