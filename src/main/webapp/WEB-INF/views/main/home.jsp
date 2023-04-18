<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>NaeMom</title>

<script src="<c:url value='/resources/js/home.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/home.css'></c:url>">

<div class="main-container-first">
    <div class="first-title title">
        <h2>메인</h2>
    </div>
    <div class="btn-container">
    	<a href="/naemom/main/insert/" class="insertContent-btn btn btn-secondary">등록하기</a>
    </div>
    
    <div class="swiper first-contents">
        <div class="swiper-container mySwiper">
            <div class="swiper-wrapper contents-wraper">
                <c:forEach items="${plist}" var="product_checked">
                <div class="swiper-slide contents-img" style="min-width: 270px;">
                    <a href="#">
                    	<img class="" style="width:100%; height:100%;" src="<c:url value='/download${product_checked.file.fi_name}'></c:url>">
                    </a>
	                    <div class="contents-detail">
	                   		
	                        <div class="title-wraper">
	                            <span class="contents-title">${product_checked.pd_title}</span>
	                        </div>
	                        <span class="content">${product_checked.pd_street_address}</span>
	                        <a href="#" class="content-btn">둘러보기</a>
	                    </div>
                </div>
                </c:forEach>
                
            </div>
            <button class="swiper-button-prev btn-prev"></button>
            <button class="swiper-button-next btn-next"></button>
        </div>
    </div>
</div>
<div class="main-container-second">
	<div class="second-title title">
        <h1>배너</h1>
    </div>
    <div class="btn-container">
    	<a href="/naemom/main/addimage/" class="addimage-btn btn btn-secondary">이미지 등록하기</a>
    </div>
    <div class="banner-box">
        <div class="swiper-container bannerSwiper">
            <div class="swiper-wrapper">
            	<c:forEach items="${flist}" var="file_checked">
                <div class="swiper-slide banner-img" style="min-width: 1190px;">
                    <a href="#">
                    	<img class="" style="width:50%; height:50%;object-fit: contain;" src="<c:url value='/download${file_checked.fi_name}'></c:url>">
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<script>
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    slidesPerGroup: 3,
    spaceBetween: 30,
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: { 
        nextEl: '.swiper-button-next', 
        prevEl: '.swiper-button-prev', 
    }
  });
/* var swiper = new Swiper('.mySwiper', { 
  slidesPerView : 3,
  slidesPerGroup: 3,
  spaceBetween: 50,
  centeredSlides: false,
  loop : true,
  navigation: { 
      nextEl: '.swiper-button-next', 
      prevEl: '.swiper-button-prev', 
  }, 
  autoplay: { 
      delay: 5000, 
  }
});  */

var swiper = new Swiper('.bannerSwiper', { 
  centeredSlides: false,
  loop : true,
  navigation: { 
      nextEl: '.swiper-button-next', 
      prevEl: '.swiper-button-prev', 
  }, 
  autoplay: { 
      delay: 10000, 
  }
});
</script>
