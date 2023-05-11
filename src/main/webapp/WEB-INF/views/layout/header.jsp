<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="<c:url value ='/resources/css/header.css'></c:url>"></link>
<link rel="stylesheet" href="<c:url value ='/resources/css/footer.css'></c:url>"></link>

</head>
<body>

	<div class="header">
		<div class="head-box clearfix">
			<div class="main-icon-box"><a href="<c:url value="/"></c:url>"><img src="<c:url value ='/resources/img/logo.png'></c:url>" alt="#"></a></div>
			<div class="search-containerbox clearfix">
				<div class="search-box clearfix">
					<form action="<c:url value='/searchList/searchMain'></c:url>">
						<input type="text" placeholder="여행을 떠나요" class="search" name="search" style="border-radius:10px;">
						<button style="border:1px solid black; border-left:none; border-radius: 0 10px 10px 0;" type="submit" class="btn-search"><i class="fas fa-search"></i></button>
					</form>
					<button class="btn btn-success" style="float:right;margin-top:2px;" data-toggle="modal" data-target="#modal">추천룰렛</button>
				</div>
			</div>
			<div class="box-quickMenu clearfix">
				<div class="box-menu">
					<a href="#" class="btn-quick"><i class="fas fa-map-marked-alt"></i>
					<span class="text-quick">여행지도</span>
					</a>
				</div>
				<div class="box-menu">
					<a href="<c:url value="/option/basket"></c:url>" class="btn-quick"><i class="fas fa-shopping-bag"></i>
					<span class="text-quick">장바구니</span>
					</a>
				</div>
				<div class="box-menu">
					<a href="<c:url value="/mypage/main"></c:url>" class="btn-quick"><i class="fas fa-user"></i>
					<span class="text-quick">마이페이지</span>
					</a>
				</div>
			</div>
			<div class="main-menu-box">
				<nav class="list-menu">
					<div class="item-menu">
						<a href="<c:url value='/searchList/searchDetailList?pc_category=1'></c:url>" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/img/airplane.avif'></c:url>" alt="">여행</a>
					</div>
					<div class="item-menu">
						<a href="<c:url value='/searchList/searchDetailList?pc_category=2'></c:url>" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/img/food.png'></c:url>" alt="">음식</a>
					</div>
					<div class="item-menu">
						<a href="<c:url value='/searchList/searchDetailList?pc_category=3'></c:url>" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/img/hotel.png'></c:url>" alt="">숙박</a>
					</div>
					<div class="item-menu">
						<a href="<c:url value='/searchList/searchFe'></c:url>" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/img/festival.png'></c:url>" alt="">축제</a>
					</div>
					<div class="item-menu">
						<a href="<c:url value='/course/list'></c:url>" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/img/course.png'></c:url>" alt="">코스</a>
					</div>
				</nav>
			</div>
		</div>
	</div>


<!-- 검색모달 -->
<div class="modal common-modal" id="modal">
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		      <h4 class="modal-title">추천 룰렛 굴리기</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
		    	<input id="slice-count"type="number" class="form-control" min="2" max="30" value="5">
		    	<canvas width="400" height='400' id="roulette"></canvas>
		    	<button class="btn btn-success go-spin">돌리기!</button>
		    	<button class="btn btn-success fill-roulette">추천상품으로 채우기</button>
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>

	<script>
		$('.search').focus(function(){
			$(this).css('background-color','#fff');
			$('.search-keyword').css('display','block');
		})
		$('.search').blur(function(){
			$(this).css('background-color','rgba(0,0,0,0.1)');
			$('.search-keyword').css('display','none');
		})
	</script>
<script>
$(document).ready(function() {
	
	$('.fill-roulette').click(function(){
		$.ajax({
			url:"<c:url value='/fill-roulette'></c:url>",
			method:"get",
			success:function(data){
				drawRoulette(data.length, data);
			}
		})
	})
    let ctx = $('#roulette')[0].getContext("2d");

	
    drawRoulette(5);
    $('#slice-count').change(function() {
    	drawRoulette($(this).val());
    	});
    
    function drawRoulette(sliceCount,product) {
    	  let angleIncrement = (2 * Math.PI) / sliceCount;
    	  let startAngle = 0;
    	  let endAngle = angleIncrement;
    	  let arc = Math.PI / (sliceCount / 2);

    	  for (let i = 0; i < sliceCount; i++) {
    	    ctx.beginPath();
    	    ctx.moveTo(225, 200);
    	    ctx.arc(225, 200, 170, startAngle, endAngle);
    	    ctx.lineTo(225, 200);
      	  	ctx.strokeStyle = "#ccc"; // 테두리 색상 설정
    	  	ctx.lineWidth = 2;
      	  	ctx.stroke();

    	    // 랜덤한 색상 생성
    	    let randomColor = getRandomColor();
    	    ctx.fillStyle = randomColor;
    	    ctx.fill();
    	    ctx.closePath();

    	    startAngle += angleIncrement;
    	    endAngle += angleIncrement;
    	  }
    }

    	function getRandomColor() {
    	  const letters = "0123456789ABCDEF";
    	  let color = "#";
    	  for (let i = 0; i < 6; i++) {
    	    color += letters[Math.floor(Math.random() * 16)];
    	  }
    	  return color;
    	}
  });

</script>
</body>
</html>

