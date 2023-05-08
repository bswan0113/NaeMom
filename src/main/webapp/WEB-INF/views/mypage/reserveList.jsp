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
			.reserve_title{
			width:50%;
			}
			.reserve_title>a{
			color:black;
			}
			tr{
			display:flex;
			}
			th, td{
			width:18%;
			text-align:center;
			line-height:63px;
			}
			td > button{
			color:black;
			font-weight:bold !important;
			}
			td{
			overflow:hidden;
			white-space:nowrap;
			  text-overflow: ellipsis;
			}
				
	   </style>
	    
	<div class="container">
	<h3>결제/이용 목록</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>이용구분</th>
					<th style="width:250px;">결제 날짜</th>
					<th>총 결제 가격</th>
					<th>적립 마일리지</th>
					<th>사용 마일리지</th>
					<th>결제 정보</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${buyList}" var="bl">
					<tr>
						<td class="bl_state">${bl.bl_state}</td>
						<td style="width:250px;">${bl.bl_date}</td>
						<td>${bl.bl_total_price}</td>
						<td>${bl.bl_stack_mile}</td>
						<td>${bl.bl_use_mile}</td>
						<td>
							<input type="hidden" name="bl_num" value="${bl.bl_num }">
							<button class="btn btn-danger btn_cancel">결제취소요청</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/mypage/reserveList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/mypage/reserveList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/mypage/reserveList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>

	
<script>
	let cri={
		page : 1,
		perPageNum : 5			
	}
	var num = "";
	$('.btn_cancel').click(function(){
		num="";
		let bl_num = $(this).siblings('[name=bl_num]').val()
		if(confirm('해당 결제를 취소하겠습니까?')){
			ajaxPost(bl_num, '<c:url value="/mypage/buyCancel"></c:url>', buyCancel);
		}
		if(num == bl_num){
			let state = $(this).parent().siblings('.bl_state').text('결제취소중');
			$(this).attr('disabled',true);
			$(this).css('background-color','grey');
		}
	})
	function buyCancel(data){
		if(data.res == 1){
			alert('결제취소요청을 완료하였습니다.');
			num = data.bl_num;
		}
	}
	//ajax
	function ajaxPost(obj, url, successFunction){
		$.ajax({
			async:false,
			type: 'POST',
			data: JSON.stringify(obj),
			url: url,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : successFunction
		});
	}
</script>
    