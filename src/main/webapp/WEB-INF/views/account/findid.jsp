<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
	<title>아이디 찾기</title>
	<link href="${pageContext.request.contextPath}/resources/css/findid.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<meta charset="UTF-8">
</head> 
<body>
	<h1>아이디 찾기</h1>
	<form id="findid-form" method="post" action="<c:url value='/processFindId'/>" accept-charset="UTF-8">
		<div class="row">
			<label for="me_name" class="col-3">이름:</label>
			<input type="text" id="me_name" name="me_name" required class="col-9">
		</div>
		<div class="row">
		<label for="me_ma_email" class="col-3">이메일:</label>
		<input type="email" id="me_ma_email" name="me_ma_email" required class="col-9">
		</div>
		<div class="row">
		<label for="me_birthday"  class="col-3">생년월일:</label>
		<input type="text" id="me_birthday" name="me_birthday" required class="col-9" placeholder="0000-00-00">
		</div>
		<button type="submit" class="btn-findid">아이디 검색</button><br>	
		<a href="findpw" id="findpw"><button type="button">비밀번호 찾기</button></a>
		<a href="login" id="login"><button type="button">로그인</button></a>
	</form>
	<div id="result"></div>

	<script>
	$(document).ready(function() {
		$("#findid-form").on("submit", function(event) {
			event.preventDefault();
			
			// 이름 유효성 검사
			let name = $(this).find("input[name=me_name]").val();
			if (!name) {
				alert("이름은 필수항목입니다.");
				return false;
			} else if (name.length > 13) {
				alert("이름은 13자 이하로 입력해주세요.");
				return false;
			}

			// 이메일 유효성 검사
			let email = $(this).find("input[name=me_ma_email]").val();
			if (!email) {
				alert("이메일은 필수항목입니다.");
				return false;
			} else if (!email.includes("@")) {
				alert("알 수 없는 이메일 형식입니다.");
				return false;
			}

			// 생일 유효성 검사
			let birth = $(this).find("input[name=me_birthday]").val();
			if (!birth) {
				alert("생일은 필수항목입니다.");
				return false;
			} else if (!/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(birth)) {
				alert("잘못된 생일 형식입니다. yyyy-MM-dd 형식으로 입력해주세요.");
				return false;
			}
			
			let data = $(this).serialize()
			console.log(data);
			
			$.ajax({
				async:false,
				type: "POST",
				url: "<c:url value='/processFindId'/>",
				data:data ,
				success: function(response) {
					
					if(response == '') 
						str = "입력하신 정보와 일치하는 회원 정보가 없습니다.";
				 	else
				 		str= "아이디는 입력하신 이메일로 전송되었습니다.";
					// 성공적으로 처리된 경우
					$("#result").html(str);
				},
				error: function(xhr, status, error) {
					// 처리 중 에러 발생한 경우
					console.error("Error occurred:", xhr.responseText);
				}
			});
			return false;
		});
	});
</script>
</body>
</html>