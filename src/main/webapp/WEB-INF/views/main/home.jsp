<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./semi_ahn.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="./semi_ahn.js"></script>
<script src="./semi_ahn_tool/Jquery/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"></link>
</head>
<body>
<div class="empty" style="width: 100%; height: 145px;"></div>
    <div class="main-container">
        <!-- 메인배너링크 완료-->
        <div class="main-banner-box" >  
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#" class="banner-link">
                            <img src="<c:url value ='/resources/img/main-banner(1).jpg'></c:url>" alt="">
                            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#" class="banner-link">
                            <img src="<c:url value ='/resources/img/main-banner(2).jpg'></c:url>" alt="">
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#" class="banner-link">
                            <img src="<c:url value ='/resources/img/main-banner(1).jpg'></c:url>" alt="">
                        </a>
                    </div>
                </div>
            <div class="swiper-scrollbar"></div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        
        <!-- 메인 큐레이션링크 완료 -->
        <div class="main-curation-area">
            <h2> <a class="curation-logo" href="#"><img src="<c:url value ='/resources/img/curation-logo-real.png'></c:url>" alt="" style="width: 50%; height:250px; display: inline-block; margin-top: -180px;" ></a></h2>
            <div class="curation-box">
                <ul class="curation-tab">
                    <li class="curation-menu clearfix"><a href="#"><span>랜덤 추천 여행지</span></a>
                        <div class="curation-content pointon">
                            <span>관광 빅데이터 정보로 분석한 지역별 핫한 여행지와 맛집을 소개합니다.</span>
                        </div>
                        <div class="curation-inner inner1 pointon2">
                            <ul class="placelist">
                                <li class="list-item">
                                    <a href="#">
                                        <strong>서울 고성막국수</strong>
                                        <img class="item-img" src="<c:url valeu='/resources/img/gosung-mak-noodle.jpg'></c:url>" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>청춘 뮤지엄</strong>
                                        <img class="item-img" src="<c:url valeu='/resources/img/chungchun-museum.jpg'></c:url>" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>유명한 어딘가</strong>
                                            <img class="item-img" src="<c:url valeu='/resources/img/list-item-img(3).png'></c:url>" alt="">
                                    </a>
                                </li>
                            </ul>
                            <div class="more-view">
                                <button class="more-view-recbtn">오늘의 핫플콕콕 추천</button>
                                <a href="#" class="more-view-btn">더보기</a>
                            </div>
                        </div>
                    </li>
                    <li class="curation-menu clearfix"><a href="#"><span>금주의 추천 코스</span></a>
                        <div class="curation-content">
                            <span>관광 빅데이터 정보로 분석한 지역별 핫한 여행지와 맛집을 소개합니다.</span>
                        </div>
                        <div class="curation-inner inner2">
                            <ul class="placelist">
                                <li class="list-item">
                                    <a href="#">
                                        <strong>선물광고</strong>
                                        <img class="item-img" src="<c:url valeu='/resources/img/curation(2).png'></c:url>" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>가볼래터</strong>
                                        <img class="item-img" src="<c:url valeu='/resources/img/curation(1).png'></c:url>" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>서울 고성막국수2</strong>
                                            <img class="item-img" src="<c:url valeu='/resources/img/gosung-mak-noodle.jpg'></c:url>" alt="">
                                    </a>
                                </li>
                            </ul>
                            <div class="more-view">
                                <button class="more-view-recbtn">오늘의 핫플콕콕 추천</button>
                                <a href="#" class="more-view-btn">더보기</a>
                            </div>
                        </div>
                    </li>
                    <li class="curation-menu clearfix"><a href="#"><span>에디터 추천 코스</span></a>
                        <div class="curation-content">
                            <span>관광 빅데이터 정보로 분석한 지역별 핫한 여행지와 맛집을 소개합니다.</span>
                        </div>
                        <div class="curation-inner inner3">
                            <ul class="placelist">
                                <li class="list-item">
                                    <a href="#">
                                        <strong>서울 고성막국수1</strong>
                                        <img class="item-img" src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>맛좋은 냉면</strong>
                                        <img class="item-img" src="./semi_ahn_img/8a1012d8-cd9d-4348-89f9-3bd03a6e0572.progress.jpg" alt="">
                                    </a>
                                </li>
                                <li class="list-item">
                                    <a href="#">
                                        <strong>서울 고성막국수1</strong>
                                            <img class="item-img" src="./semi_ahn_img/47519d29-aeeb-40ed-b6ec-c17b550f13e0.progress.jpg" alt="">
                                    </a>
                                </li>
                            </ul>
                            <div class="more-view">
                                <button class="more-view-recbtn">오늘의 핫플콕콕 추천</button>
                                <a href="#" class="more-view-btn">더보기</a>
                            </div>
                        </div>
                    </li>
                    
                </ul>
                    
            </div>
            
        </div>
        <!-- 메인 콕콕 -->
        <div class="main-choice">
            <div class="choice-box clearfix">
                <div class="choice-left">
                    <img src="./semi_ahn_img/curation-logo-title.png" alt="">
                    <div class="btn-box">
                        <a href="#" class="choice-btn lodging">숙박</a>
                        <a href="#" class="choice-btn restraunt">식당</a>
                        <a href="#" class="choice-btn place">명소</a>
                        
                    </div>
                    <div class="swiper mySwiper2 lodging">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <a href="#" class="choice-item">
                                    <img class="item-img" src="./semi_ahn_img/hotel1.jpg" />
                                    <span>호텔1</span>                                    
                                </a>

                            </div>
                            <div class="swiper-slide">
                                <a href="#" class="choice-item">
                                    <img class="item-img" src="./semi_ahn_img/hotel2.jpg" />
                                    <span>호텔2</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="#" class="choice-item">
                                    <img class="item-img" src="./semi_ahn_img/hotel3.jpg" />
                                    <span>호텔3</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="#" class="choice-item">
                                    <img class="item-img" src="./semi_ahn_img/hotel4.jpg" />
                                    <span>호텔4</span>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="swiper mySwiper2 restraunt" style="display: none;">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/food1.jpg" />
                                    <span>식당1</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/food2.jpg" />
                                    <span>식당2</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/food3.jpg" />
                                    <span>식당3</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/food4.jpg" />
                                    <span>식당4</span>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="swiper mySwiper2 place" style="display: none;">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/place1.jpg" />
                                    <span>장소1</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/place2.jpg" />
                                    <span>장소2</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/place3.jpg" />
                                    <span>장소3</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="">
                                    <img src="./semi_ahn_img/place4.jpg" />
                                    <span>장소4</span>
                                </a>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    
                </div>
                
                <div class="choice-right">
                    <h3 style=" text-align: center; color: #6b7175;">나만의 코스 정하기</h3>
                    <ul class="daily-list">
                        <li class="daily-item item1"></li>
                        <li class="daily-item item2"></li>
                        <li class="daily-item item3"></li>
                        <li class="daily-item item4"></li>
                        <li class="daily-item item5"></li>
                        <li class="daily-item item6"></li>
                    </ul>
                    <div class="daily-service">
                        <span class="daily-plus"><a href=""> 저장하기</a></span>
                        <span class="daily-rst"><a href="">초기화</a></span>
                        <span class="daily-map"><a href="">지도에서 확인하기</a></span>
                    </div>

                </div>
            </div>
        </div>
        <!-- 메인 스페셜에디션  1차 완료-->
        <div class="main-special" style="height: 560px;">
            <div class="special-inner">
                <div class="special-container clearfix">
                    <div class="special-left">
                        <div class="special-banner">
                            <a href="#"><img class="special-img" src="./semi_ahn_img/ea603ba0-cc83-4348-8289-c2a216dc943d.png" alt=""></a>
                        </div>
                        <div class="special-article">
                            <div class="special-arttitle">
                                <span>콕콕 전달 사항</span>
                                <a href="#"> <span class="arttitle-btn"></span></a>
                            </div>
                            <ul class="special-artlist">
                                <li class="special-artitem">
                                    <a href="#">
                                        <em style="color: #a2660d;"> 3월 불량이용자 발표 |</em>불량이용자 제제 목록입니다
                                    </a>
                                </li>
                                <li class="special-artitem">
                                    <a href="#">
                                        <em style="color: #a2660d;"> 3월 3일(금)까지 |</em> 농촌여행 청년 기획가 공모
                                    </a>
                                </li>
                                <li class="special-artitem">
                                    <a href="#">
                                        <em style="color: #a2660d;"> 2월 추천 여행지ㅣ</em>예향 전남의 역사문화 숨결 즐기세요
                                    </a>
                                </li>
                                <li class="special-artitem">
                                    <a href="#">
                                        <em style="color: #a2660d;"> 부산ㅣ</em> 숨이 막히도록 아름다운 부산 ‘워케이션 거점센터’ 개소!
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="special-right">
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">                        
                                    <ul class="special-swipperlist">
                                        <li class="special-swipperitem">
                                            <ul class="swipperitem" style="width: 465px;">
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">                        
                                    <ul class="special-swipperlist">
                                        <li class="special-swipperitem">
                                            <ul class="swipperitem" style="width: 465px;">
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">                        
                                    <ul class="special-swipperlist">
                                        <li class="special-swipperitem">
                                            <ul class="swipperitem" style="width: 465px;">
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">                        
                                    <ul class="special-swipperlist">
                                        <li class="special-swipperitem">
                                            <ul class="swipperitem" style="width: 465px;">
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                                <li class="inneritem">
                                                    <a href="#"><img src="./semi_ahn_img/dc0fb47e-e59c-49b7-bc89-b87946c25e6e.png" alt=""></a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                </div>
            </div>
        </div>
        <!-- 메인 테마 1차완료  -->
        
        </div>
        <!-- 메인 테마  -->
        <div class="main-theme-container">
            <div class="theme-inner clearfix">
                <h2 class="theme-title">함께 떠나는 테마 힐링 여행</h2>
                <div class="theme-left">
                    <a href="#" class="theme-article">
                        <h3>아이와 추억하는 특별한 여행 <br>경기 수원 박물관 투어</h3>
                        <img src="./semi_ahn_img/e9ff7f9f-99ce-41b8-a0b6-4f3143d0c6b8.png" alt="">
                    </a>
                    <a href="#" class="theme-article">
                        <h3>맛있는 찜질방 <br>귀여운 양머리투어</h3>
                        <img src="./semi_ahn_img/46c4df2e-0ebe-4298-8bf1-7570863211c9.png" alt="">
                    </a>
                </div>
                <div class="theme-mid">                   
                    <a href="#" class="theme-article">
                        <h3>애인과 함께 <br>이쁜 야경투어</h3>
                        <img src="./semi_ahn_img/d85d9f1f-8051-4e7d-a8f3-c3efe86d7bd9.png" alt="">
                    </a>
                    <a href="#" class="theme-article">
                        <h3>아이와 추억하는 특별한 여행 <br>경치가 되게 좋아요</h3>
                        <img src="./semi_ahn_img/d6daf862-3552-4d57-96ed-34775bcd91d1.png" alt="">
                    </a>
                </div>
                <div class="theme-right">
                    <a href="#" class="theme-article">
                        <h3>아이와 추억하는 특별한 여행 <br>경기 수원 박물관 투어</h3>
                        <img src="./semi_ahn_img/46c4df2e-0ebe-4298-8bf1-7570863211c9.png" alt="">
                    </a>
                    <a href="#" class="theme-article">
                        <h3>노을 이쁘죠! <br>바다 보러가요 ㅎㅎ</h3>
                        <img src="./semi_ahn_img/4db9b6b6-e84b-468b-af65-0c709bf19c2e.png" alt="">
                    </a>
                </div>
            </div>
        </div>
</div>
</body>
</html>