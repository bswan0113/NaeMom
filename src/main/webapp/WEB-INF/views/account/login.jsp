<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>회원가입</title>
<head>
    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
</head> 
<form action="<c:url value='/login'></c:url>" method="post" onsubmit="return validateForm()">
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
function validateForm() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var idRegex = /^[a-zA-Z0-9!@#]{6,12}$/;
    if (id == "") {
        alert("아이디는 필수항목입니다.");
        return false;
    } else if (!idRegex.test(id)) {
        alert("아이디는 영어 대소문자와 숫자, 특수문자(!, @, #) 중 6~12자리로 입력해주세요.");
        return false;
    } else if (pw == "") {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
}
</script>