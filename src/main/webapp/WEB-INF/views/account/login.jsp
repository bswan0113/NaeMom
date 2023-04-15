<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
	<title>회원가입</title>
	
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
	</head> 
	<form action="<c:url value='/login'></c:url>" method="post">
	<div class="contents">
        <div class="form-group">
            <h1 class="logo">내맘대로</h1>
            <div class="container">
                <input type="text" placeholder="ID" class="form-control" id="id" name="me_id">
                <input type="password" placeholder="Password" class="form-control" id="pw" name="me_pw">
              <button class="btn btn-outline-success col-12">로그인</button>
              <!-- 추후 submit으로 변경 -->
                <br>
                <a href="findid" class="findid">아이디찾기</a>&nbsp;
                <a href="findpw" class="findpw">비밀번호찾기</a>
                <br>
                <br>
                <input type="checkbox" name="autoLogin" value="true"> 자동로그인				
                <a href="signup" class="register">회원가입</a>
                
                <p id="alert" class="account"> </p>
            </div>
        </div>   
    </div> 
    </form>
	
	<script>
	$('.login').click(function(){
		let id = $('[name=id]').val();
		if(id.length == 0){
			alert('아이디를 입력해주세요.');
			$('[name=id]').focus();
			return false;
		}
		let pw = $('[name=pw]').val();
		if(pw.length == 0){
			alert('비밀번호를 입력해주세요.');
			$('[name=pw]').focus();
			return false;
		}
	});
		</script>
   

  
 

    
</body>

