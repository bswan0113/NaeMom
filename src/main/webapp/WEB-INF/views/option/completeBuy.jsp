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
	<!-- <script src="https://js.bootpay.co.kr/bootpay-4.2.9.min.js" type="application/javascript"></script> -->
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.6.min.js" type="application/javascript"></script>
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
	    table{
			border-spacing: 0; border-collapse: collapse; font-size: 100%;
		}
	    .clearfix::after{
	      content: ''; clear: both; display: block; 
	    }
	    a{
	      text-decoration: none;
	    }
		button{
			background: 0; cursor: pointer;
		}
		th{
			display: table-cell;
		}
		div{
			margin: 0; padding: 0; font-size: 13px; color: #333;
		}
		p{
			margin:0;
		}
	    .contents {
		    width: 1190px;
		    margin: 0 auto;
		    padding: 0 20px 27px 20px;
		    height:auto;
		  }
	    
	    .option_title{
	      position: absolute; font-size: 30px; font-weight: 700;
	    }
	    .order_step{
	    	float:right; margin-top:20px;
	    }
	    .title_box{
	    	height: 70px; overflow: hidden; border-bottom: 3px solid #777;
	    }
	    .order_step > em{
	    	font-weight:700; color:#346aff; font-style:normal;
	    }
		/*구매자 정보*/
		.buyer_inner_box{
			margin-top: 30px;
		}
		.buyer_title{
			padding-left: 2px; margin-bottom: 8px; font-size: 20px; font-weight: 700; color: #333;
		}
		.buyer_table{
			width: 100%; border-top: 2px solid #cecece;
		}
		.buyer_col,.user_th{
			width: 104px; border: solid #e4e4e4; border-width: 0 1px 1px 0; padding: 7px 10px 7px 15px;
    		text-align: right; background: #f4f4f4; font-weight: 500;
		}
		.buyer_col2,.user_td{
			border-bottom: 1px solid #e4e4e4; padding: 10px 16px;
		}
		.user_title{
			padding-left: 2px; margin: 30px 0 8px; text-align: left; font-size: 20px; font-weight: 700;
		}
		
		.button{
			padding: 4px 8px; border: 1px solid #999; color: #333; border-radius: 2px; box-shadow: 0 -2px 0 rgba(0,0,0,.1) inset;
    		font-size: 11px;
		}
		.user_table{
			border-top: 2px solid #cecece; width: 100%;
		}
		
		label{
			cursor: pointer;
		}
		
		
		.btn_box{
			text-align:center; display: flex; justify-content: center;
		}
		.paymentBtn{
			width:260px; height:60px; display:inline-block; background: #0085da; font-size: 30px;
    		color: #fff; border: 0; border-radius: 5px;
		}
		.successBox{
		    display: flex; flex-direction: column; align-items: center;
   		}
   		.successOrder{
   			margin-top: 30px; font-size: 30px;
   		}
  </style>
</head>
<body onbeforeunload="return '';">
	<div class="contents clearfix">
		<div class="title_box clearfix">
	    	<label class="option_title">결제완료</label>
	    	<span class="order_step">장바구니>주문결제><em>결제완료</em></span>
		</div>
		<div class="successBox mt-4">
			<h1>주문/결제가 완료되었습니다!</h1>
			<h2 class="successOrder">주문번호 : <span>${bl.bl_num }</span></h2>
		</div>
		<div class="buyer_box">
			<div class="buyer_inner_box">
				<h2 class="buyer_title"> 구매자 정보 </h2>
				<input type="hidden" value="${user.me_id }" class="buyer_id">
				<table class="buyer_table">
					<tbody>
						<tr>
							<td class="buyer_col">이름</td>
							<td class="buyer_col2 buyer_name">${user.me_name }</td>
						</tr>
						<tr>
							<td class="buyer_col">이메일</td>
							<td class="buyer_col2 buyer_email">${user.me_ma_email }</td>
						</tr>
						<tr>
							<td class="buyer_col">휴대폰 번호</td>
							<td class="buyer_col2 buyer_phone">${user.me_phone }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="user_box">
			<h2 class="user_title">이용자 정보</h2>
			<table class="user_table">
				<tbody>
					<tr>
						<th class="user_th">이름</th>
						<td class="user_td">${bl.useMember.um_name }</td>
					</tr>
					<tr>
						<td class="user_th">이메일</td>
						<td class="user_td">${bl.useMember.um_email }</td>
					</tr>
					<tr>
						<td class="user_th">휴대폰 번호</td>
						<td class="user_td">${bl.useMember.um_phone }</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btn_box mt-5">
			<form action="<c:url value ='/mypage/reserveList'></c:url>">
				<button class="paymentBtn">구매내역 보기</button>
			</form>
			<form action="<c:url value ='/'></c:url>">
				<button class="paymentBtn ml-3">메인으로</button>
			</form>
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
		function ajaxPostString(obj, url, successFunction){
			$.ajax({
				async:false,
				type: 'POST',
				data: JSON.stringify(obj),
				url: url,
				contentType:"application/json; charset=UTF-8",
				success : successFunction
			});
		}
   	</script>
  
 
</body>
</html>
  
  	