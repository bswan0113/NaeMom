<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html> 
<html>
<head>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
	<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>	
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<style>
		.body-container{
		margin-top : 200px;}
	</style>
</head>
<body>
	<tiles:insertAttribute name="header"/>
    <div class="container body-container">        
        <tiles:insertAttribute name="body" />
    </div>
    <tiles:insertAttribute name="footer" />
</body>
</html>