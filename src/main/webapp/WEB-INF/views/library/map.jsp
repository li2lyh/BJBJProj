<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북적북적 - 주변 도서관 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- Kakao Map API Script -->
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2d6408118d8e73e46ae000a50439ccb&libraries=services"></script>
</head>
<style>
div {
	border: 0px solid gray;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}
#map {
	width: 100%;
	height: 700px;
}

.title {
	font-weight: bold;
	display: block;
}

.loc_list {
	border: 1px solid black;
	width: 100%;
	height: 600px;
	overflow: scroll;
}

.loc_item {
	border: 1px solid black;
	border-radius: 20px;
	margin: 7px;
	padding:5px;
	width: 95%;
}

.selectLocRange {
	padding-bottom: 10px;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>

<body>
	<div class="container-fluid container-xl">
		<!------------------------------------- header ----------------------------------------->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		<!------------------------------------- main content ----------------------------------->
		<div class="titleBox">
			<h1>Library</h1>
			<span>주변 도서관 정보를 보여줍니다. 모임을 할 장소를 찾아보세요!</span>
		</div>
		
		<div class="row">
			<div class="col-8">
				<div class="map_wrap">
					<div id="map"></div>
					<div class="hAddr">
						<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
					</div>
				</div>
			</div>
			<div class="col-4">
				
				<div class="selectLocRange">
				<button type="button" class="" id="myLocation">내위치</button>
					<select class="form-select area1" style="width: 100px; display:inline;" aria-label="Default select example">
						<option selected>시도명</option>

					</select>
					<select class="form-select area2" style="width: auto; display:inline;" aria-label="Default select example">
						<option selected>시군구명</option>
					</select>
				</div>
				<div class="loc_list">
					<div class="loc_item">
						<span><a href="#">도서관 이름</a></span>
						<span>10:00 ~ 18:00 운영시간</span>
						<span style="display: block;">인천광역시 미추홀구 석정로 462</span>
						<span>연락처</span>
					</div>
				</div>
			</div>
		</div>
		<!------------------------------------- footer ----------------------------------------->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>

	<script>
	
		// select 박스 - 자역권별 검색
		let area = {
			"강원도" : ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군"
					, "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"]
			, "경기도" : ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "단원구"
					, "동두천시", "부천시", "성남시", "수원시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시"
					, "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시"
					,"화성시"]
			, "경상남도" : ["거창군", "김해시", "밀양시", "거제시", "사천시", "고성군", "남해군", "양산시", "하동군", "합천군"
						, "창원시", "의령군", "산청군", "창녕군", "창원시", "진주시", "통영시", "함안군", "함양군"]
			, "경상북도" : ["칠곡군", "청도군", "청송군", "영주시", "경주시", "상주시", "김천시", "영덕군", "의성군", "고령군"
						, "안동시", "포항시", "문경시", "군위군", "예천군", "봉화군", "성주군", "영양군", "경산시", "구미시"
						, "영천시", "울진군"]
			, "광주광역시" : ["남구", "서구", "동구", "광산구", "북구"]
			, "대구광역시" : ["달성군", "달서구", "서구", "중구", "남구", "수성구", "북구", "동구"]
			, "대전광역시" : ["중구", "동구", "유성구", "대덕구", "서구"]
			, "부산광역시" : ["사상구", "해운대구", "금정구", "동래구", "중구", "수영구", "서구", "동구", "강서구", "영도구"
							, "남구", "연제구", "사하구", "북구", "기장군", "부산진구"]
			, "서울특별시" : ["은평구", "용산구", "서울특별시 도봉구", "동작구", "영등포구", "성북구", "서초구", "강동구"
							, "강서구", "마포구", "중랑구", "송파구", "종로구", "성동구", "강남구", "중구", "관악구"
							, "금천구", "강북구", "광진구", "구로구", "양천구", "서대문구", "노원구"]
			, "세종특별자치시" : ["세종특별자치시"]
			, "울산광역시" : ["남구", "울주군", "동구", "북구", "중구"]
			, "인천광역시" : ["서구", "연수구", "남동구", "중구", "미추홀구", "부평구", "강화군", "동구", "계양구", "옹진군"]
			, "전라남도" : ["담양군", "보성군", "화순군", "장흥군", "해남군", "영암군", "무안군", "함평군", "영광군", "진도군"
						, "곡성군", "구례군", "완도군", "고흥군", "장성군", "나주시", "광양시", "여수시", "순천시", "목포시"
						, "신안군", "강진군"]
			, "전라북도" : ["임실군", "무주군", "군산시", "완주군", "고창군", "순창군", "전주시", "남원시", "장수군", "익산시"
						, "전라북도 진안군", "부안군", "정읍시"]
			, "제주특별자치도" : ["제주시", "서귀포시"]
			, "충청남도" : ["천안시", "논산시", "예산군", "홍성군", "청양군", "계룡시", "태안군", "부여군", "공주시", "서천군"
						, "금산군", "당진시", "보령시", "서산시", "아산시", "홍성"]
			, "충청북도" : ["영동군", "음성군", "충청북도 청주시", "옥천군", "충주시", "제천시", "보은군", "증평군", "진천군"
						, "단양군", "청주시", "괴산군 괴산읍", "괴산군"]
		}
		
		// 시도명 미리 로딩
		let areaKeys = Object.keys(area);
		for (let key of areaKeys) {
			let opt = $("<option value="+key+">").append(key)
			$(".area1").append(opt)
		}
		
		// 시도명 선택하면 시군구명 로딩
		$(".area1").on("change", function() {
			let region = $(".area1").val()
			let regionArr = area[region];
			$(".area2").empty();
			for (region of regionArr) {
				let opt = $("<option value="+region+">").append(region)
				$(".area2").append(opt)
			}
		})
		
		// 시군구명 선택하면 지도 이동
		$(".area2").on("change", function() {
			let area1 = $(".area1").val()
			let area2 = $(".area2").val()
			// 주소로 좌표를 검색합니다
			
			geocoder.addressSearch(area1 + area2, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		})
	
		// 내 위치로 이동
		document.getElementById('myLocation').onclick = function() {
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도
					searchAddrFromCoords(map.getCenter(), displayCenterInfo);
					// 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(new kakao.maps.LatLng(lat, lon));
				});
			}
		}
		
	
		// 1. 지도 생성하기
		let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 4
		//지도의 레벨(확대, 축소 정도)
		};

		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		// 2. Geolocation으로 현재 위치 마커로 표시
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">현재 위치입니다</div>'; // 인포윈도우에 표시될 내용입니다
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			    
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});
			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});
			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}

		// 3. 현재 주소 중심 좌표를 주소로 변환 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		    searchAddrFromCoords(map.getCenter(), getNearLibrary);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}
		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');
				
				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						// console.log(result[i])
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
		
		function getCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						console.log(result[i])
						console.log(result[0].region_1depth_name)
					}
				}
			}
		}
		
		
		function getNearLibrary(result, status) {
			if (status === kakao.maps.services.Status.OK){
				let res;
				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						console.log(result[i])
						res = result[i];
					}
				}
				let addr_depth1 = res.region_1depth_name
				let addr_depth2 = res.region_2depth_name
				
				$.ajax({
					url: "/library/getLibrary"
					, data: { addr_depth1: addr_depth1, addr_depth2: addr_depth2 }
					, type: "POST"
					, dataType: "json"
					, success: function(data) {
						let addrList = data.response.body.items
						makeMarkers(addrList)
						makeLibraryList(addrList)
					}, error: function(e) {
						console.log(e);
					}
				})
			}
		}
		
		// 주변 도서관 정보를 옆애 뿌리기
		function makeLibraryList(addrList) {
			console.log(addrList)
			
			$(".loc_list").empty();
			
			for (let item of addrList){
				let div = $("<div>").attr("class","loc_item");
				let span1 = $("<span style='margin-right: 10px'>").append(item.lbrryNm)
				let span2 = $("<span style='font-size : 15px'>").append(item.weekdayOperOpenHhmm + " ~ " + item.weekdayOperColseHhmm)
				let span3 = $("<span style='display: block'>").append(item.rdnmadr)
				let span4 = $("<span style='display: block'>").append(item.phoneNumber)
				
				div.append(span1, span2, span3, span4)
				$(".loc_list").append(div)
				
			}
		}
		
		// 주변 도서관 정보로 마커 만들기
		let markers = [];
		function makeMarkers(addrList) {
			if (markers.length > 0) {
				for (marker of markers) {
					marker.setMap(null);
				}
			}
			for (let addr of addrList) {
				// 마커가 표시될 위치입니다
				var markerPosition  = new kakao.maps.LatLng(addr.latitude, addr.longitude); 
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				var iwContent = '<div style="padding:5px; height:auto; word-break:keep-all;">' + addr.lbrryNm + '<br>&nbsp;</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(addr.latitude, addr.longitude); //인포윈도우 표시 위치입니다
			    
			    var infowindow = new kakao.maps.InfoWindow({
			        position : iwPosition, 
			        content : iwContent 
			    });
			    
			 	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			 	
				markers.push(marker)
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			}
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		
	</script>
</body>
</html>