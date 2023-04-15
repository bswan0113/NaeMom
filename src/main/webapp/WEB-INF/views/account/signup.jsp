<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
	<title>회원가입</title>
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/signup.css" rel="stylesheet" type="text/css">
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			</head> 

				
					
		
			<form action="<c:url value='/signup'></c:url>" method="POST" class="form" id="signup_frm">
			
				<h1 class="title">회원가입</h1>
				<input type="text" class="id" name="me_id" placeholder="아이디" required>
				<button type="button" class="btn-dup">중복검사</button>				
				<input type="password" class="pw"  name="me_pw" placeholder="비밀번호">
				<input type="password" class="pw2" name="me_pw2" placeholder="비밀번호 확인">
				<input type="email" class="em" name="me_ma_email" placeholder="이메일">
				<button type="submit" id="email_auth_btn" class="btn-emails">이메일 인증 코드 보내기</button>
					
				<br>
				<br>
				<input type="text" name="auth" id="email_auth_key" placeholder="인증 코드 입력">
				<button type="submit" class="btn-email">이메일 인증</button>
				<input type="text" class="na" name="me_name" placeholder="이름">
				<input type="text" class="ph" name="me_phone" placeholder="전화번호 예)01012341234">
				<input type="text" class="bd" name="me_birthday" placeholder="생년월일 예)yyyy-MM-dd">
				<input type="hidden" name="me_authority" value="1">
				<input type="hidden" name="me_nickname" id="me_nickname">
				<div class="form-group">                   
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="me_post" id="me_post" type="text" readonly="readonly" >
   					 <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
				</div>
				<div class="form-group">
    			<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="me_street_address" id="me_street_address" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
   				 <input class="form-control" placeholder="상세주소" name="me_detail_address" id="me_detail_address" type="text"  />
				</div>

				<div>
					<label>
						<input type="radio" name="me_gender" value="남성"> 남성
					</label>
					<label>
						<input type="radio" name="me_gender" value="여성"> 여성
					</label>
				</div>
				<br>				
				<button type="submit" class="btn-submit" id="join">회원가입</button>
				
			</form>    
			
	
	
	<script>
		  var email_auth_cd = '';
	$(document).ready(function() {

		$('#email_auth_btn').click(function() {
			  var email = $('input[name=me_ma_email]').val();
			  if (email == '') {
			    alert('이메일을 입력해주세요.');
			    return false;
			  }

			  let emCheck = false;
			  let obj = { me_ma_email : email };
			  $.ajax({
			    async: false,
			    type: 'POST',
			    data: JSON.stringify(obj),
			    url: '<c:url value="/check/em"></c:url>',
			    dataType: 'json',
			    contentType: 'application/json; charset=UTF-8',
			    success: function(data) {
			      if (data.res) {
			        alert('사용 가능한 이메일입니다.');
			        emCheck = true;
			      } else {
			        alert('이미 사용중인 이메일입니다.');
			      }
			    },
			    error: function(error) {
			      alert('이메일 체크에 실패했습니다.');
			    }
			  });

			  if (emCheck) {
			    $.ajax({
			      type: 'POST',
			      url: '<c:url value="/sendEmail"></c:url>',
			      data: JSON.stringify({
			        to: email
			      }),
			      contentType: 'application/json; charset=UTF-8',
			      success: function(data) {
			        alert('이메일로 인증 코드가 전송되었습니다.');
			        email_auth_cd = data;
			      },
			      error: function(error) {
			        alert('이메일 전송에 실패했습니다.');
			      }
			    });
			  }
			});
		  
			function fn_join() {
				  var f = $('#signup_frm');
				  var formData = f.serialize();

				  $.ajax({
				    type: "POST",
				    url: '<c:url value="/signupd"></c:url>',
				    data: formData,
				    success: function(data) {
				      if (data == "Y") {
				        alert("회원가입이 완료되었습니다.");
				        location.href ='<c:url value="/signupsuc"></c:url>';
				      } else {
				        alert("회원가입에 실패하였습니다.");
				      }
				    },
				    error: function(data) {
				      alert("회원가입 에러 발생!");
				      console.log(data);
				    }
				  });
				}

		

			$('.btn-dup').click(function() {
				
				let me_id = $('[name=me_id]').val();
				 let regex = /^[a-z][a-zA-Z0-9!@#]{5,13}$/;

				  if (!regex.test(me_id)) {
					  $('[name=me_id]').css('background', 'red');
					    alert('아이디는 5~13자(영문+숫자 or 영문)만 가능합니다.');
					    return;
				    
				  }
				let obj = {
						me_id : me_id
				}
				$.ajax({
					async:true,
					type:'POST',
					data: JSON.stringify(obj),
					url: '<c:url value="/check/id"></c:url>',
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					    if(data.res){
					    	alert('사용 가능한 아이디입니다.');
					    	idCheck = true;
					    	$('[name=me_id]').css('background', 'lightgreen');
					    }else{
					    	alert('이미 사용중인 아이디입니다.')
					    	
					    	$('[name=me_id]').css('background', 'red');
					    }
					}
				});
			});
			$('[name=me_id]').change(function(){
				idCheck = false;
			});
			let idCheck = false;
			
			
		  
		  $('.form').submit(function(event) {
			 			   	   
			    let id = $('[name=me_id]').val();
				  if (id.length == 0) {
				    alert('아이디는 필수 항목입니다.');
				    $('[name=me_id]').focus();
				    return false;
				  }
				 

				  let pw = $('[name=me_pw]').val();
				  if (pw.length == 0) {
				    alert('비번은 필수 항목입니다.');
				    $('[name=me_pw]').focus();
				    return false;
				  }

				  let pwRegex = /^[a-zA-Z0-9!@#$]{8,16}$/;
				  if (!pwRegex.test(pw)) {
				    alert('비밀번호는 8~16자, 영문+숫자+!/@/#/$만 가능합니다.');
				    $('[name=me_pw]').focus();
				    return false;
				  }

				  let pw2 = $('[name=me_pw2]').val();
				  if (pw != pw2) {
				    alert('비번과 비번 확인이 일치하지 않습니다.');
				    $('[name=me_pw2]').focus();
				    return false;
				  }
				  let em = $('[name=me_ma_email]').val();
					if(em.length == 0){
						alert('이메일은 필수 항목입니다.');
						$('[name=me_ma_email]').focus();
						return false;
					}
					$('.btn-email').click(function(){
						if($('#email_auth_key').val() != email_auth_cd){
							alert('인증번호가 일치하지 않습니다.');
							return false;
						}
						if($('#email_auth_key').val() == email_auth_cd){
							alert('인증성공');						
						}
					});
					
					  let na = $('[name=me_name]').val();
					  if (na.length == 0) {
					    alert('이름은 필수 항목입니다.');
					    $('[name=me_name]').focus();
					    return false;
					  }
					  let ph = $('[name=me_phone]').val();
					  if (ph.length == 0) {
					    alert('전화번호는 필수 항목입니다.');
					    $('[name=me_phone]').focus();
					    return false;
					  }
					  
			
					let bd = $('[name=me_birthday]').val();
					let bdRegex = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
					if(!bdRegex.test(bd)){
						alert('생년월일은 필수입니다. yyyy-MM-dd 형식으로 입력해주세요.');
						$('[name=me_birthday]').focus();
						return false;
					}
										
					//fn_join();
		  });
		});
	
	
	 // 16자리의 랜덤 문자열 생성
    function generateRandomString(length) {
        let result = '';
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const charactersLength = characters.length;
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
    
    // 랜덤 문자열을 'user-'와 함께 적용
    document.getElementById("me_nickname").value = "user-" + generateRandomString(16);
	
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=me_post]").val(data.zonecode);
               $("[name=me_street_address]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }

 
		


		
		</script>
				
	

    
	
