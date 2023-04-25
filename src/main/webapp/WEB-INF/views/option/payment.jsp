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
	<!-- <script src="https://js.bootpay.co.kr/bootpay-4.2.9.min.js" type="application/javascript"></script> -->
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.6.min.js" type="application/javascript"></script>
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
	    table{
			border-spacing: 0; border-collapse: collapse; font-size: 100%;
		}
	    .clearfix::after{
	      content: ''; clear: both; display: block; 
	    }
	    a{
	      text-decoration: none;
	    }
		button{
			background: 0; cursor: pointer;
		}
		th{
			display: table-cell;
		}
		div{
			margin: 0; padding: 0; font-size: 13px; color: #333;
		}
		p{
			margin:0;
		}
	    .contents {
		    width: 1190px;
		    margin: 0 auto;
		    padding: 0 20px 27px 20px;
		    height:auto;
		  }
	    .option_item{
	      position: relative; padding: 20px 0; border-bottom: 1px solid #e6e6e6;
		    border-top: 1px solid #e6e6e6;
	    }
	    .option_title{
	      position: absolute; font-size: 30px; font-weight: 700;
	    }
	    .order_step{
	    	float:right; margin-top:20px;
	    }
	    .title_box{
	    	height: 70px; overflow: hidden; border-bottom: 3px solid #777;
	    }
	    .order_step > em{
	    	font-weight:700; color:#346aff; font-style:normal;
	    }
		/*구매자 정보*/
		.buyer_inner_box{
			margin-top: 30px;
		}
		.buyer_title{
			padding-left: 2px; margin-bottom: 8px; font-size: 20px; font-weight: 700; color: #333;
		}
		.buyer_table{
			width: 100%; border-top: 2px solid #cecece;
		}
		.buyer_col,.user_th{
			width: 104px; border: solid #e4e4e4; border-width: 0 1px 1px 0; padding: 7px 10px 7px 15px;
    		text-align: right; background: #f4f4f4; font-weight: 500;
		}
		.buyer_col2,.user_td{
			border-bottom: 1px solid #e4e4e4; padding: 10px 16px;
		}
		.user_title{
			padding-left: 2px; margin: 30px 0 8px; text-align: left; font-size: 20px; font-weight: 700;
		}
		.btn_buyer{
			padding: 4px 8px; border: 1px solid #999; color: #333; border-radius: 2px; box-shadow: 0 -2px 0 rgba(0,0,0,.1) inset;
    		font-size: 11px; vertical-align: bottom; margin-left: 5px;
		}
		.button{
			padding: 4px 8px; border: 1px solid #999; color: #333; border-radius: 2px; box-shadow: 0 -2px 0 rgba(0,0,0,.1) inset;
    		font-size: 11px;
		}
		.user_table{
			border-top: 2px solid #cecece; width: 100%;
		}
		.item_content_box{
			position: relative;
		}
		.item_list_info{
			margin-top: 8px;
		}
		.item_title,.price_title{
			padding-left: 2px; margin: 30px 0 8px; text-align: left; font-size: 20px; font-weight: 700;
		}
		.item_list_box{
			border: 1px solid #ccc; border-radius: 3px;
		}
		.item_menu{
			padding: 10px 15px 10px 20px!important; line-height: 26px!important; background-color: #eee;
		}
		.item_name{
			float: left; line-height: 26px; font-size: 15px;
		}
		.item_list{
			overflow: hidden; zoom: 1; margin-left: 0; margin-right: 0; padding: 0 15px 0 20px;
		}
		.inner_item_list{
			position: relative; zoom: 1; overflow: hidden; padding-top: 8px; margin-bottom: 5px; color: #333;
			border-bottom: 1px solid #f6f6f6; padding-top: 10px; padding-bottom: 10px;
		}
		.product_name{
			float: left; width: 50%; padding-right: 40px; font-size: 12px; color: #555;
		}
		.product_name >p{
			font-size: 16px; color: #111;
		}
		.product_option,.item_option{
			position: absolute; left: 50%; width: 34%; padding: 0; border: 0; font-size: 12px; clear: both; float: left;
		}
		.product_date,.item_date{
			float: right; text-align: right; font-size: 14px; color: #888;
		}
		.pay_price{
			width: 100%; border-top: 2px solid #cecece;
		}
		.pay_price .pay_title{
			vertical-align: top; text-align: right; border-right: 1px solid #e4e4e4; background: #f4f4f4;
		}
		.pay_price th{
			padding: 10px 15px 0 0; border-bottom: 1px solid #e4e4e4;
		}
		.pay_price td{
			padding: 10px 0 0 0; border-bottom: 1px solid #e4e4e4;
		}
		.pay_price .price{
			display: inline-block; width: 100px; padding-left: 15px; padding-bottom: 10px;
		}
		#totalPrice{
			color: #333;
		}
		.pay_price .price .unit{
			color: #111; font-size: 13px; font-weight: 400;
		}
		.pay_price .user_mile{
			display: inline-block; padding-right: 10px;
		}
		.mile_insert{
			padding: 10px 0 10px 115px; border-top: 1px solid #eee; background-color: #f8f8f8;
		}
		.pay_price input[type=text]{
			height: 22px; padding: 0 0 0 5px; border: 1px solid #ddd; font-size: 15px; color: #333;
		}
		.mile_insert .delimiter{
			display: inline-block; padding: 0 5px; color: #aaa;
		}
		label{
			cursor: pointer;
		}
		.mile_insert .button_box{
			margin-top: 10px;
		}
		.mile_active{
			border: 1px solid #0085da; color: #0085da;
		}
		.payPrice{
			color: #333; font-size: 20px;
		}
		.payPrice_benefit{
			display: inline; margin-right: 12px;
		}
		.type_selector{
			width: 845px; position: relative; padding-top: 4px;
		}
		.type_selector_li{
			display: block; float: left; margin-right: 9px; padding: 0 0 0 2px; font-size: 12px; line-height: 39px;
    		letter-spacing: -1px;
		}
		.type_selector_radio{
			margin-right: 1px; vertical-align: -1px;
		}
		.type_selector_label_txt{
			display: inline-block; line-height: 39px; vertical-align: middle;
		}
		.btn_box{
			text-align:center; margin-top:30px;
		}
		.paymentBtn{
			width:260px; height:60px; display:inline-block; background: #0085da; font-size: 30px;
    		color: #fff; border: 0; border-radius: 5px;
		}
  </style>
</head>
<body>
	<div class="contents clearfix">
		<div class="title_box clearfix">
	    	<label class="option_title">주문/결제</label>
	    	<span class="order_step">장바구니><em>주문결제 ></em>결제완료</span>
		</div>
		<div class="buyer_box">
			<div class="buyer_inner_box">
				<h2 class="buyer_title"> 구매자 정보 </h2>
				<input type="hidden" value="${member.me_id }" class="buyer_id">
				<table class="buyer_table">
					<tbody>
						<tr>
							<td class="buyer_col">이름</td>
							<td class="buyer_col2 buyer_name">${member.me_name }</td>
						</tr>
						<tr>
							<td class="buyer_col">이메일</td>
							<td class="buyer_col2 buyer_email">${member.me_ma_email }</td>
						</tr>
						<tr>
							<td class="buyer_col">휴대폰 번호</td>
							<td class="buyer_col2 buyer_phone">${member.me_phone }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="user_box">
			<h2 class="user_title">이용자 정보
				<button class="btn_buyer button">구매자와 동일</button>
			</h2>
			<table class="user_table">
				<tbody>
					<tr>
						<th class="user_th">이름</th>
						<td class="user_td">
							<input type="text" class="insertName">
						</td>
					</tr>
					<tr>
						<td class="user_th">이메일</td>
						<td class="user_td">
							<input type="text" class="insertEmail">
						</td>
					</tr>
					<tr>
						<td class="user_th">휴대폰 번호</td>
						<td class="user_td">
							<input type="text" class="insertPhone">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="item_content_box">
			<div class="item_list_info">
				<h2 class="item_title">상품리스트</h2>
				<div class="item_list_box">
					<div class="item_menu clearfix">
						<span class="item_name">상품명</span>
						<div class="item_option">
							<span>상품 옵션 / 수량</span>
						</div>
						<div class="item_date">
							<span>예약날짜</span>
						</div>
					</div>
					<div class="item_list">
						<c:forEach items="${basket }" var="basket" varStatus="i" begin="0" end="${basket.size() }">
							<c:forEach items="${prList }" var="pr" varStatus="j" begin="0" end="${prList.size() }">
								<c:if test="${i.index == j.index }">
									<c:if test="${basket.travel.pc_category =='여행지' }">
										<div class="inner_item_list">
											<div class="product_name">
												<p>${pr.pd_title }</p>
											</div>
											<input type="hidden" value="${basket.sb_price }" class="sb_price">
											<input type="hidden" value="${basket.sb_num }" class="sb_num" name="sb_num">
											<div class="product_option">
												<span>${basket.travel.lo_age }</span> / 
												<span>${basket.sb_amount } 개</span>
											</div>
											<div class="product_date">
												<p>${basket.sb_date }</p>
											</div>
										</div>
									</c:if>
									<c:if test="${basket.food.pc_category =='음식점' }">
										<div class="inner_item_list">
											<div class="product_name">
												<p>${pr.pd_title }</p>
											</div>
											<input type="hidden" value="${basket.sb_price }" class="sb_price">
											<input type="hidden" value="${basket.sb_num }" class="sb_num" name="sb_num">
											<div class="product_option">
												<span>${basket.food.reo_name }</span> / 
												<span>${basket.sb_amount } 개</span>
											</div>
											<div class="product_date">
												<p>${basket.sb_date }</p>
											</div>
										</div>
									</c:if>
									<c:if test="${basket.home.pc_category =='숙박' }">
										<div class="inner_item_list">
											<div class="product_name">
												<p>${pr.pd_title }</p>
											</div>
											<input type="hidden" value="${basket.sb_price }" class="sb_price">
											<input type="hidden" value="${basket.sb_num }" class="sb_num" name="sb_num">
											<div class="product_option">
												<span>${basket.home.ao_name }</span> / 
												<span>${basket.sb_amount } 개</span>
											</div>
											<div class="product_date">
												<p>${basket.sb_date }</p>
											</div>
										</div>
									</c:if>
									<c:if test="${basket.festival.pc_category =='축제' }">
										<div class="inner_item_list">
											<div class="product_name">
												<p>${pr.pd_title }</p>
											</div>
											<input type="hidden" value="${basket.sb_price }" class="sb_price">
											<input type="hidden" value="${basket.sb_num }" class="sb_num" name="sb_num">
											<div class="product_option">
												<span>${basket.festival.fo_age }</span> / 
												<span>${basket.sb_amount } 개</span>
											</div>
											<div class="product_date">
												<p>${basket.sb_date }</p>
											</div>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="price_section" style="margin-top: 30px;">
			<h2 class="price_title">결제정보</h2>
			<table class="pay_price">
				<colgroup>
					<col width="144">
				</colgroup>
				<tbody>
					<tr class="pay_allPrice">
						<th class="pay_title">총상품가격</th>
						<td>
							<div class="order_allPrice">
								<strong class="price">
									<span id="totalPrice">1531</span>
									<span class="unit">원</span>
								</strong>
							</div>
						</td>
					</tr>
					<tr class="pay_mileage">
						<th class="pay_title">마일리지</th>
						<td style="padding-top:0;">
							<div>
								<strong class="price" style="padding-top: 10px;">
									<span class="use_mile">0</span>
									<span class="unit">원</span>
								</strong>
								<span class="user_mile">
									<span class="usable">
										보유 : 
										<strong class="possible_mile">${member.me_mileage}</strong>
										<span class="unit">원</span>
									</span>
								</span>
								<button class="insert_mile_toggle button" style="<c:if test="${member.me_mileage == 0 }">display:none</c:if>">마일리지 사용하기</button>
							</div>
							<div class="mile_insert" style="display:none">
								<div class="insert">
									<input type="text" class="using_mile" placeholder="0" title="사용할 마일리지">
									<span class="unit">원</span>
									<span class="delimiter">|</span>
									<input type="checkbox" id="mileAllUsing">
									<label for="mileAllUsing">모두사용</label>
								</div>
								<div class="button_box">
									<button class="button mile_active">마일리지 적용</button>
									<p class="validate_massage ml-2" style="display:inline">* 마일리지는 1000원 이상부터 사용가능합니다.</p>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="pay_title">총결제가격</th>
						<td>
							<div class="payPrice">
								<strong class="price" style="width:200px;">
									<span id="totalPayPrice">1531</span>
									<span class="unit">원</span>
								</strong>
								<div class="payPrice_benefit">
									<span class="txt_savingMile" style="font-weight: 400;">
										<span>
											마일리지적립 예정 
											<strong class="addMile">15</strong>
											원
										</span>
									</span>
								</div>
							</div>
						</td>
					</tr>
					<tr id="paySel" class="payType_sector">
						<th class="pay_title">결제방법</th>
						<td class="payType" style="padding:0 15px;">
							<div class="pay_box" id="payBox" style="width: 845px;">
								<ul id="payTypeList" class="type_selector">
									<li class="type_selector_li">
										<input type="radio" class="type_selector_radio" name="payType" id="payType1" value="계좌이체">
										<label for="payType1" class="type_selector_label type_selector_label_bank" style="font-weight: normal; position: relative;">
											<span class="type_selector_label_txt">계좌이체</span>
										</label>
									</li>
									<li class="type_selector_li">
										<input type="radio" class="type_selector_radio" name="payType" id="payType2" value="card">
										<label for="payType2" class="type_selector_label type_selector_card" style="font-weight: normal;">
											<span class="type_selector_label_txt">신용/체크카드</span>
										</label>
									</li>
									<li class="type_selector_li">
										<input type="radio" class="type_selector_radio" name="payType" id="payType3" value="kakao">
										<label for="payType3" class="type_selector_label type_selector_kakao" style="font-weight: normal;">
											<span class="type_selector_label_txt">카카오페이</span>
										</label>
									</li>
									<li class="type_selector_li">
										<input type="radio" class="type_selector_radio" name="payType" id="payType3" value="npay">
										<label for="payType3" class="type_selector_label type_selector_kakao" style="font-weight: normal;">
											<span class="type_selector_label_txt">네이버페이</span>
										</label>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_box">
			<form action="/option/completeBuy" id="completeBuy" method="post">
				<input type="hidden" name="bl_num">
					<button type="button" id="paymentBtn" class="paymentBtn">결제하기</button>
				</form>
		</div>
	
	</div>
   	<script>
   		var count = 0;
   		var pd_title = '';
   		//총 상품가격
	   	$(function(){
	   		$('.inner_item_list').each(function(){
	  			count++;
				if(count ==1){
					pd_title = $(this).find('.product_name').find('p').text();
				}	   			
	   		})
	 		let totalPrice = 0;
	  		$('.sb_price').each(function(){
	  			let price = Number($(this).val());
	  			totalPrice = totalPrice + price;
	  		})
	  		$('#totalPrice').text(totalPrice)
		   	totalPayPrice();
	   	})
   		//구매자와 동일버튼 이벤트
   		$('.btn_buyer').click(function(){
   			let user_name = $('.buyer_name').text();
   			let user_email = $('.buyer_email').text();
   			let user_phone = $('.buyer_phone').text();
   			$('.insertName').val(user_name);
   			$('.insertEmail').val(user_email);
   			$('.insertPhone').val(user_phone);
   		})
   		//마일리지 입력란 토글
   		$('.insert_mile_toggle').click(function(){
   			$('.mile_insert').toggle();
   			$('input[name=payType]:checked').each(function(){
   				console.log($(this).val())
   			})
   			
   		})
   		function dateString(){
	   		var today = new Date();

	   		var year = today.getFullYear();
	   		var month = ('0' + (today.getMonth() + 1)).slice(-2);
	   		var day = ('0' + today.getDate()).slice(-2);
	   		var hours = ('0' + today.getHours()).slice(-2); 
	   		var minutes = ('0' + today.getMinutes()).slice(-2);
	   		var seconds = ('0' + today.getSeconds()).slice(-2); 


	   		var dateString = year + month  + day + hours + minutes + seconds;
	   		return dateString;
   		}
   		//마일리지 전체사용
   		$('#mileAllUsing ').click(function(){
   			if($('#mileAllUsing').is(':checked')){
  				$('.using_mile').val($('.possible_mile').text());
   			}else{
   				$('.using_mile').val(0);
   			}
   		})
   		//마일리지 숫자만 입력하게 및 초과마일리지 불가능
   		$('.using_mile').keyup(function(){
   			let str = $('.using_mile').val();
   			let mile = $('.possible_mile').text();
			let numberCheck = /^[0-9\b]+$/;
			if (str.length === 0) { // 입력된 값이 없는 경우
			    return; // 정규표현식 검사를 하지 않습니다.
			}
			if(!numberCheck.test(str)){
				alert('숫자만 입력가능합니다.');
				$('.using_mile').val('');
			}
			str = Number(str);
			mile = Number(mile);
			if(str > mile){
				alert('사용가능한 마일리지를 초과했습니다.');
				$('.using_mile').val('');
			}
			
		})
		//마일리지 적용
		$('.mile_active').click(function(){
			let mile = $('.using_mile').val();
			if(Number(mile)>=1000){
				$('.use_mile').text(mile);
				totalPayPrice();
			}else if(Number(mile) == 0){
				$('.use_mile').text(0);
				totalPayPrice();
			}else{
				alert('마일리지는 1000원 이상일때 사용가능합니다.')
			}
		})
		//총결제가격
		function totalPayPrice(){
   			let price = $('#totalPrice').text();
   			let use_mile = $('.use_mile').text();
   			let totalPayPrice = Number(price) - Number(use_mile);
   			let addMile = totalPayPrice/100;
   			addMile = Math.floor(addMile);
   			$('#totalPayPrice').text(totalPayPrice);
   			$('.addMile').text(addMile);
   		}
   		//결제
   		$('.paymentBtn').click(function(){
   			let price = Number($('#totalPayPrice').text());
   			let id = $('.buyer_id').val();
   			let date = dateString();
   			let order_id = id+date;
   			let order_name = pd_title+' 외 ' + String(count)+'건';
   			let method = '';
   			$('input[name=payType]:checked').each(function(){
   				method = $(this).val();
   			})
   			let use_mile = $('.use_mile').text();
   			let addMile = $('.addMile').text();
   			//결제전 insert buy_list
   			let sb_num = []
   			$('[name=sb_num]').each(function(){
   				sb_num.push($(this).val());
   			})
   			let payData ={
   				order_id : order_id,
   				itemState : '결제중',
   				price : price,
   				order_name : order_name,
   				use_mile : use_mile,
   				add_mile : addMile,
   				sb_num : sb_num
   			}
   			//결제전 buy_list등록
   			ajaxPostString(payData, '<c:url value="/option/insertBuyList"></c:url>', insertSuccess);
   			var orderNum = '';
   			const response = BootPay.request({
   			  "application_id": "64424e90922c3400236cdc6a",
   			  "price": "1000",
   			  "name": order_name,
   			  "order_id": order_id,
   			  "pg": "nicepay",
   			  "method": "kakao",
   			  "tax_free": 0,   			  
   			  "extra": {
   			    "open_type": "iframe",
   			    "card_quota": "0,2,3",
   			    "escrow": false,
   			  	"display_success_result":true,
   			 	"display_error_result" : true
   			  }
   			}).done(function(data){//결제완료
   				console.log(data)
   				//결제검증
   				ajaxPostString(data, '<c:url value="/option/bootpay_confirm"></c:url>', paySuccess);
   			}).error(function (data) {
   				//결제 진행시 에러가 발생하면 수행됩니다.
   				ajaxPostString(orderNum, '<c:url value="/option/deleteBuyList"></c:url>', deleteSuccess);
   			})
   		})
   		function insertSuccess(data){
   			orderNum = data;
   		}
   		function paySuccess(data){
   			console.log(orderNum)
   			if(data == "NO"){
   				alert('결제에 실패했습니다.');
   				ajaxPostString(orderNum, '<c:url value="/option/deleteBuyList"></c:url>', deleteSuccess);
   			}else if(data == "OK"){
   				alert('결제에 성공했습니다.')
   				ajaxPostString(orderNum, '<c:url value="/option/updateBuyList"></c:url>', updateSuccess);
   			}
   		}
   		
   		function deleteSuccess(data){
   			console.log(data)
   		}
   		function updateSuccess(data){
   			console.log(data)
   			if(data == "NO")
   				alert("예상치 못한 오류 발생");
   			
   			$('[name=bl_num]').val(data);
   			$('#completeBuy').submit();
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
		function ajaxPostString(obj, url, successFunction){
			$.ajax({
				async:false,
				type: 'POST',
				data: JSON.stringify(obj),
				url: url,
				contentType:"application/json; charset=UTF-8",
				success : successFunction
			});
		}
   	</script>
  
 
</body>
</html>
  
  	