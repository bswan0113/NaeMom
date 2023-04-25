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
			.course_title{
			width:50%;
			}
			.course_title>a{
			color:black;
			}
			tr{
			display:flex;
			}
			th, td{
			width:18%;
			text-align:center;
			}
			td{
			line-height:200px;
			}
			td >a{
			color:black;
			font-weight:bold;
			}
			
			td:nth-child(4){
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
			}
			
	   </style>
	    
	<div class="container">
	<h3>작성 코스 목록</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>코스 구분</th>
					<th>일정 구분</th>
					<th></th>
					<th>코스 제목</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${cor}" var="co">
					<tr>
						<td>${co.cc_category_name}</td>
						<td>${co.cs_schedule_name}</td>
						<td><a href="<c:url value='/course/detail/${co.co_num}'></c:url>"><img width="200px;" height="200px;" src="<c:url value='/download${co.file.fi_name}'></c:url>"></a></td>
						<td><a href="<c:url value='/course/detail/${co.co_num}'></c:url>">${co.co_title}</a></td>
						<td>${co.co_register_date_str}</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
		
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/mypage/courseList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/mypage/courseList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/mypage/courseList?page=${pm.startPage+1}'/>">다음</a>
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
    