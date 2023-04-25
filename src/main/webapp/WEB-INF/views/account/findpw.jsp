<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>비밀번호 찾기</title>
	<link href="${pageContext.request.contextPath}/resources/css/findpw.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head> 
<body>
	<h1>비밀번호 찾기</h1>
	<form id="findpw-form" method="post" action="<c:url value='/processFindPw'/>" accept-charset="UTF-8">
		<label for="me_name">이름:</label>
		<input type="text" id="me_name" name="me_name" required><br><br>
		<label for="me_ma_email">이메일:</label>
		<input type="email" id="me_ma_email" name="me_ma_email" required><br><br>
		<label for="me_birthday">생년월일:</label>
		<input type="text" id="me_birthday" name="me_birthday" required><br><br>
		<label for="me_id">아이디:</label>
		<input type="text" id="me_id" name="me_id" required><br><br>
		<button type="submit" class="btn-find">비밀번호 찾기</button><br>
		<a href="/naemom" class="btn-main"><button type="button">메인화면</button></a>
		
	</form>
	<div id="result"></div>

	<script>
	$(document).ready(function() {
		$("#findpw-form").on("submit", function(event) {
			event.preventDefault();
			
			// 필수 입력 필드들이 모두 입력되었는지 검증
			if ($(this).find("input[required]").filter(function() { return !this.value; }).length > 0) {
				alert("모든 필드를 입력해주세요.");
				return false;
			}
			let data = $(this).serialize()
			console.log(data);
			
			$.ajax({
				async:false,
				type: "POST",
				url: "<c:url value='/processFindPw'/>",
				data:data ,
				success: function(response) {
					
					if(response == '') 
						str = "입력하신 정보와 일치하는 회원 정보가 없습니다.";
				 	else
				 		str= "새로운 비밀번호는 입력하신 이메일로 전송되었습니다. 새로운 비밀번호로 로그인후 비밀번호를 변경해주세요.";
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