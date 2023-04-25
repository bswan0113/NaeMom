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
	     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"></link>
	     
	    
	   
 	
</head>
	<style>
	.body-container{
	margin:20px;
	margin-top:145px;
	padding: 50px;
	}

	.body-top{
	width: 100%;
	padding:30px;
	}
	.body-bottom{
	display:flex;
	}
	
	.my-information{height:500px;}
	</style>
<body>
		<tiles:insertAttribute name="header" />
		<div class="body-container">
			<div class="body-top">
			     <tiles:insertAttribute name="mypageHead" />
		    </div>
		    <hr>
		    <div class="body-bottom">
		      <div class="side-bar">
	      	  	<tiles:insertAttribute name="sideBar" />
	     	  </div>
	     	  	  <tiles:insertAttribute name="body" />     	  
	          </div>
       		<tiles:insertAttribute name="footer" />
       		</div>
</body>
</html>