<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
  <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
  <title>optionList</title>
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
    .contents {
	    width: 1190px;
	    margin: 0 auto;
	    padding: 0 20px 27px 20px;
	  }
    .option_list{
      float: left; border: 1px solid black; width: 750px; padding: 20px;
      margin-top: 100px;
    }
    .option_item{
      border: 1px solid black; margin-bottom: 20px;
    }
    .option_title{
      position: absolute; font-size: 30px; font-weight: 700;
    }

    .price_box{
      float: right; border: 1px solid black; width: 300px; padding: 20px;
      margin-top: 100px;
    }
    .addOrder{
      text-align: center; width: 100%; font-size: 20px; height: 50px; margin-top: 20px;
    }
    .price_list{
      text-align: center;
    }
    .price_item{
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <div class="contents clearfix">
    <label class="option_title">옵션 선택</label>
    <ul class="option_list">
      <li class="option_item">
        <div class="option-photo">
          <img src="" alt="" class="option_item_img">
        </div>
        코스1
      </li>
      <li class="option_item">
        <div class="option-photo">
          <img src="" alt="" class="option_item_img">
        </div>
        코스2
      </li>
      <li class="option_item">
        <div class="option-photo">
          <img src="" alt="" class="option_item_img">
        </div>
        코스3
      </li>
    </ul>
    <div class="price_box">
      <ul class="price_list">
        <li class="price_item">가격1</li>
        <li class="price_item">가격2</li>
        <li class="price_item">가격3</li>
      </ul>
      <label style="font-size: 20px;">총가격 : </label>
      <span style="float: right;">원</span>
      <button class="addOrder btn btn-outline-info">장바구니 담기</button>
    </div>
  </div>
  
  <script>
  	
  	
  	
  	
  //ajax
  function ajaxPost(obj, url, successFunction){
		$.ajax({
			async:false,
			type: 'POST',
			data: JSON.stringify(obj),
			url: url,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : successFunction
		});
	}
  
  
  
  </script>
  
 
</body>
</html>
