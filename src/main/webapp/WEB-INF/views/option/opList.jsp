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
  <title>optionList</title>
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
	    .option_list{
	      float: left; border: 1px solid black; width: 750px; padding: 20px;
	      margin-top: 100px; border-radius: 10px;
	    }
	    .option_item{
	      position: relative; padding: 20px 0; border-bottom: 1px solid #e6e6e6;
		    border-top: 1px solid #e6e6e6;
	    }
			.select_item{
				position: absolute; right: 20px; top: 20px;
			}
	    .option_title{
	      position: absolute; font-size: 30px; font-weight: 700;
	    }
		.option_photo{
			position: absolute; height:195px;
		}
		.option_item_img{
			width: 200px; height: 100%;
		}
		.option_select_box{
			min-height: 164px; padding-left: 240px; padding-right: 20px;
		}
		.option_select_box1,.option_select_box2{
			margin-top: 10px;
		}
		.option_select{
			margin-left: 10px; width: 150px; height: 25px;

		}
		.option_detail{
			display: block;
			overflow: hidden;
	    width: 490px;
	    text-overflow: ellipsis;
	    white-space: nowrap;
		}

	    .select_product_box{
	      float: right; border: 1px solid black; width: 380px; padding: 20px;
	      margin-top: 100px; border-radius: 10px;
	    }
	    .addOrder{
	      text-align: center; width: 100%; font-size: 20px; height: 50px; margin-top: 20px;
	    }
	   
	    .product_item{
	      margin-bottom: 10px; border: 1px; border-radius: 10px; background-color: antiquewhite;
				position: relative;
	    }
	    .no_product_item{
	    	margin-bottom: 10px; border: 1px; border-radius: 10px; background-color: antiquewhite;
				position: relative; text-align:center;
	    }
		.close_list{
			position: absolute;
			top: 5px;
			right: 5px;
			width: 20px;
			height: 20px;
			padding: 0;
			line-height: 0;
		}
		.overStop{
		    font-size: 30px; font-weight: 500; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;
   			width: 380px;
		}

  </style>
</head>
<body>
	<div class="contents clearfix">
    	<label class="option_title">옵션 선택</label>
    	<ul class="option_list">
    		<c:forEach items="${pdList }" var="list" varStatus="vs" begin="0" end="${pdList.size() }">
    		<c:if test="${list.pd_pc_num ==2 }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi">
    	  	  			<c:if test="${fi.fi_table_key == list.pd_num}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        			<input type="hidden" name="pr_category" value="${list.pd_pc_num }">
        			<input type="hidden" name="pr_title" value="${list.pd_title }">
        			<input type="hidden" name="pr_num" value="${list.pd_num }">
					<label class="overStop">${list.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">음식점</span></label>
					<button class="select_item btn btn-outline-success" type="button">선택</button>
					<div class="option_select_box1">
						<label>메뉴 : </label>
						<select class="option_select menu_food_select" name="" id="menu_food_select" onchange="select_menu(this)">
							<option value="0" selected>선택</option>
							<c:forEach items="${foodList }" var="food">
								<c:if test="${food.reo_pd_num == list.pd_num }">
									<option value="${food.reo_num }">${food.reo_name }</option>
								</c:if>
							</c:forEach>
						</select>
						<label class="ml-1">날짜 : </label>
						<input type="text" id="<c:if test="${vs.index < pdList.size() }">datepicker${vs.index+1}</c:if>" class="option_date" style="height: 20px;">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<select class="option_select amount_food_select" name="" id="amount_food_select" onchange="select_amount(this)" style="width:100px">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						<label>시간 : </label>
						<select class="option_select select_food_time" style="width : 80px">
							<option value="0">선택</option>
							<option value="12" class="select_lunch">12시</option>
							<option value="6" class="select_dinner">6시</option>
						</select>
						<label class="ml-1">가격 : </label>
						<span class="select_price">0</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">상품 상세 설명</span>
					</div>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.pd_pc_num ==4 }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi">
    	  	  			<c:if test="${fi.fi_table_key == list.pd_num}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        			<input type="hidden" name="pr_category" value="${list.pd_pc_num }">
        			<input type="hidden" name="pr_title" value="${list.pd_title}">
        			<input type="hidden" name="pr_num" value="${list.pd_num }">
					<label class="overStop">${list.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">축제</span></label>
					<button class="select_item btn btn-outline-success" type="button">선택</button>
					<div class="option_select_box1">
						<label>연령 : </label>
						<select class="option_select menu_festival_select" name="" id="menu_festival_select" onchange="select_menu(this)">
							<option value="0" selected>선택</option>
							<c:forEach items="${festivalList }" var="festival">
								<c:if test="${festival.fo_pd_num == list.pd_num }">
									<option value="${festival.fo_num }">${festival.fo_age }</option>
								</c:if>
							</c:forEach>
						</select>
						<label class="ml-1">날짜 : </label>
						<input type="text" id="<c:if test="${vs.index < pdList.size() }">datepicker${vs.index+1}</c:if>" class="option_date" style="height: 20px;">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<select class="option_select amount_festival_select" name="" id="amount_festival_select" onchange="select_amount(this)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						<label class="ml-1">가격 : </label>
						<span class="select_price">0</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${list.pd_content }</span>
					</div>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.pd_pc_num ==1 }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi">
    	  	  			<c:if test="${fi.fi_table_key == list.pd_num}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        			<input type="hidden" name="pr_category" value="${list.pd_pc_num }">
        			<input type="hidden" name="pr_num" value="${list.pd_num }">
        			<input type="hidden" name="pr_title" value="${list.pd_title }">
					<label class="overStop">${list.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">여행지</span></label>
					<button class="select_item btn btn-outline-success" type="button">선택</button>
        			<div class="option_select_box1">
						<label>연령 : </label>
						<select class="option_select menu_travel_select" name="" id="menu_travel_select" onchange="select_menu(this)">
							<option value="0" selected>선택</option>
							<c:forEach items="${travelList }" var="travel">
								<c:if test="${travel.lo_pd_num == list.pd_num }">
									<option value="${travel.lo_num }">${travel.lo_age }</option>
								</c:if>
							</c:forEach>
						</select>
						<label class="ml-1">날짜 : </label>
						<input type="text" id="<c:if test="${vs.index < pdList.size() }">datepicker${vs.index+1}</c:if>" class="option_date" style="height: 20px;">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<select class="option_select amount_travel_select" name="" id="amount_travel_select" onchange="select_amount(this)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						<label class="ml-1">가격 : </label>
						<span class="select_price">0</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${list.pd_content }</span>
					</div>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.pd_pc_num ==3 }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi">
    	  	  			<c:if test="${fi.fi_table_key == list.pd_num}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        			<input type="hidden" name="pr_category" value="${list.pd_pc_num }">
        			<input type="hidden" name="pr_title" value="${list.pd_title }">
        			<input type="hidden" name="pr_num" value="${list.pd_num }">
					<label class="overStop">${list.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">여행지</span></label>
					<button class="select_item btn btn-outline-success" type="button">선택</button>
					<div class="option_select_box1">
						<label>방 선택 : </label>
						<select class="option_select menu_home_select" name="" id="menu_home_select" onchange="select_menu(this)">
							<option value="0" selected>선택</option>
							<c:forEach items="${homeList }" var="home">
								<c:if test="${home.ao_pd_num == list.pd_num }">
									<option value="${home.ao_num }">${home.ao_name }</option>
								</c:if>
							</c:forEach>
						</select>
						<label class="ml-1">가격 : </label>
						<span class="select_price">0</span>
						<span>원</span>
					</div>
					<div class="option_select_box2">
						<input type="hidden" name="pr_amount">
						<label>체크인 : </label>
						<input type="text" id="<c:if test="${vs.index < pdList.size() }">datepicker${vs.index+1}</c:if>" class="option_date startDate" style="height: 20px; width:140px">
						<label class="ml-1">체크아웃: </label>
						<input type="text" id="<c:if test="${vs.index < pdList.size() }">datepicker${vs.index+10}</c:if>" class="option_date endDate" style="height: 20px; width:140px">
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${list.pd_content }</span>
					</div>
				</div>
      		</li>
      		
      		</c:if>
     		</c:forEach>
			
    	</ul>
    	<form action="<c:url value='/option/basket'></c:url>" method="post">
	   		<div class="select_product_box">
		      	<ul class="product_list">
		        	<li class="no_product_item">등록된 상품이 없습니다.</li>
		      	</ul>
		      	<label style="font-size: 20px;">총가격 : </label>
		      	<span style="float: right;"><em class="allPrice">0</em> 원</span>
		      	<button type="button" class="addOrder btn btn-outline-danger">장바구니 담기</button>
	    	</div>
    	</form>
  </div>
  <script>
  $('.addOrder').click(function(){
		let list = [];
		$('.product_item').each(function(i){
			let pr_num = $(this).find('[name=pr_num]').val();
			let pr_category = $(this).find('[name=pr_category]').val(); 
			let pr_title = $(this).find('[name=pr_title]').val();
			let pr_option = $(this).find('[name=pr_option]').val();
			let pr_option_num = $(this).find('[name=pr_option_num]').val();
			let pr_amount = $(this).find('[name=pr_amount]').val();
			let pr_date = $(this).find('[name=pr_date]').val();
			let pr_price = $(this).find('[name=pr_price]').val();
			let pr_time = $(this).find('[name=pr_time]').val();
			let pr = {
				pr_num : pr_num,
				pr_category : pr_category,
				pr_title : pr_title,
				pr_option : pr_option,
				pr_option_num : pr_option_num,
				pr_amount : pr_amount,
				pr_date : pr_date,
				pr_price : pr_price,
				pr_time : pr_time
			}
			list.push(pr);
		})
		ajaxPost(list, '<c:url value="/option/test"></c:url>',testSuccess);
		
	});
  function testSuccess(data){
	  if(data.res == 0){
		  alert('장바구니 등록에 실패했습니다.')
	  }else{
		  if(confirm('장바구니 담았습니다.\n장바구니로 이동하시겠습니까?')){
			  //location.reload();
			  //$('.option_select').trigger('click');
			  location.replace("<c:url value='/option/basket'></c:url>");
		  }
	  }
  }
  //데이터피커 이용
  $.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		minDate : 1,
		maxDate : '1M'
	});
	$(function(){
		for(var i =1; i<=30;i++){
			$('#datepicker'+i).datepicker({
			})
		}
	});
	
	$(document).on('click','.close_list',function(){
		$(this).parent().remove();
		$('.no_product_item').show();
		priceAll();
	})
	priceAll();
	//옵션바꿀시 가격수정
	function priceAll(){
		let allprice = 0;
		$('[name=pr_price]').each(function(){
			let price = $(this).val();
			allprice = Number(allprice) + Number(price);

		})
		$('.allPrice').text(allprice);
	}
	//옵션 선택시 가격과 상세설명 수정
	function select_menu(obj){
		if($(obj).parent().siblings('[name=pr_category]').val() == 2){
			let amount = $(obj).parent().siblings('.option_select_box2').find('.amount_food_select').val();
			let food_menu = Number($(obj).parent().find('.menu_food_select option:selected').val());
			<c:forEach items="${foodList}" var="food">
				if("${food.reo_num}" == food_menu){
					let price = "${food.reo_price}" * amount;
					$(obj).parent().siblings('.option_select_box2').find('.select_price').text("${food.reo_price}" * amount);
					$(obj).parent().siblings('.option_select_box3').find('.option_detail').text("${food.reo_content}");
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 4){
			let amount = $(obj).parent().siblings('.option_select_box2').find('.amount_festival_select').val();
			let festival_menu = Number($(obj).parent().find('.menu_festival_select option:selected').val());
			<c:forEach items="${festivalList}" var="festival">
				if("${festival.fo_num}" == festival_menu){
					let price = "${festival.fo_price}";
					$(obj).parent().siblings('.option_select_box2').find('.select_price').text("${festival.fo_price}" * amount);
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 1){
			let amount = $(obj).parent().siblings('.option_select_box2').find('.amount_travel_select').val();
			let travel_menu = Number($(obj).parent().find('.menu_travel_select option:selected').val());
			<c:forEach items="${travelList}" var="travel">
				if("${travel.lo_num}" == travel_menu){
					let price = "${travel.lo_price}" * amount;
					$(obj).parent().siblings('.option_select_box2').find('.select_price').text("${travel.lo_price}" * amount);
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 3){
			$(obj).parent().siblings('.option_select_box2').find('.startDate').val('');
			$(obj).parent().siblings('.option_select_box2').find('.endDate').val('');
			let home_menu = Number($(obj).parent().find('.menu_home_select option:selected').val());
			<c:forEach items="${homeList}" var="home">
				if("${home.ao_num}" == home_menu){
							
					$(obj).siblings('.select_price').text("${home.ao_price}");
				}
			</c:forEach>
		}
	}
	
	//숙박 시작날짜
	$('.startDate').change(function(){
		
		let option = $(this).parent().siblings('.option_select_box1').find('.menu_home_select').val()
		if(option == 0){
			alert('방을 먼저 선택해주세요');
			$(this).val('');
			return false;
		}
		let checkIn = $(this).val();
		ajaxPost(checkIn, '<c:url value="/option/dateConfirm"></c:url>',confirmSuccess);
	})
	function confirmSuccess(){
		
	}
	//숙박 종료날짜
	$('.endDate').change(function(){
		
		let start = $(this).siblings('.startDate').val()
		if(start == ''){
			alert('체크인를 먼저 입력하세요.');
			$(this).val('');
			return false;
		}
		let end = $(this).val();
		//ajaxPost(checkIn, '<c:url value="/option/dateConfirm"></c:url>',confirmSuccess);
		let dateA = new Date(start);
		let dateB = new Date(end);
		if(dateB < dateA){
			alert('체크아웃이 체크인보다 작습니다.')
			$(this).val('');
			return false;
		}else if(dateB.getTime() == dateA.getTime()){
			alert('같은 날짜는 불가능합니다.')
			$(this).val('');
			return false;
		}
		let diffMsec = dateB.getTime() - dateA.getTime();
		let diffDate = diffMsec / (24 * 60 * 60 * 1000);
		$(this).siblings('[name=pr_amount]').val(diffDate);
		let home_menu = Number($(this).parent().siblings('.option_select_box1').find('.menu_home_select option:selected').val());
		<c:forEach items="${homeList}" var="home">
			if("${home.ao_num}" == home_menu){
						
				$(this).parent().siblings('.option_select_box1').find('.select_price').text("${home.ao_price}");
			}
		</c:forEach>
		let price = $(this).parent().siblings('.option_select_box1').find('.select_price').text();
		price = Number(price) * diffDate;
		$(this).parent().siblings('.option_select_box1').find('.select_price').text(price);
	})
	//수량 변경시 가격수정
	function select_amount(obj){
		if($(obj).parent().siblings('[name=pr_category]').val() == 2){
			let food_menu = Number($(obj).parent().siblings('.option_select_box1').find('.menu_food_select option:selected').val());
			let amount = $(obj).parent().find('.amount_food_select option:selected').val();
			<c:forEach items="${foodList}" var="food">
				if("${food.reo_num}" == food_menu){
					let price = "${food.reo_price}" * amount;
					$(obj).siblings('.select_price').text("${food.reo_price}" * amount);	
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 4){
			let festival_menu = Number($(obj).parent().siblings('.option_select_box1').find('.menu_festival_select option:selected').val());
			let amount = $(obj).parent().find('.amount_festival_select option:selected').val();
			<c:forEach items="${festivalList}" var="festival">
				if("${festival.fo_num}" == festival_menu){
					let price = "${festival.fo_price}" * amount;
					$(obj).siblings('.select_price').text("${festival.fo_price}" * amount);	
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 1){
			let travel_menu = Number($(obj).parent().siblings('.option_select_box1').find('.menu_travel_select option:selected').val());
			let amount = $(obj).parent().find('.amount_travel_select option:selected').val();
			<c:forEach items="${travelList}" var="travel">
				if("${travel.lo_num}" == travel_menu){
					let price = "${travel.lo_price}" * amount;
					$(obj).siblings('.select_price').text("${travel.lo_price}" * amount);	
				}
				
			</c:forEach>
		}
		if($(obj).parent().siblings('[name=pr_category]').val() == 3){
			let home_menu = Number($(obj).parent().siblings('.option_select_box1').find('.menu_home_select option:selected').val());
			let addPeople = $(obj).parent().find('.add_home_select option:selected').val();
			<c:forEach items="${homeList}" var="home">
				if("${home.ao_num}" == home_menu){
					let price = "${home.ao_price}";
					$(obj).parent().find('.add_home_select').val(0);
					$(obj).parent().find('.select_price').text(price);	
				}
				
			</c:forEach>
		}
	}
	//숙박에서 추가인원 설정
	function add_price(obj){
		let home_menu = Number($(obj).parent().siblings('.option_select_box1').find('.menu_home_select option:selected').val());
		let people = $(obj).parent().find('.amount_home_select option:selected').val();
		let addPeople = $(obj).parent().find('.add_home_select option:selected').val();
		<c:forEach items="${homeList}" var="home">
			if("${home.ao_num}" == home_menu && "${home.ao_capacity}"== people){
				let addPrice = addPeople*10000;
				let totalPrice = $(obj).parent().find('.select_price').text();
				totalPrice = Number(totalPrice) + Number(addPrice);
				$(obj).parent().find('.select_price').text(totalPrice);
			}else if("${home.ao_num}" == home_menu && "${home.ao_capacity}"!= people){
				$(obj).parent().find('.add_home_select').val(0);
				alert('최대인원일때만 추가인원을 설정할 수 있습니다.');
			}
		</c:forEach>
	}
	//선택시 리스트에 상품 추가
	$('.select_item').click(function(){
		if($(this).siblings('[name=pr_category]').val() == 2){
			let item_amount = $(this).siblings('.option_select_box2').find('.amount_food_select').val();
			let item_name = $(this).siblings('.option_select_box1').find('.option_select option:selected').text();
			if(item_name == null || item_name == '선택'){
				alert('메뉴를 선택하세요.');				
				return;
			}
			let item_title = $(this).siblings('[name=pr_title]').val();
			let item_date = $(this).siblings('.option_select_box1').find('.option_date').val();
			if(item_date == ''){
				alert('날짜를 선택하세요.');				
				return;
			}
			//let item_category = $(this).siblings('[name=pr_category]').val();
			let item_category = "restraunt_option";
			let item_num =  $(this).siblings('[name=pr_num]').val();
			let item_option_num = $(this).siblings('.option_select_box1').find('.option_select option:selected').val();
			let item_index = 0;
			$('.product_item').each(function(){
				item_index++;
			})
			let item_price = $(this).siblings('.option_select_box2').find('.select_price').text();
			let item_time = $(this).siblings('.option_select_box2').find('.select_food_time').val();
			str='';
			str+=
				'<li class="product_item">'+
	    			'<input type="hidden" name="pr_category" value='+item_category+'>'+
	    			'<input type="hidden" name="pr_num" value='+item_num+'>'+
	    			'<input type="hidden" name="pr_title" value='+item_title+'>'+
	    			'<input type="hidden" name="pr_option" value='+item_name+'>'+
	    			'<input type="hidden" name="pr_option_num" value='+item_option_num+'>'+
	    			'<input type="hidden" name="pr_amount" value='+item_amount+'>'+
	    			'<input type="hidden" name="pr_date" value='+item_date+'>'+
	    			'<input type="hidden" name="pr_price" value='+item_price+'>'+
	    			'<input type="hidden" name="pr_time" value='+item_time+'>'+
					'<div class="pr_content1">'+
						'<span name="list['+item_index+'].pr_title">'+item_title+' - </span>'+
						'<label name="list['+item_index+'].pr_option">메뉴 : '+item_name+'</label>'+
					'</div>'+
					'<button class="close_list btn btn-outline-danger">&times;</button>'+
					'<div class="pr_content2">'+
						'수량 : <span name="list['+item_index+'].pr_amount">'+item_amount+'</span>'+
						' 날짜 : <span name="list['+item_index+'].pr_date"">'+item_date+'</span>'+
						' 가격 : <span name="list['+item_index+'].pr_price">'+item_price+'</span>원'+
					'</div>'+
				'</li>'
			$('.product_list').append(str);
			$('.no_product_item').hide();
			priceAll();
		}
		if($(this).siblings('[name=pr_category]').val() == 4){
			let item_amount = $(this).siblings('.option_select_box2').find('.amount_festival_select').val();
			let item_name = $(this).siblings('.option_select_box1').find('.option_select option:selected').text();
			if(item_name == null || item_name == '선택'){
				alert('연령을 선택하세요.');				
				return;
			}
			let item_title = $(this).siblings('[name=pr_title]').val();
			let item_date = $(this).siblings('.option_select_box1').find('.option_date').val();
			if(item_date == ''){
				alert('날짜를 선택하세요.');				
				return;
			}
			//let item_category = $(this).siblings('[name=pr_category]').val();
			let item_category = "festival_option";
			let item_num =  $(this).siblings('[name=pr_num]').val();
			let item_option_num = $(this).siblings('.option_select_box1').find('.option_select option:selected').val();
			let item_index = 0;
			$('.product_item').each(function(){
				item_index++;
			})
			let item_price = $(this).siblings('.option_select_box2').find('.select_price').text();
			str='';
			str+=
				'<li class="product_item">'+
				'<input type="hidden" name="pr_category" value='+item_category+'>'+
    			'<input type="hidden" name="pr_num" value='+item_num+'>'+
    			'<input type="hidden" name="pr_title" value='+item_title+'>'+
    			'<input type="hidden" name="pr_option" value='+item_name+'>'+
    			'<input type="hidden" name="pr_option_num" value='+item_option_num+'>'+
    			'<input type="hidden" name="pr_amount" value='+item_amount+'>'+
    			'<input type="hidden" name="pr_date" value='+item_date+'>'+
    			'<input type="hidden" name="pr_price" value='+item_price+'>'+
    			'<input type="hidden" name="pr_time" value="0">'+
					'<div class="pr_content1">'+
						'<span name="list['+item_index+'].pr_title">'+item_title+' - </span>'+
						'<label name="list['+item_index+'].pr_option">연령 : '+item_name+'</label>'+
					'</div>'+
					'<button class="close_list btn btn-outline-danger">&times;</button>'+
					'<div class="pr_content2">'+
						'수량 : <span name="list['+item_index+'].pr_amount">'+item_amount+'</span>'+
						' 날짜 : <span name="list['+item_index+'].pr_date">'+item_date+'</span>'+
						' 가격 : <span name="list['+item_index+'].pr_price">'+item_price+'</span>원'+
					'</div>'+
				'</li>'
			$('.product_list').append(str);
			$('.no_product_item').hide();
			priceAll();
		}
		if($(this).siblings('[name=pr_category]').val() == 1){
			let item_amount = $(this).siblings('.option_select_box2').find('.amount_travel_select').val();
			let item_name = $(this).siblings('.option_select_box1').find('.option_select option:selected').text();
			if(item_name == null || item_name == '선택'){
				alert('연령을 선택하세요.');				
				return;
			}
			let item_title = $(this).siblings('[name=pr_title]').val();
			let item_date = $(this).siblings('.option_select_box1').find('.option_date').val();
			if(item_date == ''){
				alert('날짜를 선택하세요.');				
				return;
			}
			//let item_category = $(this).siblings('[name=pr_category]').val();
			let item_category = "landmark_option";
			let item_num =  $(this).siblings('[name=pr_num]').val();
			let item_option_num = $(this).siblings('.option_select_box1').find('.option_select option:selected').val();
			let item_index = 0;
			$('.product_item').each(function(){
				item_index++;
			})
			let item_price = $(this).siblings('.option_select_box2').find('.select_price').text();
			str='';
			str+=
				'<li class="product_item">'+
				'<input type="hidden" name="pr_category" value='+item_category+'>'+
    			'<input type="hidden" name="pr_num" value='+item_num+'>'+
    			'<input type="hidden" name="pr_title" value='+item_title+'>'+
    			'<input type="hidden" name="pr_option" value='+item_name+'>'+
    			'<input type="hidden" name="pr_option_num" value='+item_option_num+'>'+
    			'<input type="hidden" name="pr_amount" value='+item_amount+'>'+
    			'<input type="hidden" name="pr_date" value='+item_date+'>'+
    			'<input type="hidden" name="pr_price" value='+item_price+'>'+
    			'<input type="hidden" name="pr_time" value="0">'+
					'<div class="pr_content1">'+
						'<span name="list['+item_index+'].pr_title">'+item_title+' - </span>'+
						'<label name="list['+item_index+'].pr_option">연령 : '+item_name+'</label>'+
					'</div>'+
					'<button class="close_list btn btn-outline-danger">&times;</button>'+
					'<div class="pr_content2">'+
						'수량 : <span name="list['+item_index+'].pr_amount">'+item_amount+'</span>'+
						' 날짜 : <span name="list['+item_index+'].pr_date">'+item_date+'</span>'+
						' 가격 : <span name="list['+item_index+'].pr_price">'+item_price+'</span>원'+
					'</div>'+
				'</li>'
			$('.product_list').append(str);
			$('.no_product_item').hide();
			priceAll();
		}
		if($(this).siblings('[name=pr_category]').val() == 3){
			let item_amount = $(this).siblings('.option_select_box2').find('[name=pr_amount]').val();
			let item_name = $(this).siblings('.option_select_box1').find('.option_select option:selected').text();
			if(item_name == null || item_name == '선택'){
				alert('방을 선택하세요.');				
				return;
			}
			let item_title = $(this).siblings('[name=pr_title]').val();
			let item_date = $(this).siblings('.option_select_box2').find('.startDate').val();
			let end_date = $(this).siblings('.option_select_box2').find('.endDate').val();
			if(item_date == '' || end_date == ''){
				alert('날짜를 선택하세요.');				
				return;
			}
			//let item_category = $(this).siblings('[name=pr_category]').val();
			let item_category = "accomodation_option";
			let item_num =  $(this).siblings('[name=pr_num]').val();
			let item_option_num = $(this).siblings('.option_select_box1').find('.option_select option:selected').val();
			let item_index = 0;
			$('.product_item').each(function(){
				item_index++;
			})
			let item_price = $(this).siblings('.option_select_box1').find('.select_price').text();
			str='';
			str+=
				'<li class="product_item">'+
				'<input type="hidden" name="pr_category" value='+item_category+'>'+
    			'<input type="hidden" name="pr_num" value='+item_num+'>'+
    			'<input type="hidden" name="pr_title" value='+item_title+'>'+
    			'<input type="hidden" name="pr_option" value='+item_name+'>'+
    			'<input type="hidden" name="pr_option_num" value='+item_option_num+'>'+
    			'<input type="hidden" name="pr_amount" value='+item_amount+'>'+
    			'<input type="hidden" name="pr_date" value='+item_date+'>'+
    			'<input type="hidden" name="pr_price" value='+item_price+'>'+
    			'<input type="hidden" name="pr_time" value="0">'+
					'<div class="pr_content1">'+
						'<span name="list['+item_index+'].pr_title">'+item_title+' - </span>'+
						'<label name="list['+item_index+'].pr_option">방 : '+item_name+'</label>'+
					'</div>'+
					'<button class="close_list btn btn-outline-danger">&times;</button>'+
					'<div class="pr_content2">'+
						'숙박 : <span name="list['+item_index+'].pr_amount">'+item_amount+'박</span>'+
						' 날짜 : <span name="list['+item_index+'].pr_date">'+item_date+'</span>'+
						' 가격 : <span name="list['+item_index+'].pr_price">'+item_price+'</span>원'+
					'</div>'+
				'</li>'
			$('.product_list').append(str);
			$('.no_product_item').hide();
			priceAll();
		}
	})
	//음식점 예약현황 조회
	var tmp = 0;
	$('.select_food_time').click(function(){
		let ro_pd_num = Number($(this).parent().siblings('[name=pr_num]').val());
		let ro_date = $(this).parent().siblings('.option_select_box1').find('.option_date').val();
		if(ro_date == ''){
			alert('날짜를 먼저 선택하세요')
			return false;
		}
		let foodOption = {
				ro_pd_num : ro_pd_num,
				ro_date : ro_date
		}
		ajaxPost(foodOption, '<c:url value="/option/checkFood"></c:url>',checkFoodSuccess);
		console.log(tmp)
		if(tmp == 12){
			$(this).find('.select_lunch').attr('disabled',true);
		}
		if(tmp == 6){
			$(this).find('.select_dinner').attr('disabled',true);
		}
		if(tmp ==999){
			$(this).find('.select_lunch').attr('disabled',true);
			$(this).find('.select_dinner').attr('disabled',true);
			alert('해당 날짜에 예약이 가득찼습니다.');
		}
		
	})
	function checkFoodSuccess(data){
		let lunch = 0;
		let dinner = 0;
		data.res.forEach(function(item){
			if(item.ro_time == '12'){
				lunch++;
			}
			if(item.ro_time == '6'){
				dinner++;
			}
		})
		if(lunch > 5){
			tmp = 12;
		}else if(dinner > 5){
			tmp = 6;
		}else if(lunch > 5 || dinner > 5){
			tmp = 999;
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
  
  
  </script>
  
 
</body>
</html>
