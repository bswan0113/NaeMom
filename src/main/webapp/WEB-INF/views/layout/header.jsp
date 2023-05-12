<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpSession" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="kr.dbp.naemom.vo.MemberVO" %>
<%
MemberVO member =(MemberVO)session.getAttribute("user");
String meId = "";

if (member != null) {
    meId = member.getMe_id();
} 
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<c:url value ='/resources/css/header.css'></c:url>"></link>
	<link rel="stylesheet" href="<c:url value ='/resources/css/footer.css'></c:url>"></link>
	<style>
		@keyframes shake {
	    0% { transform: translate(1px, 1px) rotate(0deg); }
	    10% { transform: translate(-1px, -2px) rotate(-1deg); }
	    20% { transform: translate(-3px, 0px) rotate(1deg); }
	    30% { transform: translate(3px, 2px) rotate(0deg); }
	    40% { transform: translate(1px, -1px) rotate(1deg); }
	    50% { transform: translate(-1px, 2px) rotate(-1deg); }
	    60% { transform: translate(-3px, 1px) rotate(0deg); }
	    70% { transform: translate(3px, 1px) rotate(-1deg); }
	    80% { transform: translate(-1px, -1px) rotate(1deg); }
	    90% { transform: translate(1px, 2px) rotate(0deg); }
	    100% { transform: translate(1px, -2px) rotate(-1deg); }
	}
	
	.shake {
	    animation: shake 0.5s;
	    animation-iteration-count: infinite;
	}
	</style>
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
					<button class="btn btn-success lucky" style="float:right;margin-top:2px;height: 30px;line-height: 16px;" data-toggle="modal" data-target="#modal">오늘의 운세</button>
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
		    오늘의 운세
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body" style="height:200px;">
		    	<img id="fortune-cookie"alt="포츈쿠키" src="resources/img/fortune-cookie.jpg" width="250" height="auto">
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>

	<script>
		$('.lucky').click(function(e){
			e.preventDefault();
			let id = "<%= meId %>";
			if(id==''){
				alert('로그인이 필요한 서비스입니다!');				
				return false;
			}
			showWaitImage();
			setTimeout(function() {
			$.ajax({
				method:"get",
				url:"<c:url value='/fortune'></c:url>",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					$('#fortune-cookie').hide();
					$('.modal-body').text(data.message);
					
					
				}
			});
			},3000);
			
		
		});
		function showWaitImage(){
			let img =$('#fortune-cookie');
			img.addClass('shake');
		}
		
		$('.search').focus(function(){
			$(this).css('background-color','#fff');
			$('.search-keyword').css('display','block');
		})
		$('.search').blur(function(){
			$(this).css('background-color','rgba(0,0,0,0.1)');
			$('.search-keyword').css('display','none');
		})
	</script>
</body>
</html>

