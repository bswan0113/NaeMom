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
						<input type="text" placeholder="여행을 떠나요" class="search" name="search" style="border-radius:10px;" autocomplete="off" >
						<button style="border-radius: 0 10px 10px 0;" type="submit" class="btn-search"><i class="fas fa-search"></i></button>
					</form>
				</div>
				<div class="search-keyword">
					<h2>어제의 인기 검색어</h2>
					<ul class="list-search">
						<li class="item-search clearfix">
							<span class="num">1</span>
							<a href="#" class="link-search">서울</a>
						</li>
						<li class="item-search">
							<span class="num">2</span>
							<a href="#" class="link-search">부산</a>
						</li>
						<li class="item-search">
							<span class="num">3</span>
							<a href="#" class="link-search">겨울여행</a>
						</li>
						<li class="item-search">
							<span class="num">4</span>
							<a href="#" class="link-search">속초</a>
						</li>
						<li class="item-search">
							<span class="num">5</span>
							<a href="#" class="link-search">여수</a>
						</li>
					</ul>
					<ul class="list-search">
						<li class="item-search">
							<span class="num">6</span>
							<a href="#" class="link-search">경주</a>
						</li>
						<li class="item-search">
							<span class="num">7</span>
							<a href="#" class="link-search">통영</a>
						</li>
						<li class="item-search">
							<span class="num">8</span>
							<a href="#" class="link-search">인천</a>
						</li>
						<li class="item-search">
							<span class="num">9</span>
							<a href="#" class="link-search">제주</a>
						</li>
						<li class="item-search">
							<span class="num">10</span>
							<a href="#" class="link-search">대전</a>
						</li>
					</ul>
					<div class="close-keyword">
						<button type="button">닫기</button>
					</div>
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
				<c:if test="${user != null }">
					<div class="box-menu">
						<a href="<c:url value="/mypage/main"></c:url>" class="btn-quick"><i class="fas fa-user"></i>
						<span class="text-quick">마이페이지</span>
						</a>
					</div>
				</c:if>
				<c:if test="${user == null }">
					<div class="box-menu">
						<a href="<c:url value="/login"></c:url>" class="btn-quick"><i class="fas fa-user"></i>
						<span class="text-quick">로그인/<br>회원가입</span>
						</a>
					</div>
				</c:if>
				<c:if test="${user != null }">
					<div class="logOut">
						<a href="<c:url value="/logout"></c:url>" class="btn-quick logOut-link"><i class="fas fa-times-circle"></i>
						<span class="logout-text">로그아웃</span>
						</a>
					</div>
				</c:if>
				<c:if test="${user.me_authority>9}">
					<a class="admin fas fa-cog" href="<c:url value='/admin/home/main'></c:url>" style="margin-left:60px; color:#29c16d">관리자페이지</a>
				</c:if>
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
	<script>
		$('.search').focus(function(){
			$(this).css('background-color','#fff');
			$('.btn-search').css('background-color','#fff');
			$('.search-keyword').css('display','block');
		})
		$('.search').blur(function(){
			$(this).css('background-color','#eef0f2');
			$('.btn-search').css('background-color','#eef0f2');
			$('.search-keyword').css('display','none');
		})
	</script>
</body>
</html>

