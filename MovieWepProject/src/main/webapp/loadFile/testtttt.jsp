<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
</head>
<body>
    <h1>Main Page</h1>
    
    <!-- "dateInputForm.jsp" ������ ���� -->
    <jsp:include page="selectDate.jsp" />

    <script>
        var selectedDate; // ������ ��¥�� ������ JavaScript ����

        // "dateInputForm.jsp"���� ������ ��¥�� ������ JavaScript ������ �Ҵ�
        function setSelectedDate(date) {
            selectedDate = date;
            alert(selectedDate);
        }

        // ������ ��¥�� ����� ����
        function selectedDate() {
            if (selectedDate) {
                alert("������ ��¥: " + selectedDate);
                // ���⿡�� ������ ��¥�� ����Ͻ� �� �ֽ��ϴ�.
            } else {
                alert("��¥�� ���� �����ϼ���.");
            }
        }
    </script>
</body>
</html>
