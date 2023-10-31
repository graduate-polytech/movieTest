<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>날짜 입력 폼</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="input-group">
        <select class="form-control" id="year" name="year">
            <% for (int i = 1900; i <= 2023; i++) { %>
                <option value="<%=i%>"><%=i%>년</option>
            <% } %>
        </select>
        <select class="form-control" id="month" name="month">
            <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%=i%>"><%=i%>월</option>
            <% } %>
        </select>
        <select class="form-control" id="day" name="day">
           <option value="1">1일</option>
        </select>
    </div>
    
    <button type="button" id="submitBtn" class="btn btn-primary">확인</button>
    
    <script>
    
        var yearDropdown = document.getElementById("year");
        var monthDropdown = document.getElementById("month");
        var dayDropdown = document.getElementById("day");

        monthDropdown.addEventListener("change", function() {
        	setDayList();
        });
		
        function setDayList(){
        	var selectedYear = yearDropdown.value;
            var selectedMonth = monthDropdown.value;
            var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();

            dayDropdown.innerHTML = "";
            for (var day = 1; day <= daysInMonth; day++) {
                var option = document.createElement("option");
                option.value = day;
                option.text = day + "일";
                dayDropdown.appendChild(option);
            }
        }
        setDayList();
        // 날짜 선택 버튼 클릭 시, 선택한 날짜를 JavaScript 함수로 전달
        document.getElementById("submitBtn").addEventListener("click", function() {
            var selectedYear = yearDropdown.value;
            var selectedMonth = monthDropdown.value;
            var selectedDay = dayDropdown.value;
            var selectedDate = selectedYear + "-" + selectedMonth + "-" + selectedDay;
            
            // 선택한 날짜를 JavaScript 함수로 전달
           
        });
        
        
        
    </script>
</body>
</html>

