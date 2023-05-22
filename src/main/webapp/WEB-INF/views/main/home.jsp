<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>NaeMom</title>

<script src="<c:url value='/resources/js/home.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/home.css?ver=1.3'></c:url>">
<div class="main-container-first">
    <c:if test="${user.me_authority >= 9}">
    <div class="btn-container">
    	<a href="/naemom/main/insert/" class="insertContent-btn btn btn-secondary" style="margin-bottom: 30px;">등록하기</a>
    </div>
    </c:if>
    <div class="swiper first-contents">
        <div class="swiper-container mySwiper">
            <div class="swiper-wrapper contents-wraper">
                <c:forEach items="${plist}" var="product_checked">
                <div class="swiper-slide contents-img" style="min-width: 270px; height: 270px">
                    <a href="#">
                    	<img class="" style="width:100%; height:100%;" src="<c:url value='/download${product_checked.file.fi_name}'></c:url>">
                    </a>
	                    <div class="contents-detail">
	                   		
	                        <div class="title-wraper">
	                            <span class="contents-title">${product_checked.pd_title}</span>
	                        </div>
	                        <span class="content">${product_checked.pd_street_address}</span>
	                        <a href="<c:url value='/product/detail/detailLayoutTMP/${product_checked.pd_num}'></c:url>" class="content-btn">둘러보기</a>
	                    </div>
                </div>
                </c:forEach>
            </div>
            <button class="swiper-button-prev btn-prev btn-pin" style="border: 1px solid white;width: 50px;height: 50px;border-radius: 50px;background: #fea600e3;--swiper-navigation-size: 50px;color: white;"></button>
            <button class="swiper-button-next btn-next btn-pun" style="border: 1px solid white;width: 50px;height: 50px;border-radius: 50px;background: #fea600e3;--swiper-navigation-size: 50px;color: white;"></button>
        </div>
    </div>
</div>

<div class="main-container-fourth">
	<div class="second-title title">
        <h2>내맘대로 코스</h2>
    </div>
    <div class="course-contents">
    	<c:forEach items="${clist}" var="course" varStatus="vs">
    		<c:if test="${vs.index <= 2}">
				<c:if test="${course.co_report < 10 }">
					<div class="course_list">
						<div class="course_desk">
							<a href="<c:url value='/course/detail/${course.co_num }'></c:url>"><strong>${course.co_title}</strong>
								<ul class="box_distance">
									<li>
										조회수 : <span>${course.co_views }</span> 추천수 : <span>${course.co_up }</span>
									</li>
									<li>
										총거리 : <span>${course.co_total_distance }</span>km
									</li>
								</ul>
								<span class="userInfo">
									<em>${course.co_me_id }</em>
								</span>
							</a>
							<c:forEach items="${courseFiles}" var="fi">
								<c:forEach items="${items}" var="item">
									<c:if test="${fi.fi_table_key == item.ci_pd_num && course.co_num == item.ci_co_num && item.ci_index == 1}">
										<img src="<c:url value='/download${fi.fi_name}'></c:url>" alt="" class="course_item_img">
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
						<ul>
							<c:forEach items="${items}" var="item">
								<c:if test="${course.co_num == item.ci_co_num}">
									<li>
										<span>
												<a href="#">${item.pd_title }</a>
										</span>
									</li>
								</c:if>
							</c:forEach>
							
						</ul>
					</div>
				</c:if>
			</c:if>
		</c:forEach>
    </div>
</div>
<div class="main-container-fifth">
	<div class="second-title title">
        <h2 style="margin-top : 30px; margin-bottom : 50px;">내맘대로 축제</h2>
    </div>
	<div class="container mb-5 pb-5 mt-3 festival-container">
		<div class="row">
			<c:forEach items="${festivalList}" var="festivalList" varStatus="vs">
				<c:if test="${vs.index <= 2}">
				<div class="col-12 col-sm-6 col-md-4 p-2 ">
				<a href="<c:url value='/product/detail/detailLayoutTMP/${festivalList.pd_num }'></c:url>">
					<div class="festival-box">
						<c:forEach items="${festivalFiles}" var="file">
						<c:if test="${file.fi_table_key == festivalList.pd_num}">
							<div class="festival-img pt-0 pb-2">
								<img src="<c:url value="/download${file.fi_name}"></c:url>">
							</div>
						</c:if>
						</c:forEach>
						<div class="festival-info">
							<div class="festival-title">
								<p>${festivalList.pd_title}</p>
							</div>
							<div class="festival-content mb-0">
								<p>${festivalList.pd_content}</p>								
							</div>
						</div>
					</div>
				</a>
				</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<div class="form-group gpt-box">
	<input class="form-control gpt-ask" type="search" placeholder="gpt에게 질문하세요!">
	<button class="btn btn-success btn-gpt" style="width:100%;">질문하기</button>
	<div class="res-gpt" style="border:2px solid white; min-height:88px; line-height:40px; background:#dae1e6; padding:4px;">
	</div>
</div>
<div class="main-container-second">
    <c:if test="${user.me_authority >= 9}">
    <div class="btn-container">
    	<a href="/naemom/main/addimage/" class="addimage-btn btn btn-secondary">이미지 등록하기</a>
    </div>
    </c:if>
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
<!-- swiper -->
<script>

$(document).on("click", ".btn-gpt", function() {
	  let ask = $('.gpt-ask').val();
	  $('.res-gpt').text("답변중입니다. 잠시 기다려주세요.");
	  $.ajax({
		aysnc:false,
	    url: "<c:url value='/gpt/ask'></c:url>",
	    method: "POST",
	    data: {
	      ask: ask
	    },
	    success: function(data) {
	    	$('.res-gpt').text(data.res);
	    },
	  });
	  
	});
 
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    loop: true,
    autoplay: { 
        delay: 9000, 
    },
    spaceBetween: 30,
    keyboard: {
      enabled: true,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    }
  });
</script>
<script>

var swiper = new Swiper('.bannerSwiper', { 
  centeredSlides: false,
  loop : true,
  autoplay: { 
      delay: 10000, 
  }
});
</script>

<!-- 최근 본 상품 -->
<script>


//쿠키 값 가져오기 함수
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) {
        return parts.pop().split(";").shift();
    }
}
	
    var recentProduct = getCookie("recentProducts");
    if (recentProduct != null && recentProduct != "") {
        // recentProduct 쿠키가 존재하는 경우
    document.write("<div class="+"main-container-third"+">");
 		document.write("<section class="+"recent-products"+">");
			document.write("<div class="+"third-title title"+">");
				document.write("<h2>최근 본 상품</h2>");
		 	document.write("</div>");
		 	document.write("<div class="+"container-recently-viewed"+">");
				document.write("<div class="+"recently-viewed-product"+">");
					document.write("<ul class="+"recently-viewed-list"+">");
				        <c:forEach var="product" items="${recentProducts}" varStatus="status">
				            <c:if test="${status.index <= 4}">
				                document.write("<li>");
					                document.write("<div class='product-image'>");
					                	document.write("<img src=\"<c:url value='/download${product.file.fi_name}'></c:url>\" alt=\"${product.pd_title}\" style=\"width: 55px; height: 55px;\">");
					               	document.write("</div>");
					               	
					               	document.write("<div class='product-text-box'>");
					                document.write("<span class='product-name'>" + "${product.pd_title}" + "</span>");
					                document.write("<p class='product-detail'>");
					               		document.write("<a href='/product/detail/detailLayoutTMP/" + "${product.pd_num}" + "'>상세보기</a>");
					                document.write("</span>");
					                document.write("</div>");
				                document.write("</li>");
				            </c:if>
				        </c:forEach>
			        document.write("</ul>");
		        document.write("</div>");
	        document.write("</div>");
        document.write("</section>");
	document.write("</div>");	
    } else {
        // recentProduct 쿠키가 존재하지 않는 경우
        document.write("<div class="+"main-container-third"+">");
 		document.write("<section class="+"recent-products"+">");
			document.write("<div class="+"third-title title"+">");
				document.write("<h2>최근 본 상품</h2>");
		 	document.write("</div>");
		 	document.write("<div class="+"container-recently-viewed"+">");
				document.write("<div class="+"recently-viewed-product"+">");
					document.write("<ul class="+"recently-viewed-list"+">");
		        document.write("최근 본 상품이 없습니다.");
		        document.write("</ul>");
		        document.write("</div>");
		    document.write("</div>");
		document.write("</section>");
		document.write("</div>");
    }
	
    // 쿠키 가져오는 함수
    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length == 2) return parts.pop().split(";").shift();
    } 
</script>

