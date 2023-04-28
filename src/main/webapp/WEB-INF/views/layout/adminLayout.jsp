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
	<script src="<c:url value='/resources/js/attrchange.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
		   <link href="<c:url value='/resources/css/summernote-bs4.min.css'></c:url>" rel="stylesheet">
	   <script src="<c:url value='/resources/js/summernote-bs4.min.js'></c:url>"></script>
 	<link href="<c:url value='/resources/css/jquery.timepicker.css'></c:url>" rel="stylesheet">
	   <script src="<c:url value='/resources/js/jquery.timepicker.min.js'></c:url>"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
	     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	     
	    
	   
 	
</head>
	<style>
	.body-container {
	  display: flex;
	  flex-direction: row;
	  padding: 10px; /* 블록과 경계선 간의 간격 조절 */
	}
	.bd-navbar {
	  width:100%;
	  position: sticky;
	  top: 0;
	  z-index: 1071;
	  min-height: 4rem;
	  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
	}
	.bd-sidebar {
		width:250px;
	  z-index: 1000;
	  background: #eee;
	  border-right: 1px solid rgba(0,0,0,.1);
	  overflow-y: auto;
	  height: 800px;
	}
	.bd-sidebar .nav {
	  display: block;
	}
	.bd-sidebar .nav>li>a {
	  display: block;
	  padding: .25rem 1.5rem;
	  font-size: 90%;
	}
	
	 ul{
	   margin: 0 auto;
	 }
	 li{
	   text-align: center;
	   margin: 10px;
	   list-style:none;
	   overflow:hidden;
	   white-space:nowrap;
	  text-overflow: ellipsis;
	 }
	
	a{
	text-decoration:none;
	color:black;
	font-weight:bold;
	}
	
	.admin-side{
	height:50px;
	line-height:50px;
	}	
		
	.body-page{
	width:1200px;
	margin-left:100px;
	}
	</style>
<body>
		<tiles:insertAttribute name="header" />
		<div class="body-container">
			    <div class="bd-sidebar">
			      <ul class="nav">
			        <li class="admin-side"><a href="<c:url value='/admin/home/home'></c:url>">home</a></li>
			        <li class="admin-side"><a href="<c:url value='/admin/insert/insertProduct'></c:url>">게시글 등록</a><br></li>
			        <li class="admin-side"><a href="<c:url value='/admin/list/productList'></c:url>">게시글 조회</a></li>
			        <li class="admin-side"><a href="<c:url value='/admin/list/qnaList'></c:url>">사용자 문의 조회</a></li>
			        <li class="admin-side"><a href="<c:url value='/admin/list/reportList'></c:url>">신고 내역 관리</a></li>
			        <li class="admin-side"><a href="<c:url value='/admin/list/userList'></c:url>">이용자 관리</a></li>
			        <li class="admin-side"><a href="<c:url value='/admin/list/'></c:url>">결제내역 관리</a></li>
			      </ul>
			      <br>
			  </div>
		  <div class="body-page">
      	  <tiles:insertAttribute name="body" />
      	  </div>
        </div>
</body>
</html>