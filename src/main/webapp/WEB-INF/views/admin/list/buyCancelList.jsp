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
		.qna_title{
		width:30%;
		}
		.qna_title>a{
		color:black;
		}
		tbody{
		  overflow: hidden;
		  white-space: nowrap;
		  text-overflow: ellipsis;
		}
	
	    </style>
	<div class="container">
	<h3>문의 조회</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>결제상태</th>
					<th>결제날짜</th>
					<th>결제가격</th>
					<th>적립 마일리지</th>
					<th>사용 마일리지</th>
					<th>등록 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="li">
					<tr>
						<td>${li.bl_state }</td>
						<td class="qna_title">${li.bl_date }</td>
						<td>${li.bl_total_price }</td>
						<td>${li.bl_stack_mile }</td>
						<td>${li.bl_use_mile }</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${i}'/>">${i+1}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>

	
    