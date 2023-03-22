<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/js/bootstrap.min.css">
  <link rel="stylesheet" href="/js/jquery-ui.min.css">
  <script src="/js/jquery.min.js"></script>
  <script src="/js/jquery-ui.min.js"></script>
  <script src="/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=??"></script>
  <title>courseInsert</title>
  <style>
  	*{
		padding: 0; margin: 0;
	}
	#body{ 
	  min-width: 1190px; 
	  font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	  line-height: 16px; font-size: 12px; color: #202020; 
	}
	ul,li{
	  list-style: none;
	}
  
	.clearfix::after{
	  content: ''; clear: both; display: block; 
	}
	a{
	  text-decoration: none;
	}
	.contents {
    width: 1190px;
    margin: 0 auto;
    padding: 0 20px 27px 20px;
  }
  .cos-title-name{
    font-size: 30px;
  }
  .cos_section{
    overflow: hidden;
    padding: 24px 0 6px;
    font-weight: 700;
    font-size: 16px;
    color: #000;
    
  }
  .cos_section .cos-type1{
    margin-right: 50px;
  }
  .cos_section > div {
    float: left;
  }
  .cos_section > div span{
    display: block;
  }
  .cos_section > div label{
    line-height: 40px;
    margin-right: 15px;
  }
  label{
    display: inline;
    zoom: 1;
    vertical-align: middle;
  }
  .cos_section > div select{
    width: 170px;
    height: 40px;
    line-height: 40px;
    color: #000;
    font-size: 14px;
  }
  select {
    padding: 3px 2px 3px 2px;
    background-color: #fff;
    font-size: 13px;
    line-height: 18px;
    border: 1px solid #bbb;
    color: #666;
    vertical-align: top;
  }
  option {
    font-weight: normal;
    display: block;
    white-space: nowrap;
    min-height: 1.2em;
    padding: 0px 2px 1px;
  }
  .cos_content_box{
    position: relative;
    width: 100%;
    margin-top: 24px;
  }
  .total_check{
    position: relative;
    width: 1190px;
    padding: 15px 0 13px;
    font-weight: 700;
    border-top: 1px solid #767676;
  }
  .total_check strong {
    font-weight: 700;
    font-size: 18px;
    color: #000;
    margin-left: 50px;
  }
  .total_check strong span {
    padding: 0 2px;
    color: #0a97cd;
  }
  .total_check .total_distance {
    position: absolute;
    top: 15px;
    color: #767676;
    right: 50px;
  }
  .total_check .total_distance .distance_name{
    color: #000;
    font-size: 17px;
  }
  .total_check .total_distance .distance_name em{color: #0a97cd;}
  .cos-list{
    width: 1190px;
  }
  .cos-list .cos-item{
    position: relative;
    padding: 20px 0;
    border-bottom: 1px solid #e6e6e6;
    border-top: 1px solid #e6e6e6;
  }
  .cos-list .cos-item .cos-photo{
    position: absolute;
    left: 0;
    top: 20px;
    width: 140px;
    height: 94px;
  }
  .cos-list .cos-item .cos-photo a{
    display: block; 
  }
  .cos-list .cos-item .cos-photo .numbering{
    position: absolute;
    left: 0;
    top: 0;
    display: inline-block;
    background: #e54645;
    color: #fff;
    font-weight: 700;
    font-size: 16px;
    text-align: center;
    line-height: 28px;
    width: 30px;
    height: 30px;
  }
  .cos-list .cos-item .cos-photo img{
    width: 200px;
    height: 164.5px;
  }
  .cos-list .cos-item .cos-text{
    min-height: 94px;
    padding-left: 240px;
    padding-right: 20px;
  }
  .title-area >a{
    float: left; 
    overflow: hidden;
    width: 100%;
    font-weight: bold;
    font-size: 25px;
    color: #000;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .title-area >p{
    float: right; 
    font-size: 14px;
  }
  .cos-text .sub_content{
    overflow: hidden;
    padding-top: 5px;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .cos-text .tag{
    overflow: hidden;
    padding-top: 5px;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .ui-state-default{
    background-color: #fff; border: 0;
  }
  .introduce_text{
    padding: 20px 0 0;
    font-size: 18px;
    color: #333;
    font-weight: 400;
  }
  .cos_textarea{
    width: 1190px;
    min-height: 180px;
    text-align: left;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }
  .txtNum{
    font-size: 16px;
    text-align: right;
  }
  .textNum{
    color: #ed5643;
  }
  .input-group{
  	width:1190px;
  }
  </style>
</head>
<body>
  <div class="contents">
    <div class="form-group">
      <label class="cos-title-name">코스이름</label>
      <input type="text" class="form-control mt-4 mb-3">
    </div>
    <div class="cos_section">
      <div class="cos-type1">
        <span>
          <label for="Type">코스 테마</label>
          <select id="Type" title="코스 테마 선택">
            <option value="0">테마 선택</option>
            <option value="1">가족코스</option>
            <option value="2">혼자여행</option>
            <option value="3">도보코스</option>
            <option value="4">힐링코스</option>
            <option value="5">맛 코스</option>
            <option value="6">캠핑코스</option>
            <option value="7">반려동물과 함께</option>
          </select>
        </span>
      </div>
      <div class="cos-type2">
        <span>
          <label for="Category">코스 일정</label>
          <select id="Category" title="코스 일정 선택">
            <option value="0">일정 선택</option>
            <option value="1">당일여행</option>
            <option value="2">1박2일</option>
            <option value="3">2박3일 이상</option>
          </select>
        </span>
      </div>
    </div>
    <div class="cos_content_box">
      <div class="total_check">
        <strong>
          총
          <span>7</span>
          건
        </strong>
        <div class="total_distance">
          <span class="distance_name">코스 총거리 : <em>56.7km</em></span>
        </div>
      </div>
      <ul class="cos-list" id="sortable">
        <li class="cos-item ui-state-default">
          <div class="cos-photo">
            <a href="#">
              <em class="numbering">1</em>
              <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=83804651-01e0-4809-bde0-13bb26a33618" alt="궁리포구">
            </a>
          </div>
          <div class="cos-text">
            <div class="title-area clearfix">
              <a href="#">상품 이름(클릭시 상품으로)</a>
              <p>지역들어갈거임</p>
            </div>
            <p class="sub_content">상품 간단소개 들어갈거임</p>
            <p class="tag">
              <span>#해쉬태그 들어갈거임1</span>
              <span>#해쉬태그 들어갈거임2</span>
            </p>
          </div>
        </li>
        <li class="cos-item ui-state-default">
          <div class="cos-photo">
            <a href="#">
              <em class="numbering">2</em>
              <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=83804651-01e0-4809-bde0-13bb26a33618" alt="궁리포구">
            </a>
          </div>
          <div class="cos-text">
            <div class="title-area clearfix">
              <a href="#">상품 이름(클릭시 상품으로)2</a>
              <p>지역들어갈거임</p>
            </div>
            <p class="sub_content">상품 간단소개 들어갈거임</p>
            <p class="tag">
              <span>#해쉬태그 들어갈거임1</span>
              <span>#해쉬태그 들어갈거임2</span>
            </p>
          </div>
        </li>
      </ul>
      <form class="input-group mb-3" action="">
        <input type="text" class="form-control" placeholder="상품검색" name="search" value="">
        <div class="input-group-append">
          <button class="btn btn-success" type="submit">검색</button>
        </div>
      </form>
      <div class="mapIntoduce">
        <div class="introduce_text">
          <textarea name="csdesc" id="csdesc" maxlength="2000" class="cos_textarea" title="코스소개" placeholder="코스에 대한 간략한 설명을 작성할 수 있습니다."></textarea>
          <p class="txtNum">현재 글자수 <span class="textNum">0</span>자 / 최대 글자수 2000자</p>
        </div>
      </div>
      <div id="map" style="width:1190px;height:400px;"></div>
    </div>
  </div>
  <script>
    $( function() {
      $( "#sortable" ).sortable();
    });
    function reorder() {
      $("#sortable li").each(function(i, box) {
        $(box).val(i + 1);
      });
    }
    
  </script>
  <script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.56525, 126.98963), // 지도의 중심좌표
	    level: 5, // 지도의 확대 레벨
	    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
		 // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	});
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	// 지도에 선을 표시한다 
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    	// 클릭한 위도, 경도 정보를 가져옵니다 
    	var latlng = mouseEvent.latLng;
    	var markerPosition  = new kakao.maps.LatLng(latlng.getLat, latlng.getLng);
    	marker = new kakao.maps.Marker({ 
    	    // 지도 중심좌표에 마커를 생성합니다 
    	    position: markerPosition 
    	}); 
    	marker.setMap(map);
    });
	var polyline = new kakao.maps.Polyline({
		map: map, // 선을 표시할 지도 객체 
		path: [ // 선을 구성하는 좌표 배열
			new kakao.maps.LatLng(37.56525, 126.98163),
			new kakao.maps.LatLng(37.56925, 126.98563),
			new kakao.maps.LatLng(37.56925, 126.98163)
		],
		endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
		strokeWeight: 3, // 선의 두께
		strokeColor: '#FF0000', // 선 색
		strokeOpacity: 0.9, // 선 투명도
		strokeStyle: 'solid' // 선 스타일
	});	

  </script>
</body>
</html>
