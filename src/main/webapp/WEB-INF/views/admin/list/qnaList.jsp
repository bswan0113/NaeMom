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
		.btn-disabled{
			pointer-events:none; opacity: .6;
		}
	
	    </style>
	<div class="container">
	<h3>문의 조회</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>답변상태</th>
					<th>제목</th>
					<th></th>
					<th>문의 구분</th>
					<th>작성자 명</th>
					<th>등록 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaList}" var="qna">
					<tr>
						<td <c:if test="${qna.qa_state == 1}"> style="color:yellowgreen; font-weight:bold;"</c:if>>
							<c:if test="${qna.qa_state == 1}">
							답변완료
							</c:if>
							<c:if test="${qna.qa_state != 1}">
							문의진행중
							</c:if>
						</td>
						<td class="qna_title">${qna.qa_title}</td>
						
						<td><a class="btn btn-success <c:if test="${qna.qa_state == 1}">btn-disabled</c:if>" href="<c:url value='/admin/list/qnaAnswer/${qna.qa_num}'></c:url>">답변등록</a></td>
						<td>${qna.qa_qs_category}</td>
						<td>${qna.qa_me_id}</td>
						<td>${qna.qa_registerd_date_str}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/admin/list/qnaList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/admin/list/qnaList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/admin/list/qnaList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>

	
    