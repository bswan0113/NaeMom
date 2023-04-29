<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
<style type="text/css">
	
</style>
</head>
<body>
	<div id="map" style="width: 100%;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d3f638bdeedf08d5afccc6accd5e919"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
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
		    marker.setMap(map); // 마커 지도에 표시
		});
	</script>
</body>
</html>