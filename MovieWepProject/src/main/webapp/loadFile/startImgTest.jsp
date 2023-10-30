<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.Data.*"%>
<%@ page import="DB.DAO.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5 JavaScript 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<title>Insert title here</title>
<%
request.setCharacterEncoding("UTF-8");

Object useridobj = session.getAttribute("userId");
//System.out.println(useridobj.toString());
String session_userid = useridobj == null ? "" : (String) useridobj;

String param_type = request.getParameter("param_type"); // 영화리뷰 - 본인리뷰 구분 "movie":"my"

String param_docid = request.getParameter("param_docid");
param_docid = param_docid==null?"":param_docid;

String param_title = request.getParameter("param_title");
param_title = param_title==null?"":param_title;

%>
</head>
<body>
	<!-- 모달 창 정의 -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
		aria-hidden="false"
	>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">데이터 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="font-size: 8px;">
					<!-- "no", "DOCID", "title", "userid", "score", "review", "registration_date" -->
					<!-- 모달 내부에 수정할 데이터를 표시하고 입력 상자를 추가합니다 -->
					<div class="input-group mb-3">
						<span class="input-group-text my-span">리뷰 번호</span>
						<input type="text" id="no" class="form-control" disabled="disabled">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">영화 코드</span>
						<input type="text" id="DOCID" class="form-control" disabled="disabled">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">영화 제목</span>
						<textarea id="reviewtitle" name="registration_date" class="form-control"
							aria-label="With textarea" disabled="disabled"
						></textarea>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">작성자</span>
						<input type="text" id="userid" class="form-control" disabled="disabled">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">평점</span>
						<input type="number" min="0" max="10" id="score" class="form-control">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">리뷰</span>
						<textarea id="review" name="registration_date" class="form-control"
							aria-label="With textarea"
						></textarea>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text my-span">작성일자</span>
						<input type="text" id="registration_date" class="form-control">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger deletebtn" data-bs-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-primary save-button">저장</button>
				</div>
			</div>
		</div>
	</div>
	<%
	DAO_ReviewDB reviewName = new DAO_ReviewDB();
	ArrayList<Data_Review> reviewList = reviewName.getReviewList(param_type, session_userid, param_docid);
	System.out.println("getReviewList : " + param_type + " : " + session_userid + " : " + param_docid);
	if (reviewList.size() > 0) {
		for (Data_Review getData : reviewList) {

			String title = "";
			if (param_type.equals("movie")) {
		title = getData.getUserid();
			} else {
		title = getData.getTitle();
			}

			int no = getData.getNo();
			String DOCID = getData.getDOCID();
			String DBTitle = getData.getTitle();
			String DBUserid = getData.getUserid();

			int score = getData.getScore();
			Date date = getData.getDate();
			String review = getData.getUserid();
		%>
		<div class="showListDiv">
			<jsp:include page="reviewBox_final.jsp">
				<jsp:param name="param_no" value="<%=getData.getNo()%>" />
				<jsp:param name="param_docid" value="<%=getData.getDOCID()%>" />
				<jsp:param name="param_title" value="<%=getData.getTitle()%>" />
				<jsp:param name="param_userid" value="<%=getData.getUserid()%>" />
				<jsp:param name="param_score" value="<%=getData.getScore()%>" />
				<jsp:param name="param_review" value="<%=getData.getReview()%>" />
				<jsp:param name="param_date" value="<%=getData.getDate()%>" />
			</jsp:include>
		</div>
		<%
		}
	} else{
		%>
		
		
		<%
	}
	%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					// 페이지가 로드될 때 실행할 코드
					var start_img_divs = $('.review_score_img');
					var modal = $('#myModal');
					start_img_divs
							.each(function() {
								//review_score_int

								var start_img_color = $(this).find(
										'.start_img_color');
								var review_score_int = $(this).find(
										'.review_score_int');

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
					var reviewDivBoxs = $(this).find('.reviewDivBox');

					reviewDivBoxs.each(function() {//각 리뷰박스 마다
						var reviewModalBtn = $(this).find('.review_editBtn');//모달버튼

						reviewModalBtn.on("click",
								function() {
									console.log($(this));

									modal.find('#no').val($(this).data("no"));
									modal.find('#DOCID').val(
											$(this).data("docid"));
									modal.find('#reviewtitle').val(
											$(this).data("dbtitle"));
									modal.find('#userid').val(
											$(this).data("dbuserid"));
									modal.find('#score').val(
											$(this).data("score"));
									;
									modal.find('#review').val(
											$(this).data("review"));
									modal.find('#registration_date').val(
											$(this).data("date"));
									modal.modal('show');
								});
					});

				});
		//alert(clip);
	</script>
</body>
</html>