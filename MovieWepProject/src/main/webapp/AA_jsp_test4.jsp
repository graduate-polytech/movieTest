<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>테이블 데이터 검색</title>
</head>
<body>
    <input type="text" id="searchInput" placeholder="검색어를 입력하세요" oninput="searchTable()">
    <button onclick="searchTable()">검색</button>
    
    <table id="myTable">
        <thead>
            <tr>
                <th>이름</th>
                <th>나이</th>
                <th>도시</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>John</td>
                <td>30</td>
                <td>New York</td>
            </tr>
            <tr>
                <td>Alice</td>
                <td>25</td>
                <td>Los Angeles</td>
            </tr>
            <tr>
                <td>Bob</td>
                <td>35</td>
                <td>Chicago</td>
            </tr>
            <!-- 나머지 행 추가 -->
        </tbody>
    </table>

    <script>
        function searchTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().includes(filter)) {
                        tr[i].style.display = "";
                        break;
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>
</html>

