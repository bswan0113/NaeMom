<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

	<form class="container-fluid"action="<c:url value='/mypage/profile'></c:url>" method="post" enctype="multipart/form-data">
	<h2>프로필 수정</h2><br>
		<div class="profile-img-container">
			<c:choose>
			    <c:when test="${user.member_profile != null}">
			        <label for="profile-img">
			            <img class="profile-img" src="<c:url value='/download${user.member_profile.mf_name}'/>" style="width:200px; height:200px;">
			        </label>
			    </c:when>
			    <c:otherwise>
                <div class="no-profile-img">
	                <p>등록된 프로필 이미지가 없습니다.</p>
	                <p>아래 버튼을 클릭하여 프로필 이미지를 등록해주세요.</p>
                	<label for="profile-img" class="upload-btn">프로필 이미지 등록</label>
           		 </div>
			    </c:otherwise>
			</c:choose>
			<input class="form-control" type="file" style="display:none;" id="profile-img"><br>
			  <div class="preview-container" style="display:none;">
			    <p>이미지 미리보기</p>
			    <img class="preview-img" width="200px;" height="200px;" style="border-radius:100%;">
			  </div>
		</div>
		<button class="img-update-btn btn btn-success" type="button" style="display:none;">이미지 저장</button>
		<div class="form-group">
			<label for="id">아이디:</label>
			<input type="text" class="form-control" id="id" name="me_id" value="${user.me_id}">
		</div>
		<div class="form-group">
			<label for="nickname">닉네임:</label>
			<input type="text" class="form-control" id="nickname" name="me_nickname" value="${user.me_nickname}">
		</div>
		<div class="form-group">
			<label for="ma_email">이메일:</label>
			<input type="text" class="form-control" id="ma_email" name="me_ma_email" value="${user.me_ma_email}" readonly>
			<input type="text" class="form-control" style="display:none;" id="new_email" placeholder="이메일 입력">
			<input type="text" class="form-control" style="display:none;" id="auth_code" placeholder="코드 입력">
			<button class="btn btn-success change-email" type="button">이메일변경</button>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호:</label>
			<input type="password" class="form-control" id="pw" name="me_pw" placeholder="********">
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

<style>

.img-update-btn{
    margin: 20px;
    margin-left: 45px;}

.profile-img-container {
    position: relative;
}

.profile-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    cursor: pointer;
}

.no-profile-img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
}

.no-profile-img p {
    margin: 0;
    font-size: 14px;
}

.no-profile-img .upload-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 16px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #007bff;
    border-radius: 4px;
    cursor: pointer;
}
</style>
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
    if($('#pw').val().trim().length==0){
    	alert('기존비밀번호 또는 바꿀 비밀번호를 입력해주세요!');
    	isValid = false;
    	return;
    }
    
    
    // 닉네임 필드 검사
    var nicknameInput = $('#nickname');
    var nicknameValue = nicknameInput.val().trim();
    if (nicknameValue === '') {
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
      alert('비어있는 부분이 있어요!.');
      return false;
    }
    

    // 유효성 검사를 통과한 경우, 폼 제출을 실행
    $(this).unbind('submit').submit();
  });



$(document).on("click",".profile-img",function(){
	$('.img-update-btn').show();
	$('.profile-img').hide();
});

$(document).on("click",".img-update-btn",function(){
	let file = $('#profile-img');
	let formData = new FormData();
    let files = file[0].files;
    formData.append("File", files[0]);
    $.ajax({
        url :'<c:url value="/mypage/update/profileimg"></c:url>',
        processData : false,
        contentType : false,
        data : formData,
        type: "POST",
        success : function(data){
            if(data.res) {
            	alert('프로필 변경 성공!');
            	location.reload();
            }
            else{
            	alert('프로필 변경 실패!');
            	location.reload();
            }
        }
    });
});

let code;
$(document).on("click",".change-email",function(){
	$("#ma_email").hide();
	$('#new_email').show();
	
	$('.change-email').removeClass('change-email').addClass('send-code').text('코드발송');
	alert('변경할 이메일을 입력해주세요')
	
})

$(document).on("click",".send-code",function(){
	if(confirm("이메일 인증이 필요합니다. 인증 코드를 받으시겠습니까?")){
		$('#auth_code').show();
		let oriEmail=$("#new_email").val();
		
		
		
		$.ajax({
			type: 'GET',
			url: '<c:url value="/sendEmail/mypage/'+oriEmail+'"></c:url>',
			success: function(data) {
				alert('이메일로 인증 코드가 전송되었습니다.');
				
				$('.change-email').text('인증코드입력');
				$('.send-code').removeClass('send-code').addClass('input-code').text('코드입력');
				code=data;	
			}
		});
	}else{
		$("#ma_email").show();
		$('#new_email').hide();
		$('#auth_code').hide();
	}
})

$(document).on("click",".input-code",function(){
	let email= $('#new_email').val();
	let userId="${user.me_id}";
	const [id, domain, extension] = email.split(/[@.]/);
	if($('#auth_code').val() == code){
		alert('코드가 일치합니다.');
		$.ajax({
			type:'GET',
			url: '<c:url value="/change/email/'+id+'/'+domain+'/'+extension+'/'+userId+'"></c:url>',
			success: function(data) {
				if(data.res){
					alert('이메일 변경 완료!')
				}else{
					alert('이메일 변경실패!')
				}
				location.reload();
			} 
		})
	}
	else{
		alert('코드가 틀렸습니다.')
	}
})

$(document).ready(function() {
	  // 파일 선택 시 미리보기 기능 활성화
	  $('#profile-img').change(function() {
	    const file = $(this)[0].files[0];
	    if (file) {
	      const reader = new FileReader();
	      reader.onload = function(e) {
	        $('.preview-container').show();
	        $('.preview-img').attr('src', e.target.result);
	      }
	      reader.readAsDataURL(file);
	    }
		$('.img-update-btn').show();
		$('.profile-img').hide();
	  });
	});
//ajax메서드
function ajaxPost(async, obj, url, successFunction, obj2){
	$.ajax({
		async:async,
		type: 'POST',
		data: JSON.stringify(obj),
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			successFunction(data,obj2)
			
		} 
	});
}
		
	
function ajaxGet(async, url, successFunc){
	$.ajax({
		async:async,
		type: 'GET',
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunc
	});
}
</script>