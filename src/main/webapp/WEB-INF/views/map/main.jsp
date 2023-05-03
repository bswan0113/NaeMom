<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"></link>

<link rel="shortcut icon" href="#">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 <style>
*{
    margin: 0;
    padding: 0;
}
ul, li{
    list-style :none;
}
a{
    text-decoration: none;
    color: black;
}
body {
    margin: 0;
    padding: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
  	line-height: 16px; font-size: 12px; color: #202020;
}
#map {
    position: absolute;
    top: 0;
    bottom: 0;
    width: calc(100% - 400px);
    z-index: 1;
    left: 400px;
}


#sidebar {
    position: absolute;
    top: 0;
    left: 0;
    width: 400px;
    height: 100vh;
    background-color: white;
}
/* 사이드바 헤더 */
#logo {
    text-align: center;
}
#search {
    background-color: #29c16d;
    margin-bottom : 0;
}
#menu {
    margin-bottom: 20px;
    overflow: hidden;
    position: relative;
    padding: 0 11px;
    background-color: #29c16d;
}

.menu-li{
	float : left;
	padding: 12px 9px;
	color : white !important;
}

.menu-li a{
	padding: 6px 0 5px;
    font-size: 15px;
    font-weight: 600;
    color: #fff;
    display: block;
    overflow: hidden;
    width: 70px;
    border-radius: 3px;
    text-align: center;
    text-decoration: none;
}

/* 맵 오버레이 */
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}
.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

/* 사이드바 바디 */

.menu-content{

}

 </style> 
 <div id="sidebar">
	<div id="logo">
		<a href="<c:url value="/"></c:url>"><img src="<c:url value ='/resources/img/logo.png'></c:url>" alt="#"></a>
	</div>
	<div id="search" class="form-group">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="장소 검색">
			<div class="input-group-append">
				<button class="btn btn-success btn-search">검색</button>
			</div>
		</div>
	</div>
	<div id="menu">
		<ul class="menu-ul">
			<li class="menu-li"><a href="#" class="menu-li">여행</a></li>
			<li class="menu-li"><a href="#" class="menu-li">음식</a></li>
			<li class="menu-li"><a href="#" class="menu-li">숙박</a></li>
			<li class="menu-li"><a href="#" class="menu-li">축제</a></li>
		</ul>
	</div>
	<div id="menu-content">
		<p>상품을 검색하세요.</p>
	</div>
</div> 
<div id="map" style="float : right"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d3f638bdeedf08d5afccc6accd5e919&libraries=services"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);

	
	var geocoder = new kakao.maps.services.Geocoder();

	//product 정보를 가져와 배열에 저장
	var positions = [];
	<c:forEach items="${plist}" var="item">
		var obj = {
				title : "${item.pd_title}",
				address : "${item.pd_street_address}"
		}
		positions.push(obj);
	</c:forEach>
	
	positions.forEach(function(position, index) {
	  var title = position.title;
	  var address = position.address;
	  //주소로 좌표를 검색합니다
	  geocoder.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {

	      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	      // 결과값으로 받은 위치를 마커로 표시합니다
	      var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	      });
	      
	      
	    // 커스텀 오버레이에 표시할 컨텐츠 입니다
	  	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	  	// 별도의 이벤트 메소드를 제공하지 않습니다 
	  	var content = '<div class="wrap">' + 
	  	            	'<div class="info">' + 
	  	            		'<div class="title">' + 
	  	            			title + 
	              				'<div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	              			'</div>' + 
	  	            		'<div class="body">' + 
	  	            			'<div class="img">' +
	  	            				'<img src="<c:url value=""></c:url>" width="73" height="70">' +
	  	            			'</div>' + 
	  	            			'<div class="desc">' + 
	  	            				'<div class="ellipsis">' + address +'</div>' + 
	  	            				'<div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	  	            			'</div>' + 
	  	            		'</div>' + 
	  	            	'</div>' +    
	  	            '</div>';

	    }
	 	// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition(),
		});

		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		(function(overlay, marker){
			kakao.maps.event.addListener(marker, 'click', function(map) {
			    overlay.setMap(map);
			});			
		})(marker, overlay);

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);
		}
		
	  });
	});

	

	navigator.geolocation.getCurrentPosition(function(position) {
	    // 현재 위치를 중심으로 지도 이동
	    var lat = position.coords.latitude; // 위도
	    var lng = position.coords.longitude; // 경도
	    var locPosition = new kakao.maps.LatLng(lat, lng); // 좌표 생성
	    var marker = new kakao.maps.Marker({ // 마커 생성
	        position: locPosition
	    });
	    map.setCenter(locPosition); // 지도 이동
	    marker.setMap(map); // 마커 지도에 표시
	}); 
	
	
	map.setMinLevel(3);
	map.setMaxLevel(10);
	
	var customOverlay = new kakao.maps.CustomOverlay({
	    range: 300
	});

	

	
	
</script>
