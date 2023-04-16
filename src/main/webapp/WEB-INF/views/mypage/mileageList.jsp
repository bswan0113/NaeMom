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
		.mileage_title{
		width:50%;
		}
		.mileage_title>a{
		color:black;
		}
		tr{
		display:flex;
		}
		th, td{
		width:30%;
		text-align:center;
		line-height:63px;
		}
		td >a{
		color:black;
		font-weight:bold;
		}
	
	    </style>
	    
	<div class="container">
	<h3>마일리지 내역 조회</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>적립/사용금액</th>
					<th>적립/사용날짜</th>
					<th>만료일</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${mile}" var="mi">
					<tr>
					<td>${mi.mi_update}</td>
					<td>${mi.mi_date_str}</td>
					<td>
						<c:if test="${mi.mi_update >= 0}">
						  ${mi.getMiDateAfterFiveYears()}
						</c:if>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/mypage/mileageList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/mypage/mileageList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/mypage/mileageList?page=${pm.startPage+1}'/>">다음</a>
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
    