<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
	<title>아이디 찾기</title>
	
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/findid.css" rel="stylesheet" type="text/css">
	</head> 
<body>

	<form class="form" method="POST" action="${pageContext.request.contextPath}/findid" >
			<div class="row">
				<div class="col-md-10 inputbb">
					<div class="form-group has-danger">
						<div class="input-group mb-2 mr-sm-2 mb-sm-0">
							<input type="text" name="me_name"  id="me_name" class="form-control" placeholder="이름"  autofocus>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="email" name="me_ma_email"  id="me_ma_email" class="form-control" placeholder="이메일"  autofocus>
					</div>
				</div>
			</div>
		</div>
	<div class="row">
		<div class="col-md-10 inputbb">
			<div class="form-group has-danger">
				<div class="input-group mb-2 mr-sm-2 mb-sm-0">
					<input type="text" name="me_birthday"  id="me_birthday" class="form-control" placeholder="생년월일"  autofocus>
				</div>
			</div>
		</div>
	</div>		
	<div class="row">
		<div class="col-md-10 inputbb">
			<button type="submit" class="btn-find">아이디 찾기</button>
		</div>
	</div>	
</form>

<script>
$(function() {
    $('#btn-find').click(function() {
      var email = $('#me_ma_email').val();
      var name = $('#me_name').val();
      var birthday = $('#me_birthday').val();

      // 입력값이 모두 존재할 경우 POST 요청을 보냅니다.
      if (email && name && birthday) {
        $.ajax({
          type: 'POST',
          url: '/findids',
          data: {
            me_ma_email: email,
            me_name: name,
            me_birthday: birthday
          },
          success: function(result) {
            alert(result); // 결과를 알림창으로 띄웁니다.
          },
          error: function() {
            alert('아이디 찾기 실패'); // 실패 시 알림창을 띄웁니다.
          }
        });
      } else {
        alert('모든 정보를 입력해주세요.'); // 입력값이 모두 존재하지 않을 경우 알림창을 띄웁니다.
      }
    });
  });
</script>
</body>
