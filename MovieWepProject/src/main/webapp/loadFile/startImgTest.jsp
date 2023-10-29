<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8	">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5 JavaScript 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>

<title>Insert title here</title>

<%
String type = request.getParameter("type");	// 영화리뷰 - 본인리뷰 구분 "movie":"my"
String data = request.getParameter("data");	// DB검색 데이터	docid : userid

%>

</head>
<body>
	<div class="showListDiv">
		<%
		for(int i = 0; i < 10; i++) {
		%>
		<div class="reviewDivBox">
			<div class="review_Top">
				<p><%=type %></p>
				<jsp:include page="ShowStarImg.jsp">
					<jsp:param name="score" value="<%=i%>" />
				</jsp:include>
				<button type="button" class="btn btn-primary review_editBtn" data-message="수정">수정</button>
			</div>
			<p class="review_Text">
				<%=data %>
			</p>
		</div>
		<%
		}
		%>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					// 페이지가 로드될 때 실행할 코드
					var start_img_divs = $('.review_score_img');

					start_img_divs
							.each(function() {
								//review_score_int

								var start_img_color = $(this).find('.start_img_color');
								var review_score_int = $(this).find('.review_score_int');

								//alert("실행");
								var width = start_img_color.css('width').split(
										"p")[0];
								var height = start_img_color.css('height')
										.split("p")[0];
								var score = start_img_color.data('score');

								var top = start_img_color.css("position");
								var right = start_img_color.css("right");

								var scorewidth = score * (width / 10);

								var clipText = "rect(0px, " + scorewidth
										+ "px, " + height + "px, 0px)";
								start_img_color.css('clip', clipText);
							});

				});
		//alert(clip);
	</script>
</body>
</html>