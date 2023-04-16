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
			td >a{
			color:black;
			font-weight:bold;
			}
			
	   </style>
	    
	<div class="container">
	<h3>결제/이용 목록</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>결제 정보</th>
					<th>이용구분</th>
					<th style="width:250px;">결제 날짜</th>
					<th>총 가격</th>
					<th>총 결제 가격</th>
					<th>적립 마일리지</th>
					<th>사용 마일리지</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${buyList}" var="bl">
					<tr>
						<td><a href="${bl.bl_num}" class="btn btn-success">결제정보 확인</a></td>
						<td>${bl.bl_state}</td>
						<td style="width:250px;">${bl.bl_date_str}</td>
						<td>${bl.bl_total_price}</td>
						<td>${bl.bl_price}</td>
						<td>${bl.bl_stack_mile}</td>
						<td>${bl.bl_use_mile}</td>
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
	

	
</script>
    