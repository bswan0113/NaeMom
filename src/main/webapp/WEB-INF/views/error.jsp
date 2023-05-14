<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html> 
<html>
<head>
	<title>에러 페이지</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			font-size: 16px;
			line-height: 1.5;
			color: #333;
			margin: 0;
			padding: 0;
		}
		
		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 40px 20px;
		}
		
		h1 {
			font-size: 36px;
			margin-bottom: 20px;
		}
		
		p {
			margin-bottom: 20px;
		}
		
		.btn {
			display: inline-block;
			padding: 10px 20px;
			font-size: 18px;
			font-weight: bold;
			text-align: center;
			color: #fff;
			background-color: #00A896;
			border-radius: 5px;
			text-decoration: none;
		}
		
		.btn:hover {
			background-color: #007C70;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>오류가 발생했습니다.</h1>
		<p>죄송합니다. 요청하신 페이지를 찾을 수 없거나, 서버 오류가 발생했습니다.</p>
		<p>문제가 지속되면 관리자에게 문의하세요.</p>
		<a href="<c:url value='/'></c:url>" class="btn">메인으로 돌아가기</a>
	</div>
</body>
</html>