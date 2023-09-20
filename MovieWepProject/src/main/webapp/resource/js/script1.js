// JavaScript 코드
document.addEventListener("DOMContentLoaded", function() {
	// 각 하위 메뉴 항목을 클릭했을 때 해당 페이지로 이동
	const submenuLinks = document.querySelectorAll(".submenu a");
	submenuLinks.forEach(link => {
		link.addEventListener("click", function(event) {
			event.preventDefault(); // 기본 동작(링크 이동) 방지
			const pageUrl = this.getAttribute("href");
			window.location.href = pageUrl; // 클릭한 항목의 링크로 이동
		});
	});
});



    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


// JavaScript 코드   보여주기 위한 자바스크립트 코드 이걸 kdmb 영화 검색 api가 적용되어야 하기 때문에 필히 수정해야 한다.
document.addEventListener("DOMContentLoaded", function() {
	const searchInput = document.getElementById("searchInput");
	const searchButton = document.getElementById("searchButton");
	const searchResults = document.getElementById("searchResults");

	searchButton.addEventListener("click", function() {
		const searchTerm = searchInput.value;

		// 검색어가 비어 있지 않은 경우에만 검색을 실행
		if (searchTerm.trim() !== "") {
			// 여기에서 검색 결과를 가져오고 표시하는 코드를 작성하세요.
			// 서버 측 언어(PHP, Node.js 등)를 사용하여 검색 결과를 가져올 수 있습니다.
			// 가져온 결과를 HTML로 동적으로 생성하여 searchResults 영역에 추가합니다.
			// 아래는 예시 코드입니다.
			
			// 예시: 검색어를 서버로 보내고 JSON 형식의 결과를 받는다고 가정
			fetch(`search_movies.php?term=${searchTerm}`)
				.then(response => response.json())
				.then(data => {
					// 검색 결과를 HTML로 생성
					let html = "";
					data.forEach(movie => {
						html += `
							<div class="card">
								<img src="${movie.poster}" class="card-img-top" alt="${movie.title} 포스터">
								<div class="card-body">
									<h5 class="card-title">${movie.title}</h5>
									<p class="card-text">감독: ${movie.director}</p>
									<!-- 여기에 더 많은 영화 정보를 추가하세요. -->
								</div>
							</div>
						`;
					});
					// 검색 결과를 표시할 영역에 추가
					searchResults.innerHTML = html;
				})
				.catch(error => {
					console.error("검색 오류:", error);
					// 검색 오류 처리 코드를 추가하세요.
				});
		}
	});
});

// JavaScript 코드 보여주기 위한 자바스크립트 코드 이걸 kdmb 박스오피스 순위와 api가 적용되어야 하기 때문에 필히 수정해야 한다.

document.addEventListener("DOMContentLoaded", function() {
	// 가상의 인기 영화 데이터 (예시)
	const popularMovies = [
		{ title: "백두산 (2019)", poster: "https://upload.wikimedia.org/wikipedia/ko/b/bc/%EB%B0%B1%EB%91%90%EC%82%B0_%EC%98%81%ED%99%94_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" },
		{ title: "범죄도시3 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jbremGnsRR4XZMDj97YHt20isRP.jpg" },
		{ title: "엘리멘탈 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/1YYL1OcgjPLjAGi6n0iZe1gdl9i.jpg" },
		{ title: "스즈메의 문단속 (2022)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jJhP6C9tNxf3txPDi6HBHTUEldk.jpg" },
		{ title: "밀수 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ayLXqPZCu3uaLLhXiqvw5NBb7Lw.jpg" },
		{ title: "가디언즈 오브 갤럭시 Volume 3 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zK0FTsXvkWVS3yubZkbenbAFcnY.jpg" },
		{ title: "바비 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rt8sHzR0XUyKHxU75ZIWs7MsNEN.jpg" },
		{ title: "오펜하이머 (2023)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kAYtsVpE7q6NhLz6vKYAxOM6LmN.jpg" },
		{ title: "미션 임파서블: 데드 레코닝 PART ONE (2023)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nQsWPG020kSWdOl3EhFXRNE2s0n.jpg" },
		{ title: "범죄도시 2 (2022)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wxNUnSzuMgsT8DFkZjX9GtfOKJX.jpg" },
	

	];

	// 가상의 추천 영화 데이터 (예시)
	const recommendedMovies = [
		 { title: "백두산 (2019)", poster: "https://upload.wikimedia.org/wikipedia/ko/b/bc/%EB%B0%B1%EB%91%90%EC%82%B0_%EC%98%81%ED%99%94_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" },
		{ title: "범죄도시3 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jbremGnsRR4XZMDj97YHt20isRP.jpg" },
		{ title: "엘리멘탈 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/1YYL1OcgjPLjAGi6n0iZe1gdl9i.jpg" },
		{ title: "스즈메의 문단속 (2022)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jJhP6C9tNxf3txPDi6HBHTUEldk.jpg" },
		{ title: "밀수 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ayLXqPZCu3uaLLhXiqvw5NBb7Lw.jpg" },
		{ title: "가디언즈 오브 갤럭시 Volume 3 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zK0FTsXvkWVS3yubZkbenbAFcnY.jpg" },
		{ title: "바비 (2023)", poster: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rt8sHzR0XUyKHxU75ZIWs7MsNEN.jpg" },
		{ title: "오펜하이머 (2023)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kAYtsVpE7q6NhLz6vKYAxOM6LmN.jpg" },
		{ title: "미션 임파서블: 데드 레코닝 PART ONE (2023)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nQsWPG020kSWdOl3EhFXRNE2s0n.jpg" },
		{ title: "범죄도시 2 (2022)", poster: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wxNUnSzuMgsT8DFkZjX9GtfOKJX.jpg" },
	];




	// 랜덤하게 10개의 영화 선택
	const randomMovies = getRandomMovies(popularMovies, 10);
	const randomRecommendedMovies = getRandomMovies(recommendedMovies, 10);


	// 선택된 영화 포스터를 표시
	const popularMoviesContainer = document.querySelector("#popularMoviesContainer");
	randomMovies.forEach(movie => {
		const movieCard = createMovieCard(movie.title, movie.poster);
		movieCard.classList.add("col-md-2"); 
		popularMoviesContainer.appendChild(movieCard);
	});

	// 선택된 추천 영화 포스터 표시
	const recommendedMoviesContainer = document.querySelector("#recommendedMoviesContainer");
	randomRecommendedMovies.forEach(movie => {
		const movieCard = createMovieCard(movie.title, movie.poster);
		movieCard.classList.add("col-md-2"); 
		recommendedMoviesContainer.appendChild(movieCard);
	});
});


// 랜덤하게 N개의 아이템 선택
function getRandomMovies(arr, count) {
	const shuffled = arr.sort(() => 0.5 - Math.random());
	return shuffled.slice(0, count);
}

// 영화 카드 생성 함수
function createMovieCard(title, posterUrl) {
	const cardDiv = document.createElement("div");
	cardDiv.classList.add("col-md-2"); // 2열로 표시하려면 각 카드의 너비를 조절하세요.


	const card = document.createElement("div");
	card.classList.add("card");

	const poster = document.createElement("img");
	poster.src = posterUrl;
	poster.classList.add("card-img-top");

	const cardBody = document.createElement("div");
	cardBody.classList.add("card-body");

	const cardTitle = document.createElement("h5");
	cardTitle.classList.add("card-title");
	cardTitle.textContent = title;

	cardBody.appendChild(cardTitle);
	card.appendChild(poster);
	card.appendChild(cardBody);
	cardDiv.appendChild(card);

	return cardDiv;
}

/* JavaScript를 사용하여 하위 메뉴 표시 */
document.addEventListener("DOMContentLoaded", function () {
	const menuItems = document.querySelectorAll(".nav-item");

	menuItems.forEach(function (menuItem) {
		menuItem.addEventListener("mouseenter", function () {
			this.querySelector(".submenu").style.display = "block";
		});

		menuItem.addEventListener("mouseleave", function () {
			this.querySelector(".submenu").style.display = "none";
		});
	});
});

document.addEventListener("DOMContentLoaded", function() {
	//특정 위치에 지도 소환
	const map = new google.maps.Map(document.getElementById("map"), {
		center: { lat: 37.7749, lng: -122.4194 }, // 임의 위치 지정
		zoom: 13 // 줌 레벨 조정
	});

	// 영화관 마커 더하기 예시
	const theaterMarker = new google.maps.Marker({
		position: { lat: 37.7749, lng: -122.4194 }, // 극장 위치 지정
		map: map,
		title: "부평cgv" // 영화관 이름
	});

	//필요한 더 많은 마커 더하기
	// You can fetch theater data from an API and loop through the data to create markers
});





// JavaScript 코드

// document.addEventListener("DOMContentLoaded", function() {
//	 // 영화 관람객수 API를 호출하고 데이터를 가져옵니다.
//	 fetch("영화 관람객수 API URL")
//		 .then(response => response.json())
//		 .then(data => {
//			 // API 응답에서 영화 목록을 추출합니다.
//			 const movies = data.movies;

//			 // 랜덤하게 9개의 영화 선택 (또는 API 응답에서 필요한 수만큼 선택)
//			 const randomMovies = getRandomMovies(movies, 9);

//			 // 선택된 영화 포스터를 표시
//			 const popularMoviesContainer = document.querySelector("#popularMoviesContainer");
//			 randomMovies.forEach(movie => {
//				 const movieCard = createMovieCard(movie.title, movie.poster);
//				 popularMoviesContainer.appendChild(movieCard);
//			 });
//		 })
//		 .catch(error => {
//			 console.error("API 호출 오류:", error);
//			 // 오류 처리 코드를 추가하세요.
//		 });
// });

// // 랜덤하게 N개의 아이템 선택 (예시에서는 랜덤으로 선택하지 않고 모든 영화를 사용합니다)
// function getRandomMovies(arr, count) {
//	 return arr.slice(0, count);
// }

// // 영화 카드 생성 함수 (영화 제목과 포스터 URL을 받아서 카드를 생성합니다)
// function createMovieCard(title, posterUrl) {
//	 const cardDiv = document.createElement("div");
//	 cardDiv.classList.add("col-md-4");

//	 const card = document.createElement("div");
//	 card.classList.add("card");

//	 const poster = document.createElement("img");
//	 poster.src = posterUrl;
//	 poster.classList.add("card-img-top");

//	 const cardBody = document.createElement("div");
//	 cardBody.classList.add("card-body");

//	 const cardTitle = document.createElement("h5");
//	 cardTitle.classList.add("card-title");
//	 cardTitle.textContent = title;

//	 cardBody.appendChild(cardTitle);
//	 card.appendChild(poster);
//	 card.appendChild(cardBody);
//	 cardDiv.appendChild(card);

//	 return cardDiv;
// }
