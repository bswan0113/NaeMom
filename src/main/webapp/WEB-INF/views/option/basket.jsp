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
  <title>basket</title>
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
		    height:auto;
		  }
	    .option_list{
	      float: left; border: 1px solid black; width: 750px; padding: 20px;
	      margin-top: 100px; border-radius: 10px;
	    }
	    .option_item{
	      position: relative; padding: 20px 0; border-bottom: 1px solid #e6e6e6;
		    border-top: 1px solid #e6e6e6;
	    }
		.delete_item{
			position: absolute; right: 20px; top: 20px;
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
	      margin-top: 100px; border-radius: 10px; position:sticky; top:190px
	    }
	    .addOrder{
	      text-align: center; width: 100%; font-size: 20px; height: 50px; margin-top: 20px;
	    }
	    .deleteOrder{
	    	text-align: center; width: 100%; font-size: 20px; height: 50px; margin-top: 20px;
	    }
	    .no_product_list{
	    	margin-bottom: 10px; border: 1px; border-radius: 10px; background-color: antiquewhite;
				position: relative; text-align:center;
	    }
	    
	    .no_product_item{
	    	margin-bottom: 10px; border: 1px; border-radius: 10px; background-color: antiquewhite;
				position: relative; text-align:center;
	    }
		

  </style>
</head>
<body>
	<div class="contents clearfix">
		<div class="title_box clearfix">
	    	<label class="option_title">장바구니</label>
	    	<span class="order_step"><em>장바구니 ></em>주문결제>결제완료</span>
		</div>
    	<ul class="option_list">
    		
    		<li class="no_product_list">등록된 상품이 없습니다.</li>
    		
    		<c:forEach items="${basket }" var="list" varStatus="i" begin="0" end="${basket.size() }">
    		<c:if test="${list.travel.pc_category =='여행지' }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi" varStatus="j" begin="0" end="${fList.size() }">
    	  	  			<c:if test="${i.index == j.index}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        		<c:forEach items="${prList }" var="pr" varStatus="p" begin="0" end="${prList.size() }">
        		<c:if test="${i.index == p.index }">
        			<input type="hidden" name="pr_category" value="">
        			<input type="hidden" name="pr_title" value="">
        			<input type="hidden" name="sb_num" value="${list.sb_num }">
					<label style="font-size: 30px; font-weight: 500;">${pr.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">여행지</span></label>
					<button class="delete_item btn btn-outline-danger" type="button">&times;</button>
					<div class="option_select_box1">
						<label>연령 : </label>
						<input value="${list.travel.lo_age }" disabled="disabled" style="width:160px">
						<label class="ml-1">날짜 : </label>
						<input type="text" class="option_date" value="${list.sb_date}" disabled="disabled">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<input value="${list.sb_amount }" disabled="disabled" style="width:160px">
						<label class="ml-1">가격 : </label>
						<span class="select_price">${list.sb_price }</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${pr.pd_content }</span>
					</div>
				</c:if>
				</c:forEach>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.festival.pc_category =='축제' }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi" varStatus="j" begin="0" end="${fList.size() }">
    	  	  			<c:if test="${i.index == j.index}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        		<c:forEach items="${prList }" var="pr" varStatus="p" begin="0" end="${prList.size() }">
        		<c:if test="${i.index == p.index }">
        			<input type="hidden" name="pr_category" value="">
        			<input type="hidden" name="pr_title" value="">
        			<input type="hidden" name="sb_num" value="${list.sb_num }">
					<label style="font-size: 30px; font-weight: 500;">${pr.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">축제</span></label>
					<button class="delete_item btn btn-outline-danger" type="button">&times;</button>
					<div class="option_select_box1">
						<label>연령 : </label>
						<input value="${list.festival.fo_age }" disabled="disabled" style="width:160px">
						<label class="ml-1">날짜 : </label>
						<input type="text" class="option_date" value="${list.sb_date}" disabled="disabled">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<input value="${list.sb_amount }" disabled="disabled" style="width:160px">
						<label class="ml-1">가격 : </label>
						<span class="select_price">${list.sb_price }</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${pr.pd_content }</span>
					</div>
				</c:if>
				</c:forEach>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.food.pc_category =='음식점' }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi" varStatus="j" begin="0" end="${fList.size() }">
    	  	  			<c:if test="${i.index == j.index}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        		<c:forEach items="${prList }" var="pr" varStatus="p" begin="0" end="${prList.size() }">
        		<c:if test="${i.index == p.index }">
        			<input type="hidden" name="pr_category" value="">
        			<input type="hidden" name="pr_title" value="">
        			<input type="hidden" name="sb_num" value="${list.sb_num }">
					<label style="font-size: 30px; font-weight: 500;">${pr.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">음식점</span></label>
					<button class="delete_item btn btn-outline-danger" type="button">&times;</button>
					<div class="option_select_box1">
						<label>메뉴 : </label>
						<input value="${list.food.reo_name }" disabled="disabled" style="width:160px">
						<label class="ml-1">날짜 : </label>
						<input type="text" class="option_date" value="${list.sb_date}" disabled="disabled">
					</div>
					<div class="option_select_box2">
						<label>수량 : </label>
						<input value="${list.sb_amount }" disabled="disabled" style="width:160px">
						<label class="ml-1">가격 : </label>
						<span class="select_price">${list.sb_price }</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${pr.pd_content }</span>
					</div>
				</c:if>
				</c:forEach>
				</div>
      		</li>
      		</c:if>
      		<c:if test="${list.home.pc_category =='숙박' }">
      		<li class="option_item">
      	  		<div class="option_photo">
      	  			<c:forEach items="${fList }" var="fi" varStatus="j" begin="0" end="${fList.size() }">
    	  	  			<c:if test="${i.index == j.index}">
	        	  			<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="option_item_img">
      		  			</c:if>
          			</c:forEach>
        		</div>
        		<div class="option_select_box">
        		<c:forEach items="${prList }" var="pr" varStatus="p" begin="0" end="${prList.size() }">
        		<c:if test="${i.index == p.index }">
        			<input type="hidden" name="pr_category" value="">
        			<input type="hidden" name="pr_title" value="">
        			<input type="hidden" name="sb_num" value="${list.sb_num }">
					<label style="font-size: 30px; font-weight: 500;">${pr.pd_title} <span class="item_category" style="font-size: 20px; font-weight: 100;">숙박</span></label>
					<button class="delete_item btn btn-outline-danger" type="button">&times;</button>
					<div class="option_select_box1">
						<label>방 : </label>
						<input value="${list.home.ao_name }" disabled="disabled" style="width:160px">
						<label class="ml-1">날짜 : </label>
						<input type="text" class="option_date" value="${list.sb_date}" disabled="disabled">
					</div>
					<div class="option_select_box2">
						<label>인원 : </label>
						<input value="${list.home.ao_capacity }" disabled="disabled" style="width:60px">
						<label>추가인원 : </label>
						<c:choose>
							<c:when test="${list.sb_amount-list.home.ao_capacity > 0 }">
								<input value="${list.sb_amount-list.home.ao_capacity }" disabled="disabled" style="width:60px">
							</c:when>
							<c:otherwise>
								<input value="없음" disabled="disabled" style="width:60px">
							</c:otherwise>
						</c:choose>
						<label class="ml-1">가격 : </label>
						<span class="select_price">${list.sb_price }</span>
						<span>원</span>
					</div>
					<div class="option_select_box3">
						<label>상세설명 : </label>
						<span class="option_detail">${pr.pd_content }</span>
					</div>
				</c:if>
				</c:forEach>
				</div>
      		</li>
      		</c:if>
     		</c:forEach>
			
    	</ul>
	   		<div class="select_product_box">
		      	<div class="allPrice_box">
			      	<strong style="font-size: 20px;">상품갯수 : </strong>
			      	<span style="float: right;"><em class="allAmount">0</em> 개</span>
		      	</div>
		      	<div class="allPrice_box mt-3" style="">
			      	<strong style="font-size: 20px;">총가격 : </strong>
			      	<span style="float: right;"><em class="allPrice">0</em> 원</span>
		      	</div>
		      	<button type="button" class="deleteOrder btn btn-outline-danger mt-3">장바구니 비우기</button>
		    	<form action="<c:url value='/option/paymentList'></c:url>" method="post">
	      			<button class="addOrder btn btn-outline-success">주문하기</button>
   				</form>
	    	</div>
  </div>
  <script>
  		$('form').submit(function(){
  			let amount = $('.allAmount').text();
  			let price = $('.allPrice').text();
  			$('.option_item').each(function(i){
  				let sb_num = $(this).find('[name=sb_num]').val();
  				str='';
  				str +=
  					'<input type="hidden" name="sb_num" value="'+sb_num+'">';
  				$('form').append(str);
  				
  			})
  			
  			if(confirm('총 '+amount+'개의 상품, '+price+'원 입니다.\n주문하시겠습니까?')){
  				return true;
  			}
  		})
  		$('.no_product_list').hide();
  		//리스트 삭제 이벤트
		$('.delete_item').click(function(){
			$(this).parent().parent().remove();
			allPrice();
			itemCount();
			let sb_num = $(this).siblings('[name=sb_num]').val();
			ajaxPost(sb_num, '<c:url value="/option/deleteBasket"></c:url>', deleteBasket);
		})
		function deleteBasket(data){
  			if(data.res == 0){
  				alert('상품삭제에 실패했습니다.');
  			}else{
  				alert('상품삭제에 성공했습니다.');
  			}
  		}
  		//리스트 전체삭제 이벤트
  		$('.deleteOrder').click(function(){
  			if(confirm('장바구니를 비우겠습니까?')){
  				$('.no_product_list').siblings().remove();
	  			$('.no_product_list').show();
	  			let sb_num = 1;
	  			ajaxPost(sb_num, '<c:url value="/option/deleteAllBasket"></c:url>', deleteAllBasket);
  			}
  		})
  		function deleteAllBasket(data){
  			if(data.res == 0){
  				alert('장바구니 비우기 실패');
  			}else{
  				allPrice();
  				itemCount();
  				alert('장바구니 비우기 완료')
  			}
  		}
		//총가격 호출
		allPrice();
		//총 갯수 호출
		itemCount();
		//총가격
		function allPrice(){
			let totalPrice = 0;
			if($('.select_price').length){
	        	$('.select_price').each(function(i,box){
	          		let price = $(box).text();
	          		totalPrice = Number(totalPrice) + Number(price);
        		})
				$('.allPrice').text(totalPrice);
			}else{
		      	$('.allPrice').text('0');
		      	$('.no_product_list').show();
			}
		}
		//총갯수
  		function itemCount(){
  			let count = 0;
  			$('.option_item').each(function(i){
  				count++;
  			})
  			$('.allAmount').text(count);
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
