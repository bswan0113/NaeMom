<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>NaeMom</title>

<script src="<c:url value='/resources/js/home.js'></c:url>"></script>

<div class="main-container-first">
    <div class="first-title">
        <h1>메인</h1>
    </div>
    <div class="swiper">
        <div class="swiper-container mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
                <div class="swiper-slide" style="width: 400px;">
                    <img class="" style="width:100%; height:100%;object-fit: contain;" src="<c:url value='/resources/img/home-swiper-gwanghwamun.jpg'></c:url>">
                </div>
            </div>
            <button class="swiper-button-prev btn-prev"></button>
            <button class="swiper-button-next btn-next"></button>
        </div>
    </div>
</div>

<script>

var swiper = new Swiper('.mySwiper', { 
  slidesPerView : 4,
  slidesPerGroup: 4,
  spaceBetween: 50,
  centeredSlides: false,
  loop : true,
  navigation: { 
      nextEl: '.swiper-button-next', 
      prevEl: '.swiper-button-prev', 
  }, 
  autoplay: { 
      delay: 3000, 
  }
}); 
</script>
