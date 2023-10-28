<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10-Column Table</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 5 JavaScript 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<link rel="stylesheet" href="resource/css/styles1.css">
<style>
        .table-container {
        width: 80%; /* 원하는 너비로 컨테이너 너비 설정 */
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
    </style>
    
    <script type="text/javascript">
		
		var userId = '<%=session.getAttribute("userId")%>
	';
	if (userId != 'admin') {
		alert("잘못된 접근입니다.");
		location.href = "main.jsp";
	}
</script>
    
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
<div class="table-container">
		<table id="userInfoTable" class="table table-responsive table-hover">
			<thead>
				<tr>
					<%
					for (int i = 0; i < 10; i++) {
					%>
					<th class="">
						머리글<%=i + 1%></th>
					<%
					}
					%>
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
					<td><%=i %>행 값<%=j+1 %></td>
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

	<div class="table-container">
		<table id="userInfoTable" class="table table-responsive table-hover">
			<thead>
				<tr>
					<th>Column 1</th>
					<th>Column 2</th>
					<th>Column 3</th>
					<th>Column 4</th>
					<th>Column 5</th>
					<th>Column 6</th>
					<th>Column 7</th>
					<th>Column 8</th>
					<th>Column 9</th>
					<th>Column 10</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Data 1</td>
					<td>Data 2</td>
					<td>Data 3</td>
					<td>Data 4</td>
					<td>Data 5</td>
					<td>Data 6</td>
					<td>Data 7</td>
					<td>Data 8</td>
					<td>Data 9</td>
					<td>Data 10</td>
				</tr>
				<!-- Add more rows with data as needed -->
			</tbody>
		</table>
	</div>
</body>
</html>
