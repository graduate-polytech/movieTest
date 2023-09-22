<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boxOffice.*, java.util.List, java.util.ArrayList, java.time.LocalDate, java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

    <title>날짜 선택 및 변환</title>
    <style>
        .even {
            background-color: #f2f2f2;
        }
        .even {
            background-color: #f2f2f2;
        }
        .DateCon {
            text-align: center;
            margin-top: 50px;
        }
        .table-container {
            display: flex;
            flex-direction: column;
            max-width: 80%; /* 테이블 너비를 80%로 변경 */
            margin: 20px auto; /* 테이블 위 아래 여백 조정 */
        }
        
        .table-container table td:nth-child(2) {
            white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
            overflow: hidden;
            text-overflow: ellipsis; /* 텍스트가 너무 길 경우 생략 (...) 표시 */
            max-width: 200px; /* 최대 너비 설정, 필요에 따라 조절하세요 */
        }
        .table-container table tr:nth-child(odd) {
            background-color: #f2f2f2;
        }
        .table-container table tr:first-child {
            border-top: 2px solid #000; /* 상단 가장자리 선 두꺼운 선 스타일 설정 */
            border-bottom: 2px solid #000; /* 하단 가장자리 선 두꺼운 선 스타일 설정 */
            background-color: #55D0FF ;
        }
        .date-header {
            text-align: left;
            font-size: 20px;
            color: #D92332 ;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/styles1.css">
    <div id="top">
        <!-- 다운후 변경 -->
        <jsp:include page="loadFile/top.jsp" /> 
        <jsp:include page="loadFile/menuBar.jsp" />
    </div>
</head>
<body>
    <div class="DateCon">
        <form>
            <label for="startDate"></label>
            <input type="date" id="startDate" name="startDate">
            <label for="endDate"></label>
            <input type="date" id="endDate" name="endDate">
            <input type="submit" value="조회" onclick="validateDateRange()">
        </form>
        <%
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");
        
        if (startDateParam != null && !startDateParam.trim().isEmpty() &&
            endDateParam != null && !endDateParam.trim().isEmpty()) {
            LocalDate startDate = LocalDate.parse(startDateParam);
            LocalDate endDate = LocalDate.parse(endDateParam);

            if (startDate.isBefore(endDate) || startDate.isEqual(endDate)) {
                // Iterate through the date range and fetch data for each date
                LocalDate currentDate = startDate;
                while (!currentDate.isAfter(endDate)) {
                    String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
                    String formattedDateDisplay = currentDate.format(DateTimeFormatter.ofPattern("yyyy년 M월 d일"));
                    List<datamovie> dataForDate = Dayboxoffice.fetchDataByDate(formattedDate);
        %>
        <div class="table-container">
            <div class="date-header"><%= formattedDateDisplay %></div>
            <table class="sortable-table" border="1">
                <tr>
                    <th scope="col">
                    순위
                    <span class="btn_updwBox">
                        <button name="btn4_up" type="button" class="btn_up01">
                            <span>정렬</span>
                        </button>
                    </span>
                    </th>
                    <th>영화명</th>
                    <th>개봉일</th>
                    <th>매출액</th>
                    <th>전일 대비 매출액 증감</th>
                    <th>매출액 점유율</th>
                    <th>관객 수</th>
                    <th>전일 대비 관객 수</th>
                    <th>누적 매출액</th>
                    <th>누적 관객수</th>
                    <th>스크린수</th>
                    <th>상영횟수</th>
                </tr>
                <%
                    for (datamovie cinema : dataForDate) {
                %>
                <tr>
                    <td><%= cinema.getRank() %></td>
                    <td><%= cinema.getMovieNm() %></td>
                    <td><%= cinema.getOpenDt() %></td>
                    <td class="salesAmt"><%= cinema.getSalesAmt() %></td>
                    <td class="salesInten"><%= cinema.getSalesInten() %></td>
                    <td><%= cinema.getSalesShare() %></td>
                    <td><%= cinema.getAudiCnt() %></td>
                    <td><%= cinema.getAudiInten() %></td>
                    <td class="salesAcc"><%= cinema.getSalesAcc() %></td>
                    <td class="audiAcc"><%= cinema.getAudiAcc() %></td>
                    <td><%= cinema.getScrnCnt() %></td>
                    <td><%= cinema.getShowCnt() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%
                    currentDate = currentDate.plusDays(1); // Move to the next date
                }
            } 
        } 
        %>
    </div>
    <script>
    
        // 초기 정렬 상태
        var ascending = true;
    
        // 정렬 버튼에 대한 이벤트 리스너 설정
        var upButtons = document.querySelectorAll('.btn_up01');
    
        upButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                processTable(button.closest('table'), ascending);
                ascending = !ascending; // 정렬 상태 변경
            });
        });
    
        // 테이블을 정렬 및 천 단위 쉼표 추가하는 함수
        function processTable(table, ascending) {
            var rows = Array.from(table.querySelectorAll('tbody tr'));
    
            // 정렬 기준 열 선택 (예: 순위 열)
            var columnIndex = 0; // 순위 열에 해당하는 열 번호
            var sortByColumn = (a, b) => {
                var aValue = parseInt(a.children[columnIndex].innerText);
                var bValue = parseInt(b.children[columnIndex].innerText);
                return ascending ? aValue - bValue : bValue - aValue;
            };
    
            // 테이블 정렬
            rows.sort(sortByColumn);
            rows.forEach((row) => table.querySelector('tbody').appendChild(row));
    
            // 천 단위 쉼표 추가 함수
            function addCommasToData(dataElements) {
                dataElements.forEach(function (element) {
                    var dataValue = parseInt(element.innerText);
                    element.innerText = dataValue.toLocaleString();
                });
            }
    
            // 정렬 버튼 클릭 이벤트 설정
            var sortButtons = table.querySelectorAll('.btn_updwBox button');
            sortButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    ascending = !ascending; // 정렬 상태 변경
                    processTable(table, ascending);
                });
            });
    
            // 천 단위 쉼표를 추가할 열 선택 및 처리
            var columnsToAddCommas = table.querySelectorAll('.salesAmt, .salesInten, .salesAcc, .audiAcc');
            addCommasToData(columnsToAddCommas);
        }
    
        // 초기 페이지 로드 시 모든 테이블에 대해 정렬 함수 호출
        var sortableTables = document.querySelectorAll('.sortable-table');
        sortableTables.forEach(function (table) {
            processTable(table, true); // 초기에 오름차순 정렬
        });
    
        function validateDateRange() {
            var startDate = new Date(document.getElementById('startDate').value);
            var endDate = new Date(document.getElementById('endDate').value);
            var oneWeek = 7 * 24 * 60 * 60 * 1000; // 1주일을 밀리초로 표현
    
            var timeDifference = endDate - startDate;
    
            if (timeDifference > oneWeek) {
                alert('날짜 범위가 1주일을 넘을 수 없습니다.');
                event.preventDefault(); // 폼 제출을 막습니다.
            }
        }
        
     

    </script>
    <footer>
        <div id="bottom">
            <jsp:include page="loadFile/bottom.jsp" />
        </div>
    </footer>
</body>
</html>

