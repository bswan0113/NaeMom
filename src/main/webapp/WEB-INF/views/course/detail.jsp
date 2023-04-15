<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
  <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
  <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script> -->
  <title>courseDetail</title>
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
	  .cos_section .cos-type1,.cos_section .cos-type2,.cos_section .cos-type3,.cos_section .cos-type4,.cos_section .cos-type5,
	  .cos_section .cos-type6,.cos_section .cos-type7{
	    margin-right: 30px;
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
	  .cos-list .cos_item_origin{
	  	position: relative;
	    padding: 20px 0;
	    border-bottom: 1px solid #e6e6e6;
	    border-top: 1px solid #e6e6e6;
	  }
	  .cos-list .cos-item .cos-photo{
	    position: absolute;
	    left: 100px;
	    top: 20px;
	    width: 140px;
	    height: 94px;
	  }
	  .cos-list .cos-item .cos-photo a{
	    display: block; 
	  }
	  .cos-list .cos-item .numbering{
	    position: absolute;
	    left: 0;
	    top: 74px;
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
	  .cos-list .cos-item .cos_text{
	    min-height: 94px;
	    padding-left: 340px;
	    padding-right: 20px;
	  }
	  .cos-list .cos_item_origin .cos_text_origin{
	  	min-height: 94px;
	    padding-left: 500px;
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
	  .cos_text .sub_content{
	    overflow: hidden;
	    padding-top: 5px;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	  }
	  .cos_text .tag{
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
	  .co_content{
	    width: 1190px;
	    min-height: 180px;
	    text-align: left;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	    margin-top:30px;
	    margin-bottom:30px;
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
	  .cos_text_origin{
	  	min-height: 94px;
	    padding-left: 500px;
	 
	  }
	  .btn_remove_list{
	    float: right; position: absolute; top: 10px; right: 0;
	   
	  }
	  .btn_report:hover{
	  	color:red;
	  }
  </style>
</head>
<body>
  <div class="contents clearfix">
    <div class="form-group">
    
      <label class="cos-title-name">코스제목</label>
      <button class="btn btn_report" style="float:right" data-toggle="modal" data-target="#myModal"><i class="fas fa-bell"></i></button>
      <!-- 신고 모달 -->
	  <div class="modal common-modal" id="myModal">
		  <div class="modal-dialog">
			  <div class="modal-content">
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">신고하기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			      	신고사유
			        <select class="form-control" id="report-category">
				        <option value="광고 및 홍보성 게시물">광고 및 홍보성 게시물</option>
				        <option value="욕설 및 혐오 표현">욕설 및 혐오 표현</option>
				        <option value="음란한 표현이 담긴 게시물">음란한 표현이 담긴 게시물</option>
				        <option value="도배">도배 </option>
				        <option value="기타">기타</option>
			        </select>
			      상세내용 : <textarea class="form-control" id="report-content"></textarea>
			   	  </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal" id="report-modal" data-num='' data-table=''>신고하기</button>
			        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
			      </div>

			    </div>
			</div>
	  </div>
      <div class="form-control mt-4 mb-3">${course.co_title }</div>
    </div>
    <div class="form-group">
      <label class="cos-title-name">작성자</label>
      <div class="form-control mt-4 mb-3">${course.co_me_id }</div>
    </div>
    <div class="cos_section">
		<div class="cos-type1 form-inline">
		    <label for="category">코스 테마</label>
		    <div class="form-control">${course.cc_category_name }</div>
		</div>
		<div class="cos-type2 form-inline">
		    <label for="schedule">코스 일정</label>
		    <div class="form-control">${course.cs_schedule_name }</div>
		</div>
      	<c:if test="${course.co_update_date == null }">
	      	<div class="cos-type3 form-inline">
				<label>작성일</label>
				<div class="form-control">${course.co_register_date_str }</div>
			</div>
      	</c:if>
      	
		<c:if test="${course.co_update_date != null }">
			<div class="cos-type7 form-inline">
				<label>수정일</label>
				<div class="form-control">${course.co_update_date_str }</div>
			</div>
		</c:if>
		<div class="cos-type4 form-inline">
			<label>조회수</label>
			<div class="form-control">${course.co_views }</div>
		</div>
		<div class="cos-type5 form-inline">
			<label>추천수</label>
			<div class="form-control up_sector">${course.co_up }</div>
		</div>
		<div class="cos-type6 form-inline">
			<label>비추천수</label>
			<div class="form-control down_sector">${course.co_down }</div>
		</div>
    </div>
	<div style="display:flex; justify-content:center; margin-top:20px">
		<c:if test="${like == null || like.li_updown != 1}">
			<button class="btn btn-outline-success btn-up" data-state="1">추천</button>
		</c:if>
		<c:if test="${like != null && like.li_updown == 1}">
			<button class="btn btn-success btn-up" data-state="1">추천</button>
		</c:if>
		<c:if test="${like == null || like.li_updown != -1}">
			<button class="btn btn-outline-danger btn-down" data-state="-1" style="margin-left:10px;">비추천</button>
		</c:if>
		<c:if test="${like != null && like.li_updown == -1}">
			<button class="btn btn-danger btn-down" data-state="-1" style="margin-left:10px;">비추천</button>
		</c:if>
	</div>
    <div class="cos_content_box">
      <div class="total_check">
        <strong>
          총
          <span class="totalCourseList">${items.size()}</span>
          건
        </strong>
        <div class="total_distance" >
        	<input type="hidden" name="co_total_distance" value="${course.co_total_distance}">
          	<span class="distance_name">코스 총거리 : <em class="products_distance">${course.co_total_distance}</em> km</span>
        </div>
      </div>
      <ul class="cos-list" id="sortable">
      	<c:forEach items="${items }" var="item">
	      	<li class="cos-item ui-state-default">
	            <em class="numbering">${item.ci_index }</em>
	          	<div class="cos-photo">
			        <a href="#">
		        		<c:forEach items="${files}" var="fi">
							<c:if test="${fi.fi_table_key == item.ci_pd_num && course.co_num == item.ci_co_num}">
								<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="course_item_img">
							</c:if>
						</c:forEach>
			        </a>
			    </div>
			    <div class="cos_text">
			    	<c:forEach items="${prlist }" var="pr">
				    	<c:if test="${item.ci_pd_num == pr.pd_num }">
					      	<p style="display:none" id="pd_num">${pr.pd_num}</p>
					      	<input type="hidden" class="pd_street_address" value="${ pr.pd_street_address}">
					        <div class="title-area clearfix">
					          <a href="#" id="pd_title">${pr.pd_title}</a>
					          <p id="pd_subtitle">${pr.pd_subtitle}</p>
					        </div>
					        <p class="sub_content" id="pd_content">${pr.pd_content}</p>
					        <p class="tag" id="hg_pd_num">
					        	<span>
							        <c:forEach items="${tags}" var="tags">
							        	<c:if test="${tags.hg_pd_num == pr.pd_num }">
								        	${tags.hg_name}  
							        	</c:if>
							        </c:forEach>
					       		</span>
					        </p>
				    	</c:if>
				    </c:forEach>
		        </div>
		    </li>
	       
      	</c:forEach>
      </ul>
      
      <div class="mapIntoduce">
        <div class="introduce_text">
          <label class="cos-title-name mb-3">코스설명</label>
          <textarea name="co_content" id="csdesc" maxlength="2000" class="co_content" title="코스소개" disabled>${course.co_content }</textarea>
        </div>
      </div>
      <div id="map" style="width:1190px;height:400px;margin-bottom:30px;"></div>
    </div>
    <div style="justify-content:center; width: 1190px;">
		<a class="btn btn-outline-success" href="<c:url value='/course/list'></c:url>" style="width: 200px;float: left;margin-left: 180px;">목록</a>
		<form action="<c:url value='/option/opList'></c:url>" method="post">
			<c:forEach items="${prlist }" var="pr">
				<input type="hidden" name="pd_num" value="${pr.pd_num}">
				<input type="hidden" name="pd_pc_num" value="${pr.pd_pc_num}">
			</c:forEach>
			<button class="btn btn-outline-success" style="width: 200px;float: left;margin-left: 10px;">옵션 선택하기</button>
		</form>
		<%-- <c:if test="${user != null && user.me_id == course.co_me_id }"> --%>
			<a class="btn btn-outline-danger btn-updateCourse" style="width: 200px;float: left;margin-left: 10px;"
				href="<c:url value='/course/update/${course.co_num}'></c:url>">게시글 수정</a>
		   
		    <form action="<c:url value='/course/delete/${course.co_num}'></c:url>" method="post">
		    	<button class="btn btn-outline-danger btn-deleteCourse" style="width:200px; margin-left:10px">게시글 삭제</button>
		    </form>
		<%-- </c:if> --%>
    </div>
  </div>
  <script>
  	if(${course.co_report} >= 10){
  		confirm('블라인드된 게시글입니다.');
  		location.replace('<c:url value="/course/list"></c:url>');
  	}
  	$('.btn-up, .btn-down').click(function(){
		//if('${user.me_id}' == ''){
		//	alert('로그인한 회원만 추천/비추천을 할 수 있습니다.');
		//	return;
		//}
		
		let li_updown = $(this).data('state');
		let co_num = '${course.co_num}';
		let url = '<c:url value="/course/like/"></c:url>'+co_num+'/' + li_updown;
		$.ajax({
	        async:true,
	        type:'get',
	        url: url,
	        dataType:"json",//서버에서 보낸 데이터의 타입. Map받으로 받을거기 때문에 json
	        success : function(data){
	        	//추천수 수정
	            $('.up_sector').text(data.cosLike.co_up);	        	
	        	//비추천수 수정
	            $('.down_sector').text(data.cosLike.co_down);
	        	//기본 추천/비추천 버튼으로 설정
	        	$('.btn-up').removeClass('btn-success')
	        		.addClass('btn-outline-success');
	        	$('.btn-down').removeClass('btn-danger')
	        		.addClass('btn-outline-danger');
	        	
	        	//state를 이용하여 알림창 및 버튼 색상 처리
 				
	        	if(data.state == 1){
	        		alert('추천했습니다.');
	        		$('.btn-up').addClass('btn-success')
	        			.removeClass('btn-outline-success');
	        	}else if(data.state == -1){
	        		alert('비추천했습니다.');
	        		$('.btn-down').addClass('btn-danger')
	        			.removeClass('btn-outline-danger');
	        	}else{
	        		if(li_updown == 1){
	        			alert('추천을 취소했습니다.')
	        		}else{
	        			alert('비추천을 취소했습니다.')
	        			
	        		}
	        	}
	        }
	    });
	});
  	$('#report-modal').click(function(){
  		let reCategory = $('#report-category').val();
		if(reCategory.trim().length  == 0){
			alert('신고 카테고리를 선택하세요.');
			$('#report-category').focus();
			return false;
		}
		let reContent = $('#report-content').val();
		if(reContent.trim().length  == 0){
			alert('신고 내용을 입력하세요.');
			$('#report-content').focus();
			return false;
		}
		let me_id = 'qwe';//'${user.me_id}';
		if(me_id == null){
			alert('로그인을 하신 후 신고하실 수 있습니다');
			return false;
		}
		let co_num = '${course.co_num}';
		let reCourse = {
			rep_me_id : me_id,
			rep_table_key : co_num,
			rep_content : reContent,
			rep_category : reCategory,
			rep_table : 'course'
		}
		ajaxPost(reCourse, '<c:url value="/course/reportCourse"></c:url>', reportSuccess);
  	});
  	
  	
  	
  	function reportSuccess(data){
  		if(data.res != 0)
  			alert('신고가 정상접수 되었습니다.');
  		if(data.reCourse.co_report > 10){
  			confirm('블라인드된 게시글입니다.');
  			location.replace('<c:url value="/course/list"></c:url>');
  		}
  		if(data.selectReport != 0){
  			alert('이미 신고를 접수하였습니다.');
  		}
  	}
  	
  	
  //ajax
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
  
  
  
  /*
  	function reorderMap() {
	  	map = new kakao.maps.Map(mapContainer, mapOption);
	  	addresses = new Array();
	  	$('.pd_street_address').each(function(item){
	  		addresses.push($(this).val())
	  	});   
	  	lines = [];
	  	markers = [];
	  	distances = [];
	      totalDistance = 0;
	  
	  	addMarkers();
  	
 	};
  
	var mapContainer = document.getElementById('map'); 
	var mapOption = { 
	  center: new kakao.maps.LatLng(33.450701, 126.570667), 
	  level: 8 
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var geocoder = new kakao.maps.services.Geocoder(); 
	var addresses = new Array();
	
	var markers = []; 
	var lines = []; 
	var distances = []; // Array to store distances between markers
	var totalDistance = 0; // Total distance between all markers

function distanceBetween(p1, p2) {
function deg2rad(deg) {
  return deg * (Math.PI/180)
}

var lat1 = p1.getLat();
var lon1 = p1.getLng();
var lat2 = p2.getLat();
var lon2 = p2.getLng();

var R = 6371; // Radius of the earth in km
var dLat = deg2rad(lat2-lat1);
var dLon = deg2rad(lon2-lon1);
var a =
  Math.sin(dLat/2) * Math.sin(dLat/2) +
  Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
  Math.sin(dLon/2) * Math.sin(dLon/2)
  ;
var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
var d = R * c; // Distance in km
return d * 1000; // Distance in m
}

async function addMarkers() { 
for (var i = 0; i < addresses.length; i++) { 
  await new Promise(function(resolve, reject) { 
    geocoder.addressSearch(addresses[i], function(result, status) { 
      if (status === kakao.maps.services.Status.OK) { 
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 

        var marker = new kakao.maps.Marker({ 
          position: coords 
        }); 

        marker.setMap(map); 
        markers.push(marker); 
        if(markers.length == 1){
	          $('.products_distance').text(0);
	          $('[name=co_total_distance]').val($('.products_distance').text(0));
        }
        if (markers.length > 1) { 
          var linePath = [markers[markers.length - 2].getPosition(), coords]; 
          var line = new kakao.maps.Polyline({ 
            path: linePath, 
            strokeWeight: 3, 
            strokeColor: '#db4040', 
            strokeOpacity: 0.7, 
            strokeStyle: 'solid' 
          }); 
          line.setMap(map); 
          lines.push(line); 

          var distance = distanceBetween(markers[markers.length - 2].getPosition(), coords);

      // Add distance information to InfoWindow
      var iwContent = '<div style="padding:5px; width: max-content;">다음주소까지 거리 : ' + distance.toFixed(0) + 'm</div>';
      var iwPosition = coords;

      var infowindow = new kakao.maps.InfoWindow({
        position: iwPosition, 
        content: iwContent 
      });

      infowindow.open(map, markers[markers.length - 1]); 

      // Save distance between markers
      distances.push(distance);
      totalDistance += distance;
      
		var course_distance = $('.products_distance').text((totalDistance / 1000).toFixed(1));
		$('[name=co_total_distance]').val($('.products_distance').text());
      
      // Add total distance to InfoWindow
      var totalIwContent = '<div style="padding:5px;">총 거리 : ' + (totalDistance / 1000).toFixed(1) + 'km</div>';

      var totalInfowindow = new kakao.maps.InfoWindow({
        position: markers[0].getPosition(), 
        content: totalIwContent 
      });

      // Open total distance InfoWindow only after all markers are added
      if (markers.length === addresses.length) {
        totalInfowindow.open(map, markers[0]);
      }
    }

    map.setCenter(coords); 
    resolve(); 
  } else { 
    reject(); 
  } 
}); 
}); 
}
}
addMarkers();
reorderMap();
*/
  </script> 
</body>
</html>
