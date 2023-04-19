<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		.apply_active{
			border: 1px solid #0085da; color: #0085da;
		}
		.payPrice{
			color: #333; font-size: 20px;
		}
		.payPrice_benefit{
			display: inline; margin-right: 12px;
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
				<table class="buyer_table">
					<tbody>
						<tr>
							<td class="buyer_col">이름</td>
							<td class="buyer_col2">홍길동</td>
						</tr>
						<tr>
							<td class="buyer_col">이메일</td>
							<td class="buyer_col2">qwe@naver.com</td>
						</tr>
						<tr>
							<td class="buyer_col">휴대폰 번호</td>
							<td class="buyer_col2">010-1234-5678</td>
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
						<td class="user_td">홍길동</td>
					</tr>
					<tr>
						<td class="user_th">이메일</td>
						<td class="user_td">qwe@naver.com</td>
					</tr>
					<tr>
						<td class="user_th">휴대폰 번호</td>
						<td class="user_td">010-1234-5678</td>
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
						<div class="item_option" style="margin-left: 30px;">
							<span>상품 옵션 / 수량</span>
						</div>
						<div class="item_date" style="margin-right: 25px;">
							<p>예약날짜</p>
						</div>
					</div>
					<div class="item_list">
						<div class="inner_item_list">
							<div class="product_name">
								<p>상품이름입니다.</p>
							</div>
							<div class="product_option">
								<span>상품 옵션입니다.</span>/
								<span>수량입니다.</span>
							</div>
							<div class="product_date">
								<p>예약날짜입니다.</p>
							</div>
						</div>
						<div class="inner_item_list">
							<div class="product_name">
								<p>상품이름입니다.</p>
							</div>
							<div class="product_option">
								<span>상품 옵션입니다.</span>/
								<span>수량입니다.</span>
							</div>
							<div class="product_date">
								<p>예약날짜입니다.</p>
							</div>
						</div>
						<div class="inner_item_list">
							<div class="product_name">
								<p>상품이름입니다.</p>
							</div>
							<div class="product_option">
								<span>상품 옵션입니다.</span>/
								<span>수량입니다.</span>
							</div>
							<div class="product_date">
								<p>예약날짜입니다.</p>
							</div>
						</div>
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
										<strong class="value">0</strong>
										<span class="unit">원</span>
									</span>
								</span>
								<button class="insert_mile_toggle button">마일리지 사용하기</button>
							</div>
							<div class="mile_insert">
								<div class="insert">
									<input type="text" class="using" value placeholder="0" title="사용할 마일리지">
									<span class="unit">원</span>
									<span class="delimiter">|</span>
									<input class type="checkbox" id="mileAllUsing">
									<label for="mileAllUsing" class>모두사용</label>
								</div>
								<div class="button_box">
									<button class="button apply_active">마일리지 적용</button>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="pay_title">총결제가격</th>
						<td>
							<div class="payPrice">
								<strong class="price">
									<span id="totalPayPrice">1531</span>
									<span class="unit">원</span>
								</strong>
								<div class="payPrice_benefit">
									<span class="txt_savingMile" style="font-weight: 400;">
										<span>
											마일리지적립 예정 
											<strong>15</strong>
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
							<div class="pay_box" id="payBox">
								<div class="pay_type_selector">
									<div class="type_selector_list">
										<ul id="payTypeList">
											<li class="type_selector_li">
												<input type="radio" class="type_selector_radio" name="payType" id="payType1">
												<label for="payType1" class="type_selector_label" style="font-weight: normal;">
													<span class="type_selector_label_txt">계좌이체</span>
												</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
	
	</div>
   	<script>
  		
  
  	</script>
  
 
</body>
</html>