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
	     
	    
	   
 	
</head>
	<style>
	.body-container{
	display:flex;
	width:80%;
	margin:20px;
	margin-top:145px;
	}
	.side-bar{
	width:200px;
	background-color: #29c16d72;
	}
	.mypage-info{
	width:calc(100% - 200px);
	padding:30px;
	}
	</style>
<body>
		<tiles:insertAttribute name="header" />
		<div class="body-container">
			<div class="side-bar">
	      	  	<tiles:insertAttribute name="sideBar" />
	     	 </div>
	      <div class="mypage-info">
		      <div class="">
		       	<tiles:insertAttribute name="mypageHead" />
		      </div>
      	  	  <tiles:insertAttribute name="body" />
      	  </div>
        </div>
        <tiles:insertAttribute name="footer" />
</body>
</html>