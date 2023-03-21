<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>courseInsert</title>
  <script src="<c:url value ='/resources/js/jquery.min.js'></c:url>"></script>
  <style>
  	*{
		padding: 0; margin: 0;
	}

	#body{ 
	  min-width: 1190px;
	  font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	  line-height: 16px; font-size: 12px; color: #202020; 
	  
	}
	ul,li{
	  list-style: none;
	}
	.clearfix::after{
	  content: ''; clear: both; display: block; 
	}
	a{
	  text-decoration: none;
	}
	.contents{
		width: 1190px; margin: 0 auto; margin-top: 160px;
	}
  	.course-title-name{
    font-size: 30px;
  }
  .course-name{
    font-weight: 800;
    color: #333;
    font-size: 36px;
    letter-spacing: -1px;
    border: 1px solid #bbb;
  }
  </style>
</head>
<body>
  <div class="contents">
    <div class="course_title ">
      <span class="course-title-name">코스이름</span>
    </div>
    <input type="text" class="course-name">
  </div>
</body>
</html>
