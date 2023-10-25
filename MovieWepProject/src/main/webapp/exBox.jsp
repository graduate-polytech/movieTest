<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
    import="boxOffice.*, Office.*, java.util.List, java.util.ArrayList, java.time.LocalDate, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<!-- 데이터 새로 들고오면 그래프 다시 만드는 거 추가 -->
<html>
<head>
    <title>Box Office Data</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .poster-container {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Box Office Data</h1>
    <label for="targetDate">날짜 선택 (YYYYMMDD):</label>
    <input type="date" id="targetDate" name="targetDate">
    <button id="getDataBtn">데이터 가져오기</button>
    <div>
        <div>
            <div class="poster-container">
                <img id="posterImage" style="display: none; max-width: 100%;" />
            </div>
            <div>
                <div>
                    <h2 id="movieName" style="display: none;"></h2>
                </div>
                <div id="directorDiv" style="display: none;">
                    <p>
                        감독:
                        <span id="director"></span>
                    </p>
                    <p>
                        개봉일:
                        <span id="openDate"></span>
                    </p>
                    <p>
                        관람등급:
                        <span id="watchGrade"></span>
                    </p>
                    <p>
                        상영시간:
                        <span id="showTm"></span>
                    </p>
                    <p>
                        제작국가:
                        <span id="nation"></span>
                    </p>
                    <p>
                        제작상태:
                        <span id="productionStatus"></span>
                    </p>
                </div>
            </div>
        </div>
        <div id="movieData" style="display: none;">
            <table>
                <thead>
                    <tr>
                        <th>랭킹</th>
                        <th>랭킹 증감분</th>
                        <th>영화 제목</th>
                        <th>관객수</th>
                        <th>매출액</th>
                    </tr>
                </thead>
                <tbody id="movieDataBody">
                </tbody>
            </table>
        </div>
    </div>
    <div>
        <div>
            <canvas id="salesChart" width="400" height="200"></canvas>
        </div>
        <div>
            <canvas id="salesShareChart" width="400" height="200"></canvas>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var salesChart; // 막대 그래프 인스턴스를 저장할 변수
            var salesShareChart; // 원 그래프 인스턴스를 저장할 변수

            $('#getDataBtn').click(function () {
                var targetDate = $('#targetDate').val().replace(/-/g, ''); // "-" 문자 제거
                if (targetDate) {
                    $.ajax({
                        url: 'movieDataServlet?targetDate=' + targetDate,
                        method: 'GET',
                        dataType: 'json',
                        async: false,
                        success: function (data) {
                            console.log(data);
                            displayMovieData(data);
                            $('#movieData').show();
                        },
                        error: function () {
                            alert('데이터를 가져오는 중에 오류가 발생했습니다.');
                        }
                    });
                } else {
                    alert('날짜를 입력해 주세요.');
                }
            });

            // 클릭한 영화의 포스터와 정보를 보여주는 함수
            $('#movieDataBody').on('click', 'tr', function () {
                var posterUrl = $(this).data('poster');
                var movieName = $(this).data('name');
                var director = $(this).data('director');
                var openDate = $(this).data('opendate');
                var watchGrade = $(this).data('watchgrade');
                var showTm = $(this).data('showtm');
                var nation = $(this).data('nation');
                var productionStatus = $(this).data('productionstatus');

                $('#posterImage').attr('src', posterUrl);
                $('#posterImage').show();
                $('#movieName').text(movieName).show();
                $('#director').text(director);
                $('#openDate').text(openDate);
                $('#watchGrade').text(watchGrade);
                $('#showTm').text(showTm);
                $('#nation').text(nation);
                $('#productionStatus').text(productionStatus);

                // 추가 정보를 나타내는 div를 보이도록 설정
                $('#directorDiv').show();
            });

            function displayMovieData(data) {
                var tableBody = $('#movieDataBody');
                tableBody.empty();
                var salesData = [];
                var labels = [];
                var salesShare = [];
                for (var i = 0; i < data.length; i++) {
                    var movie = data[i];
                    var row = '<tr data-poster="' + movie.posterUrl +
                        '" data-name="' + movie.movieNm +
                        '" data-director="' + movie.directors.join(', ') +
                        '" data-opendate="' + movie.openDt +
                        '" data-watchgrade="' + movie.watchGradeNm +
                        '" data-showtm="' + movie.showTm +
                        '" data-nation="' + movie.nationNm +
                        '" data-productionstatus="' + movie.prdtStatNm +
                        '">' +
                        '<td>' + movie.rank + '</td>' +
                        '<td>' + movie.rankInten + '</td>' +
                        '<td>' + movie.movieNm + '</td>' +
                        '<td>' + movie.audiCnt + '</td>' +
                        '<td>' + movie.salesAmt + '</td>' +
                        '</tr>';

                    tableBody.append(row);
                    salesData.push(movie.salesAmt);
                    labels.push(movie.movieNm);
                    salesShare.push(movie.salesShare);
                }
                createSalesChart(salesData, labels);
                createSalesShareChart(salesShare, labels);
                tableBody.find('tr:first').trigger('click');
            }

            function createSalesChart(data, labels) {
                if (salesChart) {
                    salesChart.destroy(); // 현재 그래프가 있으면 파괴
                }

                var ctx = document.getElementById('salesChart').getContext('2d');
                salesChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '매출액',
                            data: data,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }

            function createSalesShareChart(data, labels) {
                if (salesShareChart) {
                    salesShareChart.destroy(); // 현재 원 그래프가 있으면 파괴
                }

                var ctx = document.getElementById('salesShareChart').getContext('2d');
                salesShareChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '매출 점유율',
                            data: data,
                            backgroundColor: [
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderColor: [
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderWidth: 1
                        }]
                    }
                });
            }

            
        });
    </script>
</body>
</html>
