<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>임시 목록페이지입니다.</title>
	<h1>목록 임시페이지입니다.</h1>
<div style='height: 1500px;'>
		<a href="<c:url value='/admin/insert/insertProduct'></c:url>">insertProduct</a>
		<br><a href="<c:url value='/product/detail/accomodation'></c:url>">accomodation</a>
		<br><a href="<c:url value='/product/detail/festival'></c:url>">festival</a>
		<br><a href="<c:url value='/product/detail/landMark'></c:url>">landMark</a>
		<br><a href="<c:url value='/product/detail/restraunt'></c:url>">restraunt</a>
</div>
<style>
a{
	margin-left: 100px;
	margin-top: 200px;
	font-size: 50px;
	font-weight: bold;
	color: black;
}
</style>