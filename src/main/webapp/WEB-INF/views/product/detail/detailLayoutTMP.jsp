<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>임시 상세페이지 입니다.</title>

<div class="container-fluid">


<h1 style="text-align: center; font-weight:bold">${product.pd_title}</h1><br>
<h3 style="text-align: center;">${product.pd_subtitle}</h3>
<div style="float: right;">${product.pd_viewcount}</div>
<br>
<hr>
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
		<c:forEach items="${files}" var="file">
	    	<div id="image" class="swiper-slide">
				<div class="form-group mt-3">
					<img class="rounded" src="<c:url value="/download${file.fi_name}"></c:url>" height="800" width="auto">
				</div>
			</div>
		</c:forEach>
    </div>
   </div>




<div class="form-group detail-box">
	<h4 style="font-weight: bold;">상세정보</h4>
	<hr style="font-weight: bold;">
	<div>${product.pd_content}</div>
	<hr>
	<div class="information-box">
		<div style="height: 300px; width:100%;display:inline-block; border:1px black solid">지도배치 예정</div>
		<div class="info-detail-box">
			<div>도로명 주소 : ${product.pd_street_address} ${product.pd_detail_address}</div>
			<div>지번 주소 : ${product.pd_registerd_address} ${product.pd_detail_address}</div>			
			<div>주차 가능 여부 : ${product.pd_parking}</div>
			<div>최대 인원 : ${product.pd_capacity}명</div>		
			<div>오픈 시간 : ${product.pd_open_time}</div>
			<div>마감 시간 : ${product.pd_close_time}</div>
		</div>
		<div style="height:600px">
			기타 상세 옵션 정보 노출 예정↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		</div>
	</div>
	<hr>
</div>
</div>
<h4>  내맘대로 톡톡</h4>
<div class="comment-box">
	<div class="insert-comment-box">
		<input class="insert-window" type="text" name="comment" id="comment" placeholder="댓글을 남겨주세요">
		<a class="comment-btn comment-ins" href="#">댓글 등록</a>
		<a class="comment-btn comment-cancle" href="#">등록 취소</a>
	</div>
	<div class="comment-list">
		<span class="mt-6" style="color: #dae1e6; text-align: center;">현재 작성된 댓글이 없습니다.</span>

	</div>	
</div>
<hr>
<br>
<div class="recommend-box">랜덤추천 여행지 구현예정
	<ul>
		<c:forEach items="${random}" var="thum">
			<img class="rounded" src="<c:url value="/download${thum.fi_name}"></c:url>" height="200" width="auto">
		</c:forEach>	
		<c:forEach items="${randomProduct}" var="rm">
			<a>${rm.pd_title}</a>
		</c:forEach>
	</ul>
</div>
<hr>
<br>
<style>
.info-detail-box >div{
	font-size: 15px;
}


.insert-comment-box{
	height: 170px;
	width: 900px;
	background-color:  #d4ebd4;
	position: relative;
	text-align: center;
}
.insert-comment-box::after{
	content: ''; clear: both; display: block;
}
.comment-box .insert-window{
	border: 5px;
	border:2px solid #29c16d72;
	height: 90px;
	width: 770px;
	padding: 8px;
	margin: 30px;
	font-size: 16px;
	line-height: 16px;
}
.comment-box .comment-btn{
	border-radius: 4px;
	position: absolute;
	color: white;
	background-color: #29c16d72;
	font-weight: bold;
	font-size: 20px;
	text-decoration: none;
	border: #d4ebd4 1px solid;
	height: 30px;
	bottom: 7px;
	right: 7px;
}
.comment-box .comment-ins{
	right: 95px;
}
.recommend-box{
	width: 100%;
	height: 500px;
	border: 1px solid #dae1e6;
}

</style>

  <script>
    var swiper = new Swiper(".mySwiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>
