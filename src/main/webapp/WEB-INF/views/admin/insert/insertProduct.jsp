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
			<label for="registerd_address">(api적용예정)지번주소:</label>
			<input type="text" class="form-control" id="registerd_address" name="pd_registerd_address">
		</div>
		<div class="form-group">
			<label for="street_address">(api적용예정)도로명 주소:</label>
			<input type="text" class="form-control" id="street_address" name="pd_street_address">
		</div>
		<div class="form-group">
			<label for="detail_address">(api적용예정)상세 주소:</label>
			<input type="text" class="form-control" id="detail_address" name="pd_detail_address">
		</div>
		<div class="form-group">
			<label for="parking">주차 가능 여부:</label>
			<input type="text" class="form-control" id="parking" name="pd_parking">
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
			썸네일 이미지 등록<input type="file" name="files" class="form-control">
			<br>대표 이미지 등록<br>
			<input type="file" name="files" class="form-control">
			<input type="file" name="files" class="form-control">
			<input type="file" name="files" class="form-control">
			<input type="file" name="files" class="form-control">
			<input type="file" name="files" class="form-control">
		</div>
		<br><hr>
		<input type="hidden" name="redirect" value="savetmp">
		<button class="btn btn-success" id="save-link-addOption">저장 후 옵션등록</button>
		<button class="btn btn-secondary" type="submit">저장</button>
		<button class="btn btn-danger">등록취소</button>
		<br><hr>
	</form>
<script>

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
</script>

