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
			.wish_title{
			width:50%;
			}
			.wish_title>a{
			color:black;
			}
			tr{
			display:flex;
			}
			th, td{
			width:33.33%;
			text-align:center;
			line-height:63px;
			}
			td >a{
			color:black;
			font-weight:bold;
			}
			
	   </style>
	    
	<div class="container">
	<h3>찜 목록</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>  </th>
					<th>  </th>
					<th>  </th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${wishList}" var="wi">
					<tr>
						<td><a href="<c:url value='/product/detail/detailLayoutTMP/${wi.wi_pd_num}'></c:url>"><img src="<c:url value='/download${wi.product.file.fi_name}'></c:url>" width="300px;" height="300px;"></a></td>
						<td><a style="line-height:300px;" href="<c:url value='/product/detail/detailLayoutTMP/${wi.wi_pd_num}'></c:url>">${wi.product.pd_title}</a></td>
						<td style="line-height:300px;"><button class="btn btn-success btn-delete" data-num="${wi.wi_pd_num}">찜 취소</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/mypage/wishList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/mypage/wishList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/mypage/wishList?page=${pm.startPage+1}'/>">다음</a>
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
		let pd_num = $(this).data('num');
		if(!confirm('삭제하시겠어요?'))return;
		let url='<c:url value="/product/like/"></c:url>'+pd_num+'/-1';
		
		$.ajax({
			async:false,
			type: "GET",
			url: url,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('찜이 취소되었어요!')
					location.reload();
				}else{
					alert('찜취소에 실패했어요!')
					location.reload();
				}
			}
		})
	})
	
</script>
    