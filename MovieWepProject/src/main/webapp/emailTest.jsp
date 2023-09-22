<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일 입력</title>
</head>
<body>
    <h1>이메일 입력</h1>
		<datalist id="emailDomain">
            <option value="gmail.com">gmail.com</option>
            <option value="yahoo.com">yahoo.com</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="custom">직접 입력</option>
        </datalist>
    <form action="processEmail.jsp" method="post">
        <!-- 이메일 주소의 앞부분 입력 -->
        <input type="text" name="emailPrefix" placeholder="이메일 주소 앞부분" required>
        
        <!-- "@" 텍스트 -->
        @
        
        <!-- 이메일 주소의 뒷부분 선택 리스트 또는 직접 입력 -->
        
        
        <!-- 직접 입력하는 경우의 입력 폼 -->
        <input
					type="text" id="Genre_1" name="Genre_1" list="emailDomain"
					placeholder="선로 장르 선택" style="width: 49%">
        
        <!-- 제출 버튼 -->

        <input type="submit" value="제출">
    </form>
    
    <script>
        // 도메인 선택 리스트의 값에 따라 직접 입력 폼을 표시/숨김
        document.querySelector('select[name="emailDomain"]').addEventListener('change', function() {
            if (this.value === 'custom') {
                document.querySelector('input[name="customDomain"]').style.display = 'block';
            } else {
                document.querySelector('input[name="customDomain"]').style.display = 'none';
            }
        });
    </script>
</body>
</html>
