<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <title>관리자페이지 - 게시글 수정</title> 
   	<h1 class="text-primary">게시글 수정</h1> <br><hr>
	<form action="<c:url value='/admin/insert/insertProduct'></c:url>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">썸네일:</label>
			<img alt="" src="<c:url value='/download${product.file.fi_name}'></c:url>" width="200px;" height="200px;" data-file="${product.file.fi_num}">
		</div>
		<c:forEach items="${fileList}" var="files">
			<div class="form-group">
				<label for="subtitle">대표이미지:</label>
				<img alt="" src="<c:url value='/download${files.fi_name}'></c:url>" width="200px;" height="200px;" data-file="${files.fi_num}">
			</div>
		</c:forEach>
		<c:forEach begin="0" end="${4-fileList.size()}">
			<input type="file" name="files" class="form-control">
		</c:forEach>
		<div class="form-group">
			<label for="pc_num">카테고리선택:</label>
			<select class="form-control" id="category" name="pd_pc_num">
			<option value="0">-카테고리 선택</option>
				<c:forEach items="${category}" var="cg">
					<option value="${cg.pc_num}"  <c:if test="${product.pd_pc_num == cg.pc_num }">selected</c:if>>${cg.pc_category}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="title">제목:</label>
			<input type="text" class="form-control" id="title" name="pd_title" value="${product.pd_title}">
		</div>
		<div class="form-group">
			<label for="subtitle">부제목:</label>
			<input type="text" class="form-control" id="subtitle" name="pd_subtitle" value="${product.pd_subtitle}">
		</div>
		<div class="form-group">
			<label for="registerd_address">(api적용예정)지번주소:</label>
			<input type="text" class="form-control" id="registerd_address" name="pd_registerd_address" value="${product.pd_registerd_address}">
		</div>
		<div class="form-group">
			<label for="street_address">(api적용예정)도로명 주소:</label>
			<input type="text" class="form-control" id="street_address" name="pd_street_address" value="${product.pd_street_address}">
		</div>
		<div class="form-group">
			<label for="detail_address">(api적용예정)상세 주소:</label>
			<input type="text" class="form-control" id="detail_address" name="pd_detail_address" value="${product.pd_detail_address}">
		</div>
		<div class="form-group">
			<label for="parking">주차 가능 여부:</label>
			<input type="text" class="form-control" id="parking" name="pd_parking" value="${product.pd_parking}">
		</div>
		<div class="form-group">
			<label for="capacity">최대인원:</label>
			<input type="text" class="form-control" id="capacity" name="pd_capacity" value="${product.pd_capacity}">
		</div>
		<div class="form-group">
			<label for="open_time">오픈:</label>
			<input type="text" class="form-control" id="open_time" name="pd_open_time" value="${product.pd_open_time_str}">
		</div>
		<div class="form-group">
			<label for="close_time">클로징:</label>
			<input type="text" class="form-control" id="close_time" name="pd_close_time" value="${product.pd_close_time_str}">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea id="content"name="pd_content" class="form-control">${product.pd_content}</textarea>
		</div>
		<br><hr>
		<input type="hidden" name="redirect" value="savetmp">
		<button class="btn btn-secondary" type="submit">저장</button>
		<button class="btn btn-danger">취소</button>
		<br><hr>
	</form>

<script>



$('#content').summernote({
	tabsize: 2,
	height: 400
});
$("#open_time, #close_time").timepicker({

	step: 30,          
	timeFormat: "H:i"    

	

});
</script>

