<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>지도</title>
    <style>
        /* 지도를 표시할 요소의 크기를 지정 */
        #map {
            height: 800px;
            width: 100%;
        }
    </style>
</head>
<body>
    <h1>지도</h1>
    
    <div id="map"></div>
    
    <script>
        // Google Maps API 키를 설정
        const apiKey = 'AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U'; // 여기에 본인의 Google Maps API 키를 넣어주세요.
        let map;
        let myLocationMarker;
        let infoWindow; // 정보를 표시할 InfoWindow 객체

        function initMap() {
            // 사용자의 현재 위치를 가져오기
            navigator.geolocation.getCurrentPosition((position) => {
                const lat = position.coords.latitude;
                const lng = position.coords.longitude;

                // Google Maps 초기화
                map = new google.maps.Map(document.getElementById('map'), {
                    center: { lat, lng }, // 사용자의 현재 위치로 설정
                    zoom: 17, // 초기 줌 레벨
                });

                // 내 위치를 파란색 마커로 표시
                myLocationMarker = new google.maps.Marker({
                    position: { lat, lng },
                    map: map,
                    title: '내 위치',
                    icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                });

                // InfoWindow 객체 생성
                infoWindow = new google.maps.InfoWindow();

                // 스프레드시트의 시트 이름과 데이터 범위를 지정
                const sheetName = '영화';
                const range = `${sheetName}!C:H`; // 엑셀 파일에서 좌표, 이름, 주소, 전화번호가 있는 열 범위

                // fetch를 사용하여 Google Sheets API로 데이터 가져오기
                fetch(`https://sheets.googleapis.com/v4/spreadsheets/1k4GbpQHM0j4sJX2P8AYaAtLS_eqLbKSJ9sNEvTG_9oE/values/${range}?key=${apiKey}`)
                    .then(response => response.json())
                    .then(data => {
                        // 데이터를 처리하고 지도에 마커를 추가
                        data.values.forEach(row => {
                            const lat = parseFloat(row[2]);
                            const lng = parseFloat(row[3]);
                            const name = row[0];
                            const address = row[1];
                            const phoneNumber = row[4];
                            const homepage = row[5];

                            const marker = new google.maps.Marker({
                                position: { lat, lng },
                                map: map,
                                title: name // 마커 제목 설정
                            });

                            // 마커를 클릭했을 때 InfoWindow에 정보를 표시
                            marker.addListener('click', () => {
                                let content = `<strong>${name}</strong><br>`;

                                // 주소가 있는 경우에만 주소 정보 추가
                                if (address) {
                                    content += `주소: ${address}<br>`;
                                }

                                // 전화번호가 있는 경우에만 전화번호 정보 추가
                                if (phoneNumber) {
                                    content += `전화번호: ${phoneNumber}<br>`;
                                }

                                // 홈페이지가 있는 경우에만 홈페이지 정보 추가
                                if (homepage) {
                                    content += `홈페이지: <a href="${homepage}" target="_blank">${homepage}</a>`;
                                }

                                infoWindow.setContent(content);
                                infoWindow.open(map, marker); // 마커 근처에 InfoWindow 열기
                            });
                        });
                    });
            });
        }
    </script>
    
    <!-- Google Maps JavaScript API를 로드 -->
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&callback=initMap">
    </script>
</body>
</html>
