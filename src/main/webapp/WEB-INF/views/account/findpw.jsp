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
		<div class="row">
		<label for="me_name" class="col-3">이름:</label>
		<input type="text" id="me_name" name="me_name" required class="col-9">
		</div>
		<div class="row">
		<label for="me_ma_email" class="col-3">이메일:</label>
		<input type="email" id="me_ma_email" name="me_ma_email" required class="col-9">
		</div>
		<div class="row">
		<label for="me_birthday" class="col-3">생년월일:</label>
		<input type="text" id="me_birthday" name="me_birthday" required class="col-9">
		</div>
		<div class="row">
		<label for="me_id" class="col-3">아이디:</label>
		<input type="text" id="me_id" name="me_id" required class="col-9">
		</div>
		<button type="submit" class="btn-find">비밀번호 검색</button><br>
		<a href="login" class="btn-main"><button type="button">로그인</button></a>
		<a href="findid" id="findid"><button type="button">아이디 찾기</button></a>
		
	</form>
	<div id="result"></div>

	<script>
	$(document).ready(function() {
		$("#findpw-form").on("submit", function(event) {
			event.preventDefault();
			let name = $('#me_name').val();
			let email = $('#me_ma_email').val();
			let birthday = $('#me_birthday').val();
			let id = $('#me_id').val();

			// 이름 유효성 검사
			if (!name) {
				alert("이름은 필수항목입니다.");
				return false;
			} else if (name.length > 13) {
				alert("이름은 13자 이하로 입력해주세요.");
				return false;
			}

			// 이메일 유효성 검사
			if (!email) {
				alert("이메일은 필수항목입니다.");
				return false;
			} else if (email.indexOf('@') === -1) {
				alert("알 수 없는 형식의 이메일입니다.");
				return false;
			}

			// 생년월일 유효성 검사
			if (!birthday) {
				alert("생년월일은 필수항목입니다.");
				return false;
			} else if (!/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(birthday)) {
				alert("잘못된 생년월일 형식입니다. yyyy-MM-dd 형식으로 입력해주세요.");
				return false;
			}

			// 아이디 유효성 검사
			if (!id) {
				alert("아이디는 필수항목입니다.");
				return false;
			} else if (!/^[a-z][a-zA-Z0-9!@#]{5,11}$/.test(id)) {
				alert("잘못된 아이디 형식입니다. 아이디는 최소 6자에서 12자 사이로 입력해주세요.");
				return false;
			}

			let data = $(this).serialize();
			console.log(data);

			$.ajax({
				async:false,
				type: "POST",
				url: "<c:url value='/processFindPw'/>",
				data: data,
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