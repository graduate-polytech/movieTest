<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>�̸��� �Է�</title>
</head>
<body>
    <h1>�̸��� �Է�</h1>
		<datalist id="emailDomain">
            <option value="gmail.com">gmail.com</option>
            <option value="yahoo.com">yahoo.com</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="custom">���� �Է�</option>
        </datalist>
    <form action="processEmail.jsp" method="post">
        <!-- �̸��� �ּ��� �պκ� �Է� -->
        <input type="text" name="emailPrefix" placeholder="�̸��� �ּ� �պκ�" required>
        
        <!-- "@" �ؽ�Ʈ -->
        @
        
        <!-- �̸��� �ּ��� �޺κ� ���� ����Ʈ �Ǵ� ���� �Է� -->
        
        
        <!-- ���� �Է��ϴ� ����� �Է� �� -->
        <input
					type="text" id="Genre_1" name="Genre_1" list="emailDomain"
					placeholder="���� �帣 ����" style="width: 49%">
        
        <!-- ���� ��ư -->

        <input type="submit" value="����">
    </form>
    
    <script>
        // ������ ���� ����Ʈ�� ���� ���� ���� �Է� ���� ǥ��/����
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
