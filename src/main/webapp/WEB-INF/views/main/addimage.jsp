<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<title>관리자페이지 - 상세등록</title> 
<style>

h1{
	text-align: center;
	margin: 50px;
	font-weight: bold;
}


input[type="checkbox"][id^="imgCheckbox"] {
  display: none;
}

label {
  border: 1px solid #fff;
  padding: 10px;
 /* display: block;
  position: relative;*/
  margin: 10px;
  cursor: pointer;
}

label:before {
  background-color: white;
  color: white;
  content: " ";
  display: block;
  border-radius: 50%;
  border: 1px solid grey;
  position: absolute;
  top: -5px;
  left: -5px;
  width: 25px;
  height: px;
  text-align: center;
  line-height: 28px;
  transition-duration: 0.4s;
  transform: scale(0);
}

label img {
  height: 200px;
  width: 200px;
  transition-duration: 0.2s;
  transform-origin: 50% 50%;
}

:checked + label {
  border-color: #ddd;
}

:checked + label:before {
  content: "✓";
  background-color: grey;
  transform: scale(1);
}

:checked + label img {
  transform: scale(0.9);
  /* box-shadow: 0 0 5px #333; */
  z-index: -1;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<h1 class="text-primary">이벤트 이미지 페이지</h1> <br><hr>
<div class="container-fluid mt-6 mb-6">
	<form action="<c:url value='/main/addimage/uploadimage'/>" method="post">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
     			<c:forEach items="${flist}" var="file" varStatus="status">
					<div class="swiper-slide">
						<input type="checkbox" id="imgCheckbox${status.index}" name="imgCheckbox" value="${file.fi_num}" />
						<label for="imgCheckbox${status.index}"><img src="<c:url value='/download${file.fi_name}'></c:url>" /></label>
					</div>
				</c:forEach>
			</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
		</div>
	<br><hr>
	<button class="btn btn-success btn-insert" type="submit">출력</button>
	</form>
	<br><hr>
	<form action="<c:url value='/main/addimage'/>" method="post" enctype="multipart/form-data">
		<div class="form-group" id="file-input-container">
			<input type="file" id="file" name="files" class="form-control">
		</div>
	  	<button class="btn btn-secondary" type="submit">파일저장</button>
	</form>
	<form action="<c:url value='/main/addimage/deleteimage'/>" method="post">
		<button class="btn btn-danger" type="submit" id="btn-delete" name="delete-file" value="${file.fi_num}">파일삭제</button>
	</form>
</div>
<script>
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 4,
     grid: {
        rows: 1,
      }, 
    spaceBetween: 50,
    keyboard: {
      enabled: true,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
 
$(document).ready(function(){
	var checkedList = [];	
  $('input[name="imgCheckbox"]').each(function() {
    var fiNum = $(this).val();
    if ($.inArray(fiNum, checkedList) !== -1) {
      $(this).prop('checked', true);
    }
  });
  console.log($('#file').length);
  $(".btn-insert").click(function() {
    var checkedList = [];
    $('input[name="imgCheckbox"]:checked').each(function() {
      checkedList.push($(this).val());
    });
    
    $.ajax({
      type: "POST",
      url: "<c:url value='/main/addimage/uploadimage'/>",
      data: { imgCheckbox: checkedList },
      success: function(response) {
        console.log(response);
      },
      error: function(xhr, status, error) {
        console.log(xhr.responseText);
      }
    });
  });
});

$('input[name="files"]').change(function() {
    var newFileInput = '<input type="file" name="files" class="form-control">';

    $('#file-input-container').append(newFileInput);
 });

$(document).on('click', '#btn-delete', function() {
    var checkedList = [];
    var str = "";
    $('input[name="imgCheckbox"]:checked').each(function() {
      /* checkedList.push($(this).val()); */
      str += '<input type = "hidden" name="fi_num" value="'+$(this).val()+'">'
      
    });
	$(this).after(str);
    
});


</script>

