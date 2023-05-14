<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <title>관리자페이지 - 상세등록</title> 
   	<h1 class="text-primary">게시글 등록</h1> <br><hr>
	<form action="<c:url value='/admin/insert/insertProduct'></c:url>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="pc_num">카테고리선택:</label>
			<select class="form-control" id="category" name="pd_pc_num">
			<option value="0">-카테고리 선택</option>
				<c:forEach items="${category}" var="cg">
					<option value="${cg.pc_num}">${cg.pc_category}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="title">제목:</label>
			<input type="text" class="form-control" id="title" name="pd_title">
		</div>
		<div class="form-group">
			<label for="subtitle">부제목:</label>
			<input type="text" class="form-control" id="subtitle" name="pd_subtitle">
		</div>
		
		<div class="form-group">                   
			<input class="form-control" placeholder="주소입력" name="me_post" id="me_post"readonly="readonly" >
		 	<button type="button" class="btn btn-success" onclick="execPostCode();">주소 찾기</button>                               
		</div>
		
			<input type="hidden" class="form-control" id="registerd_address" name="pd_registerd_address">
			<input type="hidden" class="form-control" id="street_address" name="pd_street_address">
			
		<div class="form-group">
			<label for="detail_address">상세주소:</label>
			<input type="text" class="form-control" id="detail_address" name="pd_detail_address">
		</div>
		<div class="form-group">
			<label for="parking">주차 가능 여부:</label>
			<select class="form-control" name="pd_parking" id="parking">
				<option value="가능">가능</option>
				<option value="불가능">불가능</option>
			</select>
		</div>
		<div class="form-group">
			<label for="capacity">최대인원:</label>
			<input type="text" class="form-control" id="capacity" name="pd_capacity">
		</div>
		<div class="form-group">
			<label for="open_time">오픈:</label>
			<input type="text" class="form-control" id="open_time" name="pd_open_time">
		</div>
		<div class="form-group">
			<label for="close_time">클로징:</label>
			<input type="text" class="form-control" id="close_time" name="pd_close_time">
		</div>
		<div class="fe-option"></div>
		<div class="form-group">
			<label>내용</label>
			<textarea id="content"name="pd_content" class="form-control"></textarea>
		</div>
		<br><hr>
		<div class="form-group">
			썸네일 이미지 등록<input type="file" name="files" class="form-control thum">
			<br>대표 이미지 등록<br>
			<input type="file" name="files" class="form-control imgfile">
			<input type="file" name="files" class="form-control imgfile">
			<input type="file" name="files" class="form-control imgfile">
			<input type="file" name="files" class="form-control imgfile">
			<input type="file" name="files" class="form-control imgfile">
		</div>
		<br><hr>
		<input type="hidden" name="redirect" value="savetmp">
		<button class="btn btn-success" id="save-link-addOption">저장 후 옵션등록</button>
		<button class="btn btn-secondary" type="submit">저장</button>
		<button class="btn btn-danger">등록취소</button>
		<br><hr>
	</form>
<script>

$(document).ready(function(){
	$('form').submit(function(e){
		e.preventDefault();
		  var pd_title = $('#title').val().trim();
		    var pd_subtitle = $('#subtitle').val().trim();
		    var address = $('#street_address').val().trim();
		    var pd_parking = $('#parking').val();
		    var pd_capacity = $('#capacity').val();
		    var pd_open_time = $('#open_time').val();
		    var pd_close_time = $('#close_time').val();
		    var pd_content = $('#content').val();
		    var thum = $('.thum').val();
		    if($('#category').val()== 0){
		    	alert('카테고리를 선택해주세요');
		    	return false;
		    }
		    if(pd_title == ''){
		    	alert('상품명을 입력해주세요');
		    	return false;
		    }
		    
		    if(pd_subtitle == ''){
		    	alert('부제를 입력해주세요');
		    	return false;
		    }
		    
		    if(address == ''){
		    	alert('주소를 입력해주세요');
		    	return false;
		    }
		    
		    
		    if(pd_parking == ''){
		    	alert('주차가능여부를 입력해주세요');
		    	return false;
		    }
		    
		    if(pd_capacity == ''){
		    	alert('최대 수용인원을 입력해주세요');
		    	return false;
		    }
		    
		    if(pd_close_time == '' || pd_open_time==''){
		    	alert('운영시간을 입력해주세요');
		    	return false;
		    }
		    if (!/^\d+$/.test(pd_capacity)) {
		        alert('최대 수용인원의 값이 잘못되었습니다.');
		        return false;
		    }

		    if (!/^\d{2}:\d{2}$/.test(pd_close_time) || !/^\d{2}:\d{2}$/.test(pd_open_time)) {
		        alert('운영시간은 HH:mm 형식으로 입력해주세요');
		        return false;
		    }
		    if(pd_content == ''){
		    	alert('내용을 입력해주세요');
		    	return false;
		    }
		    if(thum == ''){
		    	alert("썸네일을 등록해주세요");
		    	return false;
		    }
		    $(this).unbind('submit').submit();
		   
	})
});

$(document).on("change",'#category',function(){
	if($(this).val() == 4){
		str='';
		
		str+=
			'<div class="form-group">'+
				'<label for="open_time">시작날짜:</label>'+
				'<input type="text" class="form-control" id="start" name="pd_fe_start">'+
			'</div>'+
			'<div class="form-group">'+
				'<label for="close_time">종료날짜:</label>'+
				'<input type="text" class="form-control" id="end" name="pd_fe_end">'+
			'</div>';
			
		
		
		$('.fe-option').html(str);
		
		 let options = {
				    dateFormat: "yyyy-MM-dd", // 날짜 형식 지정
				    minDate: new Date(), // 오늘 이후 날짜만 선택 가능
				  };

				  // 시작날짜 데이터피커 구현
				  $("#start").datepicker(options);

				  // 종료날짜 데이터피커 구현
				  $("#end").datepicker(options);
	}
})




$('#save-link-addOption').click(function(){
	$("input[name=redirect]").val("redirect");
	console.log($("input[name=redirect]").val())
})

$('#content').summernote({
	tabsize: 2,
	height: 400
});
$("#open_time, #close_time").timepicker({

	step: 30,          
	timeFormat: "H:i"    

	

});

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
           
           
           $("[name=pd_street_address]").val(fullRoadAddr);
           $("[name=pd_registerd_address]").val(data.jibunAddress);
           $("[name=me_post]").val(fullRoadAddr);
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>

