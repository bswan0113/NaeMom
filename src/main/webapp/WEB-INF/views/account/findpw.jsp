<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
	<title>비밀번호 찾기</title>	
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/findpw.css" rel="stylesheet" type="text/css">
	</head> 
<body>

	<form class="form"  method="GET" action="">
			<div class="row">
				<div class="col-md-10 inputbb">
					<div class="form-group has-danger">
						<div class="input-group mb-2 mr-sm-2 mb-sm-0">
							<input type="text" name="nm" class="form-control" id="name" placeholder="이름">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="email" name="em" class="form-control" id="email" placeholder="이메일">
					</div>
				</div>
			</div>
		</div>
	<div class="row">
		<div class="col-md-10 inputbb">
			<div class="form-group has-danger">
				<div class="input-group mb-2 mr-sm-2 mb-sm-0">
					<input type="text" name="bd" class="form-control" id="birth" placeholder="생년월일" >
				</div>
			</div>
		</div>
	</div>		
	<div class="row">
		<div class="col-md-10 inputbb">
			<div class="form-group has-danger">
				<div class="input-group mb-2 mr-sm-2 mb-sm-0">
					<input type="text" name="id" class="form-control" id="account" placeholder="아이디" >
				</div>
			</div>
		</div>
	</div>		
	
	<div class="row">
		<div class="col-md-10 inputbb">
			<button type="submit" class="btn-find">비밀번호 찾기</button>
		</div>
	</div>	
</form>

<script>
$('.form').submit(function(){
	let nm = $('[name=nm]').val();
	if(nm.length == 0){
		alert('이름은 필수 항목입니다.');
		$('[name=nm]').focus();
		return false;
	}
	let em = $('[name=em]').val();
	if(em.length == 0){
		alert('이메일은 필수 항목입니다.');
		$('[name=em]').focus();
		return false;
	}
	let bd = $('[name=bd]').val();
	if(bd.length == 0){
		alert('생년월일은 필수 항목입니다.');
		$('[name=bd]').focus();
		return false;
	}
	let id = $('[name=id]').val();
	if(id.length == 0){
		alert('아이디는 필수 항목입니다.');
		$('[name=id]').focus();
		return false;
	}
});
</script>
</body>
