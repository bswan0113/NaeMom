<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous"></link>

<link rel="shortcut icon" href="#">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: black;
}

body {
	margin: 0;
	padding: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕",
		helvetica, "Apple SD Gothic Neo", sans-serif;
	line-height: 16px;
	font-size: 12px;
	color: #202020;
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
	margin-bottom: 0;
}

#menu {
	margin-bottom: 20px;
	overflow: hidden;
	position: relative;
	padding: 0 11px;
	background-color: #29c16d;
}

.menu-li {
	float: left;
	padding: 12px 9px;
	color: white !important;
}

.menu-li a {
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
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
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
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

/* 사이드바 바디 */
.menu-content {
	
}

.search-text{
	text-align:center; 
	font-weight:bold; 
	font-size:30px;
	color : #808080;
}
</style>
<div id="sidebar">
	<div id="logo">
		<a href="<c:url value="/"></c:url>"><img
			src="<c:url value ='/resources/img/logo.png'></c:url>" alt="#"></a>
	</div>
	<div id="search" class="form-group">
		<div class="input-group">
			<input type="text" class="form-control product-search"
				placeholder="장소 검색">
			<div class="input-group-append">
				<button class="btn btn-success btn-search">검색</button>
			</div>
		</div>
	</div>
	<div id="menu">
		<ul class="menu-ul">
			<li class="menu-li"><a href="#" class="menu-li"
				data-pd-pc-num="1">여행</a></li>
			<li class="menu-li"><a href="#" class="menu-li"
				data-pd-pc-num="2">음식</a></li>
			<li class="menu-li"><a href="#" class="menu-li"
				data-pd-pc-num="3">숙박</a></li>
			<li class="menu-li"><a href="#" class="menu-li"
				data-pd-pc-num="4">축제</a></li>
		</ul>
	</div>
	<div>
		<div class="search-text">
			<p>검색어를 입력하세요</p>
		</div>
		<table class="product-table">
			<thead>
				<th>상품</th>
				<th>내용</th>
				<th></th>
			</thead>
			<tbody class="productList">
				<tr class="select_product" onclick="redirectToDetailPage()">
				    <td>1</td>
				    <td>2</td>
				    <td>3</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="map" style="float: right"></div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d3f638bdeedf08d5afccc6accd5e919&libraries=services"></script>
<script>
	var container = document.getElementById('map');
	
	var options = {
		center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 (서울시청)
		level: 3
	};

	var map = new kakao.maps.Map(container, options);

	navigator.geolocation.getCurrentPosition(function(position) {
	    // 현재 위치를 중심으로 지도 이동
	    var lat = position.coords.latitude; // 위도
	    var lng = position.coords.longitude; // 경도
	    var locPosition = new kakao.maps.LatLng(lat, lng); // 좌표 생성
	    var marker = new kakao.maps.Marker({ // 마커 생성
	        position: locPosition
	    });
	    map.setCenter(locPosition); // 지도 이동
	}); 
	
	var geocoder = new kakao.maps.services.Geocoder();

	//product 정보를 가져와 배열에 저장
	var positions = [];
	<c:forEach items="${plist}" var="item">
		var obj = {
				pdNum : "${item.pd_num}",
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
	    } 
	      
	      
	    // 커스텀 오버레이에 표시할 컨텐츠 입니다
	  	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	  	// 별도의 이벤트 메소드를 제공하지 않습니다 
	  	
	    
	    var content = document.createElement('div');
	    content.classList.add('wrap');

	    var info = document.createElement('div');
	    info.classList.add('info');

	    var titleDiv = document.createElement('div');
	    titleDiv.classList.add('title');
	    var titleText = document.createTextNode(title);
	    titleDiv.appendChild(titleText);

	    var closeBtn = document.createElement('div');
	    closeBtn.classList.add('close');
	    closeBtn.setAttribute('title', '닫기');
	    closeBtn.addEventListener('click', closeOverlay);
	    titleDiv.appendChild(closeBtn);

	    info.appendChild(titleDiv);

	    var bodyDiv = document.createElement('div');
	    bodyDiv.classList.add('body');

	    var imgDiv = document.createElement('div');
	    imgDiv.classList.add('img');
	    var img = document.createElement('img');
	    img.setAttribute('src', '<c:url value=""></c:url>');
	    img.setAttribute('width', '73');
	    img.setAttribute('height', '70');
	    imgDiv.appendChild(img);
	    bodyDiv.appendChild(imgDiv);

	    var descDiv = document.createElement('div');
	    descDiv.classList.add('desc');

	    var ellipsisDiv = document.createElement('div');
	    ellipsisDiv.classList.add('ellipsis');
	    var addressText = document.createTextNode(address);
	    ellipsisDiv.appendChild(addressText);
	    descDiv.appendChild(ellipsisDiv);

	    var linkDiv = document.createElement('div');
	    var link = document.createElement('a');
	    link.setAttribute('href', '<c:url value="/product/detail/detailLayoutTMP/' + position.pdNum + '"></c:url>');
	    link.setAttribute('target', '_blank');
	    link.classList.add('link');
	    var linkText = document.createTextNode('상품보기');
	    link.appendChild(linkText);
	    linkDiv.appendChild(link);
	    descDiv.appendChild(linkDiv);

	    bodyDiv.appendChild(descDiv);

	    info.appendChild(bodyDiv);

	    content.appendChild(info);
	    
	 	// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = null;
	 	
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			if(!overlay)
				overlay = new kakao.maps.CustomOverlay({
					content: content,
					map: map,
					position: marker.getPosition(),
			    });
		    overlay.setMap(map);
		    
		});

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);
		}
		
	  });
	});

	


<!-- 사이드 바 -->

$(document).ready(function(){
	  let array = [];
	  <c:forEach items="${pd_num}" var="num">
	 	 array.push(${num})
	 	  ajaxPost(${num}, '<c:url value="/map/selectProduct"></c:url>');
	  </c:forEach>
	 	
});

$('.product-table').hide();



$('.btn-search').click(function(){
	  let product_search = $('.product-search').val();
	  let product = {
			  pd_title : product_search
	  }
	  ajaxPost(product, '<c:url value="/map/searchProduct"></c:url>', searchSuccess);
	  
	  
})

function searchSuccess(data,e){
	  str = '';
	  if(data.product == ''){
		  alert('일치하는 상품이 없습니다.')
		  return;
	  }
	  
	  for(i = 0; i<data.products.length; i++){
		  for(j=0; j<data.pdCategory.length;j++){
		  	str += searchProductTable(data.products[i],data.pdCategory[j]);
		  }
	  }
	  
	  $('.productList').html(str);
	  $('.product-table').show();
	  $('.select-product').click(function(){
		  let pd_nums = $(this).find('.find_pdNum').text(); 
		  ajaxPost(products, '<c:url value="/map/selectProduct"></c:url>', searchProductTable);
	  })
	  
}


function searchProductTable(product,pdCategory){
	  str='';
	  if(product.pd_pc_num == pdCategory.pc_num){
		  let pd_pc_name = pdCategory.pc_category
		  $('.search-text').hide();
		  str +=
			'<tr class="select_product" onclick="redirectToDetailPage(this)">'+
				'<td>'+product.pd_title+'</td>'+
				'<td>'+product.pd_subtitle+'</td>'+
				'<td class="find_pdNum" style="display:none;">'+product.pd_num+'</td>'+
			'</tr>'
	  }
	return str;
}; 

$('.select_product').click(function() {
	  // 상품 주소 가져오기
	  var address = $(this).find('.find_pdAddress').text();

	  // 주소로 좌표 검색하기
	  geocoder.addressSearch(address, function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	      // 좌표 가져오기
	      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	      
	      // 지도 중앙 좌표 이동하기
	      map.setCenter(coords);
	    }
	  });
	});

/* function redirectToDetailPage(row) {
    const pdNum = row.querySelector('.find_pdNum').textContent;
    window.location.href = '/naemom/product/detail/detailLayoutTMP/' + pdNum;
}
 */
function ajaxPost(obj, url, successFunction){
	$.ajax({
		async:false,
		type: 'POST',
		data: JSON.stringify(obj),
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunction
	});
}

</script>
