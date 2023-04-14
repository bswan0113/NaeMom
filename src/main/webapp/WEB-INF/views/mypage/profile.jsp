<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

	<form class="container-fluid"action="<c:url value='/mypage/profile'></c:url>" method="post" enctype="multipart/form-data">
	<h2>프로필 수정</h2><br>
		<label for="profile-img">
			<img class="profile-img"src="<c:url value="/download"></c:url>" width="200px;" height="200px">
		</label>
		<input class="form-control"type="file" style="display:none;" id="profile-img"><br>
		<button class="img-update-btn btn btn-success" type="button" style="display:none;">이미지 변경</button>
		<div class="form-group">
			<label for="id">아이디:</label>
			<input type="text" class="form-control" id="id" name="me_id" value="${user.me_id}">
		</div>
		<div class="form-group">
			<label for="nickname">닉네임:</label>
			<input type="text" class="form-control" id="nickname" name="me_nickname" value="${user.me_nickname}">
		</div>
		<div class="form-group">
			<label for="pw">비밀번호:</label>
			<input type="text" class="form-control" id="pw" name="me_pw" value="${user.me_pw}">
		</div>
		<div class="form-group">
			<label for="birthday">생일:</label>
			<input type="text" class="form-control" id="birthday" name="me_birthday" value="${user.me_birthday_str}">
		</div>
		<div class="form-group">
			<label for="phone">휴대전화:</label>
			<input type="text" class="form-control" id="phone" name="me_phone" value="${user.me_phone}">
		</div>
		<div class="form-group">
			<label for="street_address">도로명주소:</label>
			<input type="text" class="form-control" id="street_address" name="me_street_address" value="${user.me_street_address}">
		</div>
		<div class="form-group">
			<label for="registered_address">지번주소:</label>
			<input type="text" class="form-control" id="registered_address" name="me_registered_address" value="${user.me_registered_address}">
		</div>
		<div class="form-group">
			<label for="detail_address">상세주소:</label>
			<input type="text" class="form-control" id="detail_address" name="me_detail_address" value="${user.me_detail_address}">
		</div>
		
		<button class="btn btn-success" type="submit">저장하기</button>
		<a class="btn btn-success" href="<c:url value="/mypage/main"></c:url>">취소</a>
	</form>
	
<script>

  $('form').submit(function(event) {
    event.preventDefault(); // 기본 동작(폼 제출)을 막음

    var isValid = true; // 유효성 검사를 통과하는지 여부를 나타내는 변수
    // 아이디 필드 검사
    var idInput = $('#id');
    var idValue = idInput.val().trim();
    if (idValue === '') {
      isValid = false;
    }
    // 닉네임 필드 검사
    var nicknameInput = $('#nickname');
    var nicknameValue = nicknameInput.val().trim();
    if (nicknameValue === '') {
      isValid = false;
    }

    // 비밀번호 필드 검사
    var pwInput = $('#pw');
    var pwValue = pwInput.val().trim();
    if (pwValue === '') {
      isValid = false;
    }

    // 생일 필드 검사
    var birthdayInput = $('#birthday');
    var birthdayValue = birthdayInput.val().trim();
    if (birthdayValue === '') {
      isValid = false;
    }

    // 휴대전화 필드 검사
    var phoneInput = $('#phone');
    var phoneValue = phoneInput.val().trim();
    if (phoneValue === '') {
      isValid = false;
    }

    // 도로명주소 필드 검사
    var streetAddressInput = $('#street_address');
    var streetAddressValue = streetAddressInput.val().trim();
    if (streetAddressValue === '') {
      isValid = false;
    }

    // 지번주소 필드 검사
    var registeredAddressInput = $('#registered_address');
    var registeredAddressValue = registeredAddressInput.val().trim();
    if (registeredAddressValue === '') {
      isValid = false;
    }

    // 상세주소 필드 검사
    var detailAddressInput = $('#detail_address');
    var detailAddressValue = detailAddressInput.val().trim();
    if (detailAddressValue === '') {
      isValid = false;
    }

    // 유효성 검사를 통과하지 못한 경우, 에러 메시지를 출력하고 폼 제출을 막음
    if (!isValid) {
      alert('모든 필드는 공백을 허용하지 않습니다.');
      return false;
    }

    // 유효성 검사를 통과한 경우, 폼 제출을 실행
    $(this).unbind('submit').submit();
  });




$(document).on("click",".profile-img",function(){
	$('.img-update-btn').show();
	$('#profile-img').show();
	$('.profile-img').hide();
});

$(document).on("click",".img-update-btn",function(){
	alert('뿅')
});
</script>