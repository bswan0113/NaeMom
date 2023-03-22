<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>임시 검색페이지입니다.</title>
	<h1>검색 임시페이지입니다.</h1>


<div class="container-fluid">



	<c:forEach items="${product}" var="pr">
		<c:if test="${pr.pd_pc_num ==1}">
			<a href="<c:url value='/product/detail/detailLayoutTMP/${pr.pd_num}'></c:url>">${pr.pd_title}</a><br><br>
		</c:if>
		<c:if test="${pr.pd_pc_num ==2}">
			<a href="<c:url value='/product/detail/detailLayoutTMP/${pr.pd_num}'></c:url>">${pr.pd_title}</a><br><br>
		</c:if>
		<c:if test="${pr.pd_pc_num ==3}">
			<a href="<c:url value='/product/detail/detailLayoutTMP/${pr.pd_num}'></c:url>">${pr.pd_title}</a><br><br>
		</c:if>
		<c:if test="${pr.pd_pc_num ==4}">
			<a href="<c:url value='/product/detail/detailLayoutTMP/${pr.pd_num}'></c:url>">${pr.pd_title}</a><br><br>
		</c:if>
	</c:forEach>

</div>

<style>
.header{
	display:none;
	
}
</style>