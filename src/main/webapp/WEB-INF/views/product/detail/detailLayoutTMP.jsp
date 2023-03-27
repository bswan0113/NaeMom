<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>임시 상세페이지 입니다.</title>
${user }
${data.list}
<div class="container-fluid">
<h1 style="text-align: center; font-weight:bold">${product.pd_title}</h1><br>
<h3 style="text-align: center;">${product.pd_subtitle}</h3>
<div style="float: right;" class="service-box">
	
	
	<button style="color:
		<c:if test="${wish.wi_num!=null}">red</c:if>
		<c:if test="${wish.wi_num==null}">black</c:if>;" 
		id="wish-btn"><i class="fas fa-heart"></i>
	</button>
	<i class="fas fa-star" style="margin-right: 0;"></i>
	<span class="star-rating">${rating}</span>
	<i style="margin-right: 0;"class="fas fa-eye"></i>
	<span class="view-count">${product.pd_viewcount}</span>
</div>
<br>
<hr>
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
		<c:forEach items="${files}" var="file">
	    	<div id="image" class="swiper-slide">
				<div class="form-group mt-3" >
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
			<div>오픈 시간 : ${product.pd_open_time_str}</div>
			<div>마감 시간 : ${product.pd_close_time_str}</div>
		</div>
		<div style="height:600px">
			옵션 Get완료// jsp분할 후 배치 진행
			${option}
			
			
		</div>
	</div>
	<hr>
</div>
</div>
<h4>  내맘대로 톡톡</h4>
<div class="comment-box"> 
	<div class="insert-comment-box">
	 	<div class="star-rating-box" style="float:left; margin:8px;">	 	
	        <div class="stars">
	        	<span>평점 : </span>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	            <i class="fa fa-star"></i>
	        </div>
	    </div>
		<textarea class="insert-window" name="comment" id="comment" placeholder="댓글을 남겨주세요"></textarea>
		<input type="file" class="form-control" id="insert-re-file">
		<button class="comment-btn comment-ins">톡톡 등록</button>
		<button class="comment-btn comment-cancle" type="reset">등록 취소</button>
	</div>
	<div class="comment-list">
		<c:if test="${review==null}">
		<span class="mt-6" style="color: #dae1e6; text-align: center; line-height:500px;">현재 작성된 리뷰가 없습니다.</span>
		</c:if>
		
	</div>
	<ul class="comment-pagination pagination justify-content-center">
		<li class="page-item">
			<a class="page-link" href="#">이전</a>
		</li>
	    <li class="page-item">
	    	<a class="page-link" href="#">1</a>
	    </li>
	    <li class="page-item">
	    	<a class="page-link" href="#">다음</a>
	    </li>
	</ul>
<hr>	
</div>
<hr>
<br>
<h4 style="margin-bottom:30px;">P들을 위한 콕콕추천!</h4>
<div class="recommend-box">
	<ul style="display: inline-block;" class="random-list">
		<c:forEach begin="0" end="4" var="i">
			<li class="random-item">
				<a class="random-link" href="<c:url value='/product/detail/detailLayoutTMP/${randomProduct.get(i).pd_num}'></c:url>">
					<img src="<c:url value="/download${random.get(i).fi_name}"></c:url>" height="200" width="200">
					<span class="random-title">${randomProduct.get(i).pd_title}</span>
				</a>
			</li>
		</c:forEach>	
	</ul>
	<ul style="display: inline-block;" class="random-list">
		<c:forEach begin="5" end="9" var="j">
			<li class="random-item">
				<a class="random-link" href="<c:url value='/product/detail/detailLayoutTMP/${randomProduct.get(j).pd_num}'></c:url>">
					<img src="<c:url value="/download${random.get(j).fi_name}"></c:url>" height="200" width="200">
					<span class="random-title">${randomProduct.get(j).pd_title}</span>
				</a>
			</li>
		</c:forEach>	
	</ul>
</div>
<hr>
<br>
<style>

.star-rating div {
    float: left;
    width: 50%;
}
.stars {
}
.stars .fa {
    font-size: 18px;
    cursor: pointer;
}
.stars .fa.active {
    color: gold;
    text-shadow: 0 0 5px yellow;
}


	.stars .fa-star{
	color:white;
	}
	#insert-re-file{
		background-color: #d4ebd4;
		border: none;
	}
	#wish-btn{
		border:none;
		background-color:white;
	}
	 .fa-heart:hover{
	 opacity: 0.7;
	}
.comment-box{

width: 100%;
height : 700px;

}

.view-count, .star-rating{
vertical-align: 5px;
}

h4{
font-weight:bold;
}
	.comment-list{
	text-align:center;
	}

	.random-item{
		float: left;
		border: 1px solid #dae1e6;
		margin-left: 10px;
	}
	.random-list::after, .service-box::after{
		content: ''; clear: both; display: block;
	}
	.random-link{
	position: relative; width: 100%; height: 100%; display:inline-block; z-index:9;
	}

	.random-title{
		width: 100%;
		position: absolute;
		bottom: 0;
		left: 0;
		text-align: center;
		color: black;
		font-weight: bold;
		z-index: 10;
		font-size:20px;
	}

	.fas{
	font-size : 25px;
	margin-right : 12px;
	}
.info-detail-box >div{
	font-size: 15px;
}


.insert-comment-box{
	height: 200px;
	width: 900px;
	background-color:  #d4ebd4;
	position: relative;
	text-align: center;
	margin : 0 auto;
	border: 3px solid #29c16d72;
	border-radius: 5px;
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
	margin-bottom: 10px;
	margin-top:10px;
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
}

.comment-list{
min-height: 500px;
}

</style>


<script>
let cri = {
		page : 1,
		perPageNum : 5
	};
selectReviewList(cri);

let starRate=0;
$('.stars .fa').click(function() {
    $(this).addClass('active');

    // 클릭한 별을 기준으로 (.fa) 그 이전 별은 보이게 그 뒤에 별들은 안보이게
    $(this).prevAll().addClass('active');
    $(this).nextAll().removeClass('active');

    // 순서를 찾는 메서드 index 0 1 2 3 4
    // 텍스트내용을 출력 text, 태그+텍스트 html
    starRate = $(this).index();
});

	$('#wish-btn').click(function(){
		if('${user.me_id}' == ''){
			
			alert('로그인 하세요.');
		}
	let li_state=1
	if('${wish.wi_num}'!='')li_state=-1;
	let pd_num=${product.pd_num};
	let url='<c:url value="/product/like/"></c:url>'+pd_num+'/'+ li_state;
	ajaxGet('get',url,function(data){
		
		if(data.res==1) {
			$('#wish-btn').css('color', 'red');
			alert('찜목록에 추가되었어요!');
			};
		if(data.res==-1){
			$('#wish-btn').css('color', 'black');
			alert('찜을 취소했어요!');
			};
	})
	});
	
	
	$('.comment-ins').click(function(){
		if('${user.me_id}' == ''){			
			alert('로그인 하세요!');
			return;
		}
		re_content = $('.insert-window').val();
		if(re_content.trim().length==0){
			alert('내용을 입력해주세요!');
			return;
		}
		let review={
			re_me_id : "${user.me_id}",
			re_content : re_content,
			re_rating : starRate,
			re_pd_num : "${product.pd_num}" 
			
		};
		if(starRate==0){
			alert('별점이 없으면 리뷰등록이 불가능해요!');
		}
		if($('.insert-window').val().trim().lenth ==0){
			alert('내용을 입력해주세요!');
			return;
		}
		ajaxPost(true,review,'<c:url value="/review/insert"></c:url>',function(data){
			
			var formData = new FormData();
			var inputFile = $('#insert-re-file');
			var files = inputFile[0].files;
			for( var i=0; i<files.length;i++){
				formData.append("uploadFile",files[i]);
			}
			$.ajax({
				url :'<c:url value="/review/insert/file/'+data.re_num+'/'+data.re_pd_num+'"></c:url>',
				processData : false,
				contentType : false,
				data : formData,
				type: "POST",
				success : insertSuccess
			});
		})
	})
	
function addPagination(pm){
		let prev = pm.prev ? '' : 'disabled';
		let next = pm.next ? '' : 'disabled';
		str = '';
		str += 
		'<li class="page-item '+prev+'">'+
			'<a class="page-link" href="#" data-page="'+(pm.startPage-1)+'">이전</a>'+
		'</li>';
		for(i=pm.startPage; i<=pm.endPage; i++){
			let page = pm.cri.page == i ? 'active' : '';
			str +=
			'<li class="page-item '+page+'">'+
				'<a class="page-link" href="#" data-page="'+i+'">'+i+'</a>'+
			'</li>';
		}
		str +=
		'<li class="page-item '+next+'">'+
			'<a class="page-link" href="#" data-page="'+(pm.endPage+1)+'">다음</a>'+
		'</li>';
		$('.comment-pagination').html(str);
		//페이지네이션 이벤트 등록
		$('.comment-pagination .page-link').click(function(e){
			e.preventDefault();
			let page = $(this).data('page');
			cri.page = page;
			selectReviewList(cri);
		});
	}

function addReviewList(list){
	str = ''
		for(i = 0; i<list.length; i++){
			str += createReview(list[i]);
			$('.comment-list').html(str);
		}
}
function createReview(review){
	str = '';
	str += 
	'<div class="">'+
		'<div class="">'+review.re_me_id+'</div>'+
		'<div class="">'+review.re_content+'</div>'+
		'<div class="">'+review.re_rating+'</div>'+
		'<div class="">'+review.re_date+'</div>'+
		'<div class="">'+review.re_update_date+'</div>'+
	'</div>';
	return str;
}
	
function listSuccess(data){
	addReviewList(data.list);
	addPagination(data.pm);
}
	
function selectReviewList(cri){
		ajaxPost(false,cri,'<c:url value="/review/list/'+${product.pd_num}+'"></c:url>', listSuccess)
	}
function insertSuccess(data){
	if(data.res){
		alert('댓글을 등록했습니다.');
	}else{
		alert('댓글 등록에 실패했어요!');
	}
	cri.page = 1;
	selectReviewList(cri);
}
	
	
//ajax메서드
function ajaxPost(async, obj, url, successFunction){
	$.ajax({
		async:async,
		type: 'POST',
		data: JSON.stringify(obj),
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunction
	});
}
		
	
function ajaxGet(method, url, successFunc){
	$.ajax({
		async:false,
		type: method,
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunc
	});
}
</script>

  <script>
    var swiper = new Swiper(".mySwiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
    
    
  </script>
