<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery 링크 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5 JavaScript 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<link rel="stylesheet" href="resource/css/styles1.css">
<script src="resource/js/admin.js"></script>
<!-- 기존 CSS 스타일 시트 링크 -->
<script type="text/javascript">
		
		var userId = '<%=session.getAttribute("userId")%>
	';
	if (userId != 'admin') {
		alert("잘못된 접근입니다.");
		location.href = "main.jsp";
	}
</script>
<style>
.table-container {
	width: 100%; /* 원하는 너비로 컨테이너 너비 설정 */
	height: 500px;
	overflow-y: auto;
	overflow-x: auto;
}

table {
	width: 100%; /* 테이블의 너비를 100%로 설정 */
	border-collapse: collapse; /* 셀 테두리를 겹치도록 설정 */
}

thead {
	background-color: #f5f5f5; /* 헤더의 배경색 설정 (원하는 색상으로 변경 가능) */
}

th {
	text-align: left; /* 필요에 따라 헤더 셀의 텍스트 정렬을 조정합니다 */
	padding: 10px; /* 필요한 경우 헤더 셀에 패딩 추가 */
}

tbody {
	background-color: #ffffff; /* 본문의 배경색 설정 (원하는 색상으로 변경 가능) */
}

td {
	text-align: left; /* 필요에 따라 데이터 셀의 텍스트 정렬을 조정합니다 */
	padding: 10px; /* 필요한 경우 데이터 셀에 패딩 추가 */
}

.body_main {
	display: flex;
	justify-content: center; /* 가로 중앙 정렬을 위한 스타일 */
	align-items: center; /* 세로 중앙 정렬을 위한 스타일 */
	width: 80%; /* 화면 가로 너비를 80%로 설정 */
	margin: 10px auto;
	flex-wrap: wrap;
}
</style>
</head>
<body>
	<!-- 모달 창 정의 -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
		aria-hidden="false"
	>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 모달 내부에 수정할 데이터를 표시하고 입력 상자를 추가합니다 -->
					<div class="form-group">
						<label for="data_1">데이터 수정:</label>
						<input type="text" class="form-control inputTextData" id="data_1">
					</div>
					<div class="form-group">
						<label for="data_2">데이터 수정:</label>
						<input type="text" class="form-control inputTextData" id="data_2">
					</div>
					<div class="form-group">
						<label for="data_3">데이터 수정:</label>
						<input type="text" class="form-control inputTextData" id="data_3">
					</div>
					<div class="form-group">
						<label for="data_4">데이터 수정:</label>
						<input type="text" class="form-control inputTextData" id="data_4">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary save-button" onclick="admin_F()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 로고 이미지 -->
	<header>
		<div id="top">
			<!-- 다운후 변경 -->
			<jsp:include page="loadFile/top.jsp" />
			<jsp:include page="loadFile/menuBar.jsp" />
		</div>
	</header>
	<div class="body_main">
		<div class="form-floating mb-3">
			<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" width="30">
			<label for="floatingInput">Email address</label>
		</div>
		<div class="table-container">
			<table id="userInfoTable" class="table table-responsive table-hover">
				<thead>
					<tr>
						<th class="">아이디</th>
						<th class="">비밀번호</th>
						<th class="">이름</th>
						<th class="">생년월일</th>
						<th class="">이메일</th>
						<th class="">거주지</th>
						<th class="">선호장르1</th>
						<th class="">선호장르2</th>
						<th class="">선호장르3</th>
						<th class="">선호장르4</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < 50; i++) {
					%>
					<tr>
						<%
						for (int j = 0; j < 10; j++) {
						%>
						<td><%=i%>행 값<%=j + 1%></td>
						<%
						}
						%>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>
	<script type="text/javascript">
	$(document).ready(function() {
	    var modal = $('#myModal');
	    var filterInput = $('#filterText'); // 검색어를 입력하는 입력 상자

	    // '수정' 버튼을 클릭할 때 모달 내 데이터를 설정하는 JavaScript 코드를 추가합니다.
	    $('.table tbody tr').click(function() {
	        var rowData = $(this).find('td');
	        modal.find('#data_1').val(rowData.eq(0).text());
	        modal.find('#data_2').val(rowData.eq(1).text());
	        modal.find('#data_3').val(rowData.eq(2).text());
	        modal.modal('show');
	    });

	    // 모달 내의 '저장' 버튼을 클릭할 때 수정된 데이터를 테이블에 적용하는 코드를 추가합니다.
	    $('.save-button').click(function() {
	        var data_1 = modal.find('#data_1').val();
	        var data_2 = modal.find('#data_2').val();
	        var data_3 = modal.find('#data_3').val();

	        var selectedRow = $('.table tr.active');
	        selectedRow.find('td').eq(0).text(data_1);
	        selectedRow.find('td').eq(1).text(data_2);
	        selectedRow.find('td').eq(2).text(data_3);

	        modal.modal('hide');
	    });

	    $('.closebtn').click(function() {
	        modal.modal('hide');
	    });

	    // 테이블 행 클릭 시 선택한 행에 'active' 클래스를 추가하여 하이라이트 효과를 줍니다.
	    $('.table tbody tr').click(function() {
	        $('.table tbody tr').removeClass('active');
	        $(this).addClass('active');
	    });

	    // 검색어 입력 상자의 내용이 변경될 때 테이블을 필터링합니다.
	    filterInput.on('input', function() {
	        var filterText = filterInput.val().toLowerCase();
	        $('.table tbody tr').each(function() {
	            var rowData = $(this).find('td').eq(0).text().toLowerCase(); // 첫 번째 열 값
	            if (rowData.indexOf(filterText) !== -1) {
	                $(this).show(); // 일치하는 경우 표시
	            } else {
	                $(this).hide(); // 일치하지 않는 경우 숨김
	            }
	        });
	    });

	    modal.on('hidden.bs.modal', function() {
	        $(this).find('.inputTextData').val(''); // 입력 상자를 비우기
	    });
	});
	</script>
</body>
</html>