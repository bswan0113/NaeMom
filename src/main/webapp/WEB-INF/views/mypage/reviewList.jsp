<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	    <style>
	   		.table-striped tbody tr:nth-of-type(odd) {
			background-color: #f9f9f9;
		}
		.table-hover tbody tr:hover {
			background-color: #e6e6e6;
		}
		.review_title{
		width:50%;
		}
		.review_title>a{
		color:black;
		}
		tr{
		display:flex;
		}
		th, td{
		width:20%;
		text-align:center;
		line-height:63px;
		}
		td >a{
		color:black;
		font-weight:bold;
		}
		
		td:nth-child(2){
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
		}
	
	    </style>
	    
	<div class="container">
	<h3>후기 조회</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>상품제목</th>
					<th>리뷰내용</th>
					<th>별점</th>
					<th>작성날짜</th>
					<th>수정날짜</th>
					<th>  </th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${review}" var="re">
					<tr>
						<td><a href="<c:url value='/product/detail/detailLayoutTMP/${re.re_pd_num}'></c:url>">${re.pd_title}</a></td>
						<td>${re.re_content}</td>
						<td>${re.re_rating}</td>
						<td>${re.re_date_str}</td>
						<td>${re.re_update_date_str}</td>
						<td><button class="btn btn-success btn-delete" data-num="${re.re_pd_num}">리뷰삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/mypage/reviewList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/mypage/reviewList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/mypage/reviewList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>

	
<script>
	let cri={
		page : 1,
		perPageNum : 5			
	}
	
	$(document).on("click",".btn-delete",function(){
		if(!confirm('삭제하시겠어요?')) return;
		let re_num = $(this).data('num');
		let review ={
				re_num: re_num
		}
		$.ajax({
			 type: 'POST',
	    	  data: JSON.stringify(review),
	    	  url: "<c:url value='/review/delete'></c:url>",
	    	  dataType: "json",
	    	  contentType: "application/json; charset=UTF-8",
	    	  success: function(data){
	    		  if(data.res){
	    			  alert('삭제완료!');
	    			  location.reload();
	    		  }else{
	    			  alert('삭제실패!');
	    			  location.reload();
	    		  }
	    	  }
		})
	})
</script>
    