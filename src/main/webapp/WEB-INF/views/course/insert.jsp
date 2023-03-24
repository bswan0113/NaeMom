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
  <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
  <!-- <script type="text/javascript" src="<c:url value='//dapi.kakao.com/v2/maps/sdk.js?appkey=??'></c:url>"></script> -->
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
	        <div class="total_distance">
	          <span class="distance_name">코스 총거리 : <em>56.7km</em></span>
	        </div>
	      </div>
	      <ul class="cos-list" id="sortable">
	        <li class="cos_item_origin ui-state-default">
              <div class="cos_text_origin">
	          	
	            <p>등록된 상품이 없습니다.</p>
	            
	          </div>
	        </li>
	      </ul>
	      <div class="input-group mb-3">
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
						<td>1 select * from where pr_address like %keyword%
						<td>1
						<td>1
						<td style="display:none;">1
					</tr>
			</tbody>
		</table>
	      <div class="mapIntoduce">
	        <div class="introduce_text">
	          <textarea name="co_content" id="csdesc" maxlength="2000" class="co_content" title="코스소개" placeholder="코스에 대한 설명을 작성하세요."></textarea>
	          <p class="txtNum">현재 글자수 <span class="textNum">0</span>자 / 최대 글자수 2000자</p>
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
  	
  	//코스및 코스 아이템 등록
  	
  function insertCourseItemSuccess(data){
	  alert('성공이요');
  }
  //리스트에 추가 위한 상품검색
  $('.btn_product_search').click(function(){
	  let product_search = $('.product_search').val();
	  let product = {
			  pd_title : product_search
	  }
	  ajaxPost(product, '<c:url value="/course/searchProduct"></c:url>', searchSuccess);
	  
  })
  //리스트에 추가 위한 상품검색2
  function searchSuccess(data,e){
	  str = '';
	  for(i = 0; i<data.products.length; i++){
		  str += searchProductTable(data.products[i]);
	  }
	  $('.search_productList').html(str);
	  $('.search_table').show();
	  $('.select_product').click(function(){
		  let pd_nums = $(this).find('.find_pdNum').text();
		  if(pd_nums == $('.cos_text').find('#pd_num').text()){
			  //alert('이미 등록된 상품입니다.')
			  //return;
		  }
		  ajaxPost(pd_nums, '<c:url value="/course/selectProduct"></c:url>', selectProductSuccess);
	  })
  }
  $(map)
  //선택한 상품 리스트에 추가
  function selectProductSuccess(data){
	  	str='';
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
		    '</li>';
		$('.cos-list').append(str);
		$('.product_search').val('');
		$('.search_table').hide();
		
  }
  //상품리스트 저장위한 str
  function selectProduct(data){
	 	let pr = data.selectPr;
	  	str='';
	 	str +=
	 		'<li class="cos-item ui-state-default">'+
	 			'<input type="hidden" name="pd_num[]" value="'+pr.pd_num+'">';
	 			
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
		          '<img src="https://raw.githubusercontent.com/kdw6052/naemomImg/main/food/%EC%A4%91%EA%B5%AD%EC%A7%91.jpg" alt="궁리포구">'+
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
		
      	'<span>#'+tag.hg_name+'  </span>'
      return str;
  }
  //검색했을때 상품리스트
  function searchProductTable(product){
	  str='';
	  str +=
		'<tr class="select_product">'+
			'<td>'+product.pd_pc_num+
			'<td>'+product.pd_title+
			'<td>'+product.pd_subtitle+
			'<td class="find_pdNum" style="display:none;">'+product.pd_num+
		'</tr>'
		
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
  
  
  
  
  
  
  
  
  
  
   
    //상품리스트 이동
  	$( "#sortable" ).sortable({
    	 
    	stop: function(event, ui) {
	        reorder();
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
    
  </script>
<!--  
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

  </script>-->
</body>
</html>
