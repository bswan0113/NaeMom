<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
form{
width:80%;
margin: 0 auto;
padding:30px;
}
</style>

<form action="<c:url value='/mypage/qnaInsert'></c:url>" method="post" enctype="multipart/form-data">
	<h3>문의등록</h3>
	<div class="form-group">
		<div class="search-img"></div>
		<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#search-modal">문의상품검색</button>
		<input type="hidden" class="form-control" id="pd_num" name="qa_pd_num" value="0">
	</div>	
	<select class="form-control select-category">
		<option value="0">대분류 선택</option>
		<option value="사이트 이용 문의">사이트 이용 문의</option>
		<option value="상품 관련 문의">상품 관련 문의</option>
	</select><br>
	<select class="form-control select-sub-category" name="qa_qs_category">
		<option value="0">대분류를 선택하세요</option>
	</select>
	<div class="form-group">
		<label for="title">제목:</label>
		<input type="text" class="form-control" id="title" name="qa_title">
	</div>			
	<div class="form-group">
		<label>내용 : </label>
		<textarea id="content"name="qa_content" class="form-control" style="min-height:500px;"></textarea>
	</div>
	<div class="form-group">
		첨부파일 등록: 
		<input type="file" name="files" class="form-control">
		<input type="file" name="files" class="form-control">
		<input type="file" name="files" class="form-control">
		<input type="file" name="files" class="form-control">
		<input type="file" name="files" class="form-control">
	</div>
	<button class="btn btn-success" type="submit">문의 등록</button>
	<a class="btn btn-success" href="<c:url value="/mypage/qnaList"></c:url>">취소</a>
</form>


<!-- 검색모달 -->
<div class="modal common-modal" id="search-modal">
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		      <h4 class="modal-title">문의 상품 검색</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
		    	<input type="text" class="form-control">
		  	    <button class="btn btn-success search-btn">검색</button>
		  	    <div class="search-result">
		  	    
		  	    </div>
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-success"id="search-select">선택</button>
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>


<script>
let searchCri={
		page : 1,
		perPageNum : 5
}

$(document).on("click",".search-btn",function(){
    let search = $(this).prev().val(); 
    let cri = { 
        search: search,
        page: searchCri.page,
        perPageNum: searchCri.perPageNum
    };
    $.ajax({
    	  type: 'POST',
    	  data: JSON.stringify(cri),
    	  url: "<c:url value='/qna/search'></c:url>",
    	  dataType: "json",
    	  contentType: "application/json; charset=UTF-8",
    	  success: function(data) {
    	    let products = data.list;
    	    let $searchResult = $('.search-result');
    	    $searchResult.empty();

    	    $.each(products, function(index, product) {
    	    	
    	      let $checkbox = $('<input/>', {
    	        type: 'checkbox',
    	        class: 'product-checkbox',
    	        id: 'product-' + product.pd_num,
    	        value: product.pd_num,
    	        'data-title': product.pd_title
    	      });

    	      let $label = $('<label/>', {
    	        for: 'product-' + product.pd_num,
    	        text: product.pd_title
    	      });

    	      let $li = $('<div/>', {
    	        class: 'form-check'
    	      }).append($checkbox, $label);

    	      $searchResult.append($li);
    	    });
    	    
    	  }
    	});
})

$(document).on("click", ".product-checkbox", function() {
  $('.product-checkbox').not(this).prop('checked', false);
});

$(document).on("click", "#search-select", function() {
	
	  let pd_num = $('.product-checkbox:checked').val();
	    if (typeof pd_num === 'undefined') {
	        alert("상품을 선택해주세요.");
	    } else {
	        $('#search-modal').modal('hide');
	    }
		$.ajax({
		    url: "<c:url value='/mypage/getThumbnail/"+pd_num+"'></c:url>",
		    type: "GET",
		    success: function(data) {
		    	$('#pd_num').val(pd_num);
                let $img = $('<img/>', {
                    src: "<c:url value='/download/"+data.file.fi_name+"'></c:url>",
                    alt: "상품 썸네일",
                    class: "search-img",
                    width: "200x",
                    height :"200"
                });
                $('.search-img').empty().append($img);
		    	
		    }
	    
	});
});


$(document).on("submit", "form", function(e) {
	  e.preventDefault(); // 제출 막기
	  let category = $(".select-category").val();
	  let title = $("#title").val().trim();
	  let content = $("#content").val().trim();
	  
	  if (category === "0") {
	    alert("분류를 선택해 주세요.");
	    return;
	  }
	  
	  if (title === "") {
	    alert("제목을 입력해 주세요.");
	    return;
	  }
	  
	  if (content === "") {
	    alert("내용을 입력해 주세요.");
	    return;
	  }
	  
	  // 유효성 검사 통과 시, 제출 가능
	  this.submit();
	});


$(document).on("change",".select-category",function() {
	let category = $(this).val();
	let sub=[];
	$.ajax({
	    url: "<c:url value='/mypage/getCategory'></c:url>",
	    type: "POST",
	    data: { category: category },
	    success: function(data) {
    	  for(let i=0; i<data.selected.length; i++) {
    	        sub.push(data.selected[i].qs_category);
    	      }
          let selectSub = $(".select-sub-category");
          selectSub.empty(); // 기존 옵션 제거
          for(let i = 0; i < sub.length; i++) {
            selectSub.append("<option value='"+sub[i]+"'>"+sub[i]+"</option>");
          }
	    }
	    
	  });
  });
</script>