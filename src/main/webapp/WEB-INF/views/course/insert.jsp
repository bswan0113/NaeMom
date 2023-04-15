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
  <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script> -->
  <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
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
	  .cos-list .cos_item_origin{
	  	position: relative;
	    padding: 20px 0;
	    margin-bottom: 30px;
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
	    margin-top:30px
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
  </style>
</head>
<body>
  <div class="contents">
  
  	<form action="<c:url value='/course/insert'></c:url>" method="post">
	    <div class="form-group">
	      <label class="cos-title-name">코스제목</label>
	      <input type="text" class="form-control mt-4 mb-3" name="co_title">
	    </div>
	    <div class="cos_section">
	      <div class="cos-type1">
	        <span>
	          <label for="category">코스 테마</label>
	          <select id="category" title="코스 테마 선택" name="co_cc_category_num">
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
	          <label for="schedule">코스 일정</label>
	          <select id="schedule" title="코스 일정 선택" name="co_cs_schedule_num">
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
	          <span class="totalCourseList">0</span>
	          건
	        </strong>
	        <div class="total_distance" >
	        	<input type="hidden" name="co_total_distance" value="0">
	          	<span class="distance_name">코스 총거리 : <em class="products_distance">0</em> km</span>
	        </div>
	      </div>
	      <ul class="cos-list" id="sortable">
	        <li class="cos_item_origin ui-state-default">
              <div class="cos_text_origin">
	          	
	            <p>등록된 상품이 없습니다.</p>
	            
	          </div>
	        </li>
	      </ul>
	      <div class="input-group">
	        <input type="text" class="form-control product_search" placeholder="상품검색" name="search">
	        <div class="input-group-append">
	          <button class="btn btn-success btn_product_search" type="button" >검색</button>
	        </div>
	      </div>
	      <table class="table table-hover search_table">
			<thead>
				<tr>
					<th style="width:200px;">상품 카테고리</th>
					<th style="width:200px;">상품</th>
					<th>상세</th>
				</tr>
			</thead>
			<tbody class="search_productList">
					<tr class="select_product">
						<td>1
						<td>1
						<td>1
						<td style="display:none;">1
					</tr>
			</tbody>
			
		</table>
	      <div class="mapIntoduce">
	        <div class="introduce_text form-group">
	          <label class="cos-title-name mb-3">코스설명</label>
	          <textarea name="co_content" id="text_box" maxlength="200" class="co_content" title="코스소개" placeholder="코스에 대한 설명을 작성하세요."></textarea>
	          <p class="txtNum">현재 글자수 <span class="textNum">0</span>자 / 최대 글자수 200자</p>
	        </div>
	      </div>
	      <div id="map" style="width:1190px;height:400px;"></div>
	    </div>
	    <button class="btn btn-outline-success btn-insertCourse col-12 mt-3">게시글 작성</button>
	</form>
  </div>
  <script>
  
  //상품검색 리스트 가리기
  $('.search_table').hide();
  //저장전 유효성 검사
  $('form').submit(function(){
		
		let co_title = $('[name=co_title]').val();
		if(co_title.trim().length  == 0){
			alert('코스제목을 작성하세요.');
			$('[name=co_title]').focus();
			return false;
		}
		let co_cc_category = $('[name=co_cc_category]').val();
		if(co_cc_category  == 0){
			alert('카테고리를 선택하세요.');
			$('[name=co_cc_category]').focus();
			return false;
		}
		let co_cs_schedule = $('[name=co__cs_schedule]').val();
		if(co_cs_schedule  == 0){
			alert('일정을 선택하세요.');
			$('[name=co_cs_schedule]').focus();
			return false;
		}
		let listNum = $('#pd_num').text();
		if(listNum == ''){
			alert('코스에 상품이 등록되지 않았습니다.');
			return false;
		}
		let co_content = $('[name=co_content]').val();
		if(co_content.trim().length  == 0 ){
			alert('내용을 입력하세요.');
			$('[name=co_content]').focus();
			return false;
		}
		
	});
	//상품리스트 삭제 버튼 클릭이벤트
	
		$(document).on('click','.btn_remove_list',function(){
			$(this).parent().remove();
	        if($('.numbering').length){
	          	$('.numbering').each(function(i,box){
	            	$(box).text(i + 1);
	          	})
	       		let lastNum = $('.numbering').last().text();
				lastNum = ''+Number(lastNum);
				$('.totalCourseList').text(lastNum);
	        }else{
	        	$('.totalCourseList').text('0');
	        	$('.cos_item_origin').show();
	        }
	        //reorderMap();
		});
		
	
  	
  //리스트에 추가 위한 상품검색
  $('.btn_product_search').click(function(){
	  let product_search = $('.product_search').val();
	  let product = {
			  pd_title : product_search
	  }
	  ajaxPost(product, '<c:url value="/course/searchProduct"></c:url>', searchSuccess);
	  
  })
  //검색한 상품 검색리스트
  function searchSuccess(data,e){
	  str = '';
	  if(data.products == ''){
		  alert('일치하는 상품이 없습니다.')
		  return;
	  }
	  for(i = 0; i<data.products.length; i++){
		  for(j=0; j<data.pdCategory.length;j++){
		  	str += searchProductTable(data.products[i],data.pdCategory[j]);
		  }
	  }
	  $('.search_productList').html(str);
	  $('.search_table').show();
	  $('.select_product').click(function(){
		  let pd_nums = $(this).find('.find_pdNum').text();
		  
			    
		  if(!checkPd_num_list(pd_nums)){
			  $('.product_search').val('');
			  $('.search_table').hide();
			  alert('이미 등록된 상품입니다.');
			  return;
		  }
		  
		  ajaxPost(pd_nums, '<c:url value="/course/selectProduct"></c:url>', selectProductSuccess);
	  })
  }
  //리스트내에 선택한 상품과 같은 번호가 있는지 체크
  function checkPd_num_list(pd_nums){
	  let returnNow = false;
	  $('.cos-item').each(function(i, box) {
          let checkPd_num = $(this).find('#pd_num').text();
          if(Number(pd_nums) == Number(checkPd_num)){
				returnNow = true;
				return false;
		    }
	  });
	  if(returnNow){
		  return false;
	  }
	  return true;
  }
  //선택한 상품 리스트에 추가
  function selectProductSuccess(data){
	  	str='';
	  	let totalCourseList = $('.totalCourseList').text();
	  	totalCourseList = Number(totalCourseList)+1
	  	if(totalCourseList > 10){
			alert('상품은 최대 10개만 등록가능합니다.');
			return;			
		}
	  	str += selectProduct(data);
	  	$('.cos_item_origin').hide();
		for(i = 0; i<data.tags.length; i++){
			if(data.selectPr.pd_num == data.tags[i].hg_pd_num){
			  str += selectProductHashTag(data.tags[i]);
				
			}
		  }
		str+=
					'</p>'+
			      '</div>'+
			      '<button type="button" class="btn btn-outline-danger btn_remove_list">X</button>'+
		    '</li>';
		$('.cos-list').append(str);
		$('.product_search').val('');
		$('.search_table').hide();
		//reorderMap()
		
  }
 
  //상품리스트 저장위한 str
  function selectProduct(data){
	 	let pr = data.selectPr;
	 	let fi = data.file;
	  	str='';
	 	str +=
	 		'<li class="cos-item ui-state-default">'+
	 			'<input type="hidden" name="pd_num[]" value="'+pr.pd_num+'">'+
	 			'<input type="hidden" class="pd_street_address" value="'+pr.pd_street_address+'">';
	 			if('.numbering'.length){
					let lastNum = $('.numbering').last().text();
					lastNum = Number(lastNum)+1;
					$('.totalCourseList').text(lastNum);
			 		str+=
			 			'<em class="numbering">'+lastNum+'</em>';
					
				}
	 			str+=
		      '<div class="cos-photo">'+
		        '<a href="#">'+
		          '<img src="<c:url value="/download'+fi.fi_name+'"></c:url>" alt="궁리포구">'+
		        '</a>'+
		      '</div>'+
		      '<div class="cos_text">'+
		      	'<p style="display:none" id="pd_num">'+pr.pd_num+'</p>'+
		        '<div class="title-area clearfix">'+
		          '<a href="#" id="pd_title">'+pr.pd_title+'</a>'+
		          '<p id="pd_subtitle">'+pr.pd_subtitle+'</p>'+
		        '</div>'+
		        '<p class="sub_content" id="pd_content">'+pr.pd_content+'</p>'+
		        '<p class="tag" id="hg_pd_num">'
		       
		        
		        
	    return str;
  }
  function selectProductHashTag(tag){
	  str='';
	  str +=
		
      	'<span>'+tag.hg_name+'  </span>'
      return str;
  }
  //검색했을때 상품리스트
  function searchProductTable(product,pdCategory){
	  str='';
	  if(product.pd_pc_num == pdCategory.pc_num){
		  let pd_pc_name = pdCategory.pc_category
		  str +=
			'<tr class="select_product">'+
				'<td>'+pd_pc_name+
				'<td>'+product.pd_title+
				'<td>'+product.pd_subtitle+
				'<td class="find_pdNum" style="display:none;">'+product.pd_num+
			'</tr>'
	  }
		
	return str;
  };
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
  $('.co_content').keyup(function (e) {
		let content = $(this).val();
		
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textNum').text('0');
	    } else {
	    	$('.textNum').text(content.length);
	    }
	    
	    // 글자수 제한
	    if (content.length > 199) {
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	    };
	});
  
  
  
  
  
  
  
  
  
   
    //상품리스트 이동
  	$( "#sortable" ).sortable({
    	 
    	stop: function(event, ui) {
	        reorder();
	        //reorderMap();
    		let productList=new Array(10);
    		$('.cos-item').each(function(i, box) {
	            let listNum = $(this).find('.numbering');
	            let pd_num = listNum.siblings('.cos_text').find('#pd_num').text();
	            productList[i] = pd_num;
            
    		});
    	}
    });
    //상품리스트 이동했을 때 번호 재정렬
    function reorder() {
      $('.numbering').each(function(i, box) {
        $(box).text(i + 1);
      });
    }
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
    
	/* var mapContainer = document.getElementById('map'); 
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

addMarkers(); */
 
  </script>
</body>
</html>
