<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>테이블 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <table class="table">
        <thead>
            <tr>
                <th>열 1</th>
                <th>열 2</th>
                <th>열 3</th>
                <th>열 4</th>
                <th>열 5</th>
            </tr>
        </thead>
        <tbody>
            <!-- 테이블 데이터를 동적으로 생성 -->
            <tr>
                <td>데이터 1-1</td>
                <td>데이터 1-2</td>
                <td>데이터 1-3</td>
                <td>데이터 1-4</td>
                <td>
                    <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#myModal">
                        수정
                    </button>
                </td>
            </tr>
            <tr>
                <td>데이터 2-1</td>
                <td>데이터 2-2</td>
                <td>데이터 2-3</td>
                <td>데이터 2-4</td>
                <td>
                    <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#myModal">
                        수정
                    </button>
                </td>
            </tr>
            <tr>
                <td>데이터 3-1</td>
                <td>데이터 3-2</td>
                <td>데이터 3-3</td>
                <td>데이터 3-4</td>
                <td>
                    <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#myModal">
                        수정
                    </button>
                </td>
            </tr>
            <tr>
                <td>데이터 4-1</td>
                <td>데이터 4-2</td>
                <td>데이터 4-3</td>
                <td>데이터 4-4</td>
                <td>
                    <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#myModal">
                        수정
                    </button>
                </td>
            </tr>
            <tr>
                <td>데이터 5-1</td>
                <td>데이터 5-2</td>
                <td>데이터 5-3</td>
                <td>데이터 5-4</td>
                <td>
                    <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#myModal">
                        수정
                    </button>
                </td>
            </tr>
        </tbody>
    </table>

    <!-- 모달 창 정의 -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">모달 제목</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary save-button">저장</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        var editedRow = null; // 수정 중인 행을 저장하기 위한 변수

        // '수정' 버튼을 클릭할 때 모달 내 데이터를 설정하는 JavaScript 코드를 추가합니다.
        $('.edit-button').click(function() {
            var button = $(this); // 클릭된 버튼
            var rowData = button.closest('tr').find('td'); // 동일한 행의 데이터를 가져옵니다.

            var modal = $('#myModal'); // 모달 대화 상자 요소를 가져옵니다.

            // 모달 내의 입력 상자에 데이터를 설정합니다.
            modal.find('#data_1').val(rowData.eq(0).text());
            modal.find('#data_2').val(rowData.eq(1).text());
            modal.find('#data_3').val(rowData.eq(2).text());
            modal.find('#data_4').val(rowData.eq(3).text());
            //modal.find('#data_5').val(rowData.eq(4).text());

            editedRow = button.closest('tr'); // 수정 중인 행을 저장합니다.
            modal.modal('show'); // 모달 창을 표시합니다.
        });

        // 모달 내의 '저장' 버튼을 클릭할 때 수정된 데이터를 테이블에 적용하는 코드를 추가합니다.
        $('.save-button').click(function() {
            var modal = $('#myModal');
            var data_1 = modal.find('#data_1').val();
            var data_2 = modal.find('#data_2').val();
            var data_3 = modal.find('#data_3').val();
            var data_4 = modal.find('#data_4').val();
            //var data_5 = modal.find('#data_5').val();

            // 수정된 데이터를 해당 행에 덮어씌웁니다.
            editedRow.find('td').eq(0).text(data_1);
            editedRow.find('td').eq(1).text(data_2);
            editedRow.find('td').eq(2).text(data_3);
            editedRow.find('td').eq(3).text(data_4);
            //editedRow.find('td').eq(4).text(data_5);

            modal.modal('hide');
        });

        $('#myModal').on('hidden.bs.modal', function() {
            $(this).find('.inputTextData').val(''); // 입력 상자를 비우기
        });
    });


    </script>
</body>
</html>

