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
	                        <a href="<c:url value='/product/detail/${product_checked.pd_num}'></c:url>" class="content-btn">둘러보기</a>
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
        <h2>배너</h2>
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
                    	<img class="" style="width:100%; height:100%; object-fit: contain;" src="<c:url value='/download${file_checked.fi_name}'></c:url>">
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="main-container-third">
	<section class="recent-products">
		<div class="third-title title">
			<h2>최근 본 상품</h2>
		</div>
		<div class="container-recently-viewed">
			<div class="recently-viewed-product">
				<ul class="recently-viewed-list">
					<c:forEach var="product" items="${recentProducts}" varStatus="status">
						<c:if test="${status.index <= 3}">
						<li>
							<span class="product-image">
								<img src="${product.file.fi_name}" alt="${product.pd_name}" style="width: 55px; height: 55px;">
							</span>
							<span class="product-name">${product.pd_name}</span>
							<span class="product-detail">
								<a href="<c:url value="${pageContext.request.contextPath}/product/detail/${product.pd_num}"></c:url>">상세보기</a>
							</span>
						</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
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
