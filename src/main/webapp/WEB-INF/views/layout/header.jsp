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
<script src="<c:url value ='/resources/js/jquery.min.js'></c:url>"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"></link>
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
	
	/* 공통 적용 */



	.header{
	  position: fixed; height: 145px; width: 100%; top: 0; background-color: #fff;
	  box-shadow: 0 3px 5px 1px rgba(0,0,0,0.3);  z-index: 998;
	  
	}
	.header .head-box{
	  width: 1190px; margin: 0 auto; height: 100%;
	    position: relative;
	}
	
	.header .head-box .main-icon-box{
	  float: left; width: 380px; background-color: #fff; margin-top: 20px; height: 75px; text-align: center;
	  
	}
	
	.head-box .search-containerbox .search{
	  width: 560px; height: 50px; border: 1px solid black; background-color:#eef0f2;
	  font-size: 15px; float: left;  padding: 0 5px;
	}
	.header .head-box .search-containerbox{
	  float: left; background-color: #fff; height: 100px; 
	  
	}
	.head-box .search-containerbox .search-box{
	  position: relative; border-radius: 10px;
	  float: right; width: 580px; padding-top: 25px;
	}
	.head-box .search-containerbox .search-box>*{
	  border-radius: 10px;
	}
	.head-box .search-containerbox .search-box .btn-search{
	  width: 50px; height: 50px; position: absolute; border: none; 
	  top: 25px; right: 10px; bottom: 0; cursor: pointer; padding: 0; outline: 0;
	  font-size: 30px;line-height: 50px; color: black; text-align: center;
	}
	.header .head-box .main-menu-box{
	  width: 100%; 
	}
	.head-box .main-menu-box .list-menu{
	  width: 100%; height: 45px; max-width: 1190px; margin: 0 auto; display: flex;
	}
	.head-box .main-menu-box .item-menu{
	 display: flex; justify-content: space-around; width: 100%; height: 100%; background-color: #fff;
	 align-items: center;
	}
	.head-box .main-menu-box .link-menu{
	  display: flex; align-items: center; color: #000;
	  font-family: "SF Pro KR", "SF Pro Display", "SF Pro Icons", -apple-system, BlinkMacSystemFont, "Noto Sans KR", "Segoe UI", Roboto, "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.head-box .main-menu-box .icon-menu{
	  width: 30px; height: 30px;
	}
	.head-box .main-menu-box .item-menu:hover{
	  border-bottom: 5px solid #0a97cd;
	}
	
	/* 메인 메뉴바 끝 */
	.search-containerbox .search-keyword{
	  position: absolute; right: 237px; top: 85px; width: 570px; border: 1px solid #666; background: #fff;
	  border-radius: 10px; z-index: 999; text-align: left; display: none; 
	}
	.search-containerbox .search-keyword h2{
	  height: 33px; line-height: 33px; margin-top: 20px; padding: 0 28px; font-weight: 800; 
	  font-size: 20px; color: #333; letter-spacing: -0.5px;
	}
	.search-containerbox .search-keyword .list-search{
	  float: left; width: 50%; padding-bottom: 32px;
	}
	.search-containerbox .search-keyword .list-search .item-search{
	  margin-top: 20px; padding-left: 28px;
	}
	.search-containerbox .search-keyword .num{
	  float: left; width: 20px; height: 20px; background: #666; border-radius: 3px; color: #fff;
	  font-size: 13px; text-align: center; vertical-align: middle;
	}
	.search-containerbox .search-keyword .link-search{
	  overflow: hidden;line-height: 20px; margin-left: 10px; color: #333;
	  font-size: 15px; font-weight: 700;text-overflow: ellipsis; white-space: nowrap;
	}
	.search-containerbox .search-keyword .list-search+.list-search .link-search{
	  font-weight: 400; color: #666;
	}
	.search-containerbox .search-keyword .list-search+.list-search .num{
	  background: #949494;
	}
	.search-containerbox .search-keyword .close-keyword{
	  width: 100%; overflow: hidden; height: 33px; background: #eef0f2; text-align: right;
	  border-radius: 0 0 10px 10px;
	}
	.search-containerbox .search-keyword button{
	  padding: 0 20px; line-height: 33px; font-size: 14px; color: #333; border-radius: 0 0 10px 0;
	  border: 0 none; cursor: pointer;
	}
	/* 서치바 클릭 박스 */
	
	.head-box .box-quickMenu{
	  float: right; width: 210px; background-color: #fff; height: 100px;
	}
	.head-box .box-quickMenu .box-menu{
	  width: 70px; float: left; text-align: center; line-height: 20px; padding-top: 30px;
	}
	
	.box-quickMenu .box-menu .btn-quick i{
	  font-size: 30px; color: #000;
	}
	.box-quickMenu .box-menu .text-quick{
	  display: block; font-size: 8px; color: #000;
	  font-family: "SF Pro KR", "SF Pro Display", "SF Pro Icons", -apple-system, BlinkMacSystemFont, "Noto Sans KR", "Segoe UI", Roboto, "Helvetica Neue", Helvetica, Arial, sans-serif;
	}

</style>
</head>
<body>
	<div class="header">
		<div class="head-box clearfix">
			
			<div class="main-icon-box"><a href="#"><img src="<c:url value ='/resources/headerImages/logo.png'></c:url>" alt="#"></a></div>
			<div class="search-containerbox clearfix">
				<div class="search-box clearfix">
					<input type="text" placeholder="여행을 떠나요" class="search">
					<a href="#" class="btn-search"><i class="fas fa-search"></i></a>
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
					<a href="#" class="btn-quick"><i class="fas fa-shopping-bag"></i>
					<span class="text-quick">장바구니</span>
					</a>
				</div>
				<div class="box-menu">
					<a href="" class="btn-quick"><i class="fas fa-user"></i>
					<span class="text-quick">마이페이지</span>
					</a>
				</div>
			</div>
			<div class="main-menu-box">
				<nav class="list-menu">
					<div class="item-menu">
						<a href="#" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/headerImages/airplane.png'></c:url>" alt="">여행</a>
					</div>
					<div class="item-menu">
						<a href="#" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/headerImages/food.png'></c:url>" alt="">음식</a>
					</div>
					<div class="item-menu">
						<a href="#" class="link-menu"><img class= "icon-menu"src="<c:url value ='/resources/headerImages/hotel.png'></c:url>" alt="">숙박</a>
					</div>
				</nav>
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
</body>
</html>


