<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%
request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<title>이미지 표시 범위 조절</title>

</head>
<body>
	<div style="position: relative;">
		<%
		String sessionId = "";
		String userid = "";
		for (int i = 0; i < 5; i++) {
		%><div class="reviews">
			<jsp:include page="loadFile/reviewBox.jsp">
				<jsp:param name="sessionId" value="sessionId" />
				<jsp:param name="no" value="<%=i%>" />
				<jsp:param name="director" value="director" />
				<jsp:param name="title" value="title" />
				<jsp:param name="userid" value="userid" />
				<jsp:param name="score" value="<%=i*2%>" />
				<jsp:param name="review" value="review>" />
				<jsp:param name="date" value="date" />
			</jsp:include>
			</div>
		<%
		}
		%>
	</div>
	<script>

		var rangeInputs = document.querySelectorAll(".review_star_score.review_rangeInput");

	    rangeInputs.forEach(function(input) {
	    	scoreSetting(input);
	    	<%if (sessionId != null && !sessionId.equals("null") && !sessionId.trim().equals("") && !sessionId.isEmpty() && sessionId.equals(userid)) {%>
	    	//alert(input.id + " : 활성화");
	    	document.getElementById(input.id).disabled = false;
			<%} else {%>
			//alert(input.id + " : 비활성화");
			document.getElementById(input.id).disabled = false;
			<%}%>
	        input.addEventListener("input", setStar)
		});
	    
		function setStar(){
			var rangeValue = document.getElementById(event.target.id).value;

			var image = document.getElementById(event.target.name);
			var result = calculateWidthFromPercentage(rangeValue,image);

			var clipValue = "rect(0, " + result.width + ", " + result.height + ", 0)";
			
			image.style.clip = clipValue;
		}
		function scoreSetting(element){
	    	var rangeValue = document.getElementById(element.id).value;
			var image = document.getElementById(element.name);
			var result = calculateWidthFromPercentage(rangeValue,image);
			var clipValue = "rect(0, " + result.width + ", " + result.height + ", 0)";
			
			image.style.clip = clipValue;
		}
		
		function calculateWidthFromPercentage(value,img) {
			
			var height = parseInt(getComputedStyle(img).height) + "px";
			var currentWidth = parseFloat(getComputedStyle(img).width);

			var width = parseInt(currentWidth * (value / 10)) + "px";

			return {width, height};
		}
		window.onload = function(){
			//setStar();
		}

	</script>
</body>
</html>
