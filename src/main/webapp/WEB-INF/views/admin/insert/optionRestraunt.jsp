<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<title>음식점 옵션 등록</title> 
	<style>
	
	
	</style>
	<div class="container-fluid" data-pd_num="${pd_num}">
	<h2 style="text-align:center;">옵션 관리</h2>
		<div class="saved-list">
			<c:forEach items="${optionList}" var="option">
				<div class="saved-item" data-num="${option.reo_num}">
					<div class="form-group">
						<label for="content">메뉴이미지:</label><br>
						<img class="item-img" alt="" src="<c:url value='/download${option.file.fi_name}'></c:url>" width="200px;" height="200px;">
					</div>
					<div class="form-group">
						<label for="name">메뉴명:</label>
						<input type="text" class="form-control" id="name" name="reo_name" readonly value="${option.reo_name}">
					</div>
					<div class="form-group">
						<label for="price">가격:</label>
						<input type="text" class="form-control" id="price" name="reo_price"readonly value="${option.reo_price}">
					</div>
					<div class="form-group">
						<label for="content">메뉴설명:</label>
						<input type="text" class="form-control" id="content" name="reo_content"readonly value="${option.reo_content}">
					</div>
	
					<button class="btn btn-dark update-saved"> 수정하기</button>		
				</div>	
			</c:forEach>
		</div>
<form action="<c:url value='/insert/option/restraunt'></c:url>" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${pd_num}" name="list[0].reo_pd_num">
	<input type="hidden" value="${pd_num}" name="pd_num">
			<div class="option-list">
				<div class="option-item">
					<div class="form-group">
						<label for="name">메뉴명:</label>
						<input type="text" class="form-control" id="name" name="list[0].reo_name">
					</div>
					<div class="form-group">
						<label for="content">메뉴이미지첨부:</label>
						<input type="file" class="form-control files" id="file" name="files">
					</div>
					<div class="form-group">
						<label for="price">가격:</label>
						<input type="text" class="form-control" id="price" name="list[0].reo_price">
					</div>
					<div class="form-group">
						<label for="content">메뉴설명:</label>
						<input type="text" class="form-control" id="content" name="list[0].reo_content">
					</div>
					<hr>
				</div>
				<div class="addOption">
				</div>
			</div>
		<button class="btn btn-dark" id="addOption" type="button">옵션추가</button>
		<button class="btn btn-success " id="saveOption">저장하기</button>
		<a class="btn btn-success" href="<c:url value='/admin/list/productList'></c:url>">수정완료</a>
	</form>
</div>

<script>
let pd_num =$('.container-fluid').data('pd_num');
let optionCount =1;

$(document).ready(function() {
	  $("form").submit(function() {
		let vali = true;
	    $(".option-item").each(function(index) {
	      let menuName = $(this).find("#name").val();
	      let menuDescription = $(this).find("#content").val();
	      let menuPrice = $(this).find("#price").val();
	      let menuImage = $(this).find("#file").val();
	      if (menuName.trim().length <= 0) {
	        alert("메뉴명을 입력해주세요.");
	        vali = false;
	        return false;
	      }

	      if (menuDescription.trim().length <= 0) {
	        alert("메뉴설명을 입력해주세요.");
	        vali = false;
	        return false;
	      }

	      if (menuPrice == '') {
	        alert("가격을 입력해주세요.");
	        vali = false;
	        return false;
	      }

	      if (menuImage == '') {
	        alert("이미지를 첨부해주세요.");
	        vali = false;
	        return false;
	      }
	    
	    });
	    if(!vali) return false; 	    
	    
	  });
	});


$('#addOption').click(function() {
	str='';
	
	for(let i=0; i<optionCount; i++){
		str+=createOptionItem();
	};
		$('.addOption').html(str);			
	optionCount+=1;
});

function createOptionItem() {
	  let str='';
	  str +=  '<div class="option-item">'+
	  		'<input type="hidden" value="${pd_num}" name="list['+optionCount+'].reo_pd_num">'+
	      '<div class="form-group">'+
	        '<label for="name">메뉴명:</label>'+
	        '<input type="text" class="form-control" id="name" name="list['+optionCount+'].reo_name">'+
	      '</div>'+
	      '<div class="form-group">'+
	        '<label for="content">메뉴이미지첨부:</label>'+
	        '<input type="file" class="form-control files" id="file" name="files">'+
	      '</div>'+
	      '<div class="form-group">'+
	        '<label for="price">가격:</label>'+
	        '<input type="text" class="form-control" id="price" name="list['+optionCount+'].reo_price">'+
	     ' </div>'+
	      '<div class="form-group">'+
	       ' <label for="content">메뉴명:</label>'+
	        '<input type="text" class="form-control" id="content" name="list['+optionCount+'].reo_content">'+
	      '</div>'+
	     ' <hr>'+
	    '</div>'
	  return str;
	}



/*
$('#saveOption').click(function(){
	let optionItem= [];
  $('.option-item').each(function(index) {
	    let name = $(this).find('input[name="reo_name"]').val();
	    let price = $(this).find('input[name="reo_price"]').val();
	    let content = $(this).find('input[name="reo_content"]').val();
	    let file = $(this).find('input[name="file"]');

	  optionItem.push(createOptionItem(name,price, content));
	  });
  ajaxPost(true,optionItem,"<c:url value='/insert/option/restraunt'></c:url>",function(data){
  	if(data.res) {
		alert('추가성공!');
		location.reload();
		}
  	else alert('추가실패!')
  });
})
function createOptionItem(name, price, content) {
  return {
	reo_pd_num:pd_num,
    reo_name: name,
    reo_price: price,
    reo_content : content
  }
}*/

$('.update-saved').click(function() {
    let name = $(this).parent().find('#name').val();
    let price = $(this).parent().find('#price').val();
    let content = $(this).parent().find('#content').val();
    let pd_num =$(this).parent().data('num')
    let saved = $(this).parent();
    let items = 
        '<div class="option-item">'+
        '<input type="hidden" value="'+pd_num+'" name="reo_pd_num">'+
            '<div class="form-group">'+
                '<label for="name">메뉴명:</label>'+
                '<input type="text" class="form-control" id="name" name="reo_name" value='+name+'>'+
            '</div>'+
  	      '<div class="form-group">'+
	        '<label for="content">메뉴이미지변경:</label>'+
	        '<input type="file" class="form-control files" id="file" name="files">'+
	      '</div>'+
            '<div class="form-group">'+
                '<label for="price">가격:</label>'+
                '<input type="text" class="form-control" id="price" name="reo_price" value='+price+'>'+
            '</div>'+
            '<div class="form-group">'+
	            '<label for="content">메뉴설명:</label>'+
	            '<input type="text" class="form-control" id="content" name="reo_content" value='+content+'>'+
	        '</div>'+
            '<button class="btn btn-primary update-item" type="button">수정</button>'+
            '<button class="btn btn-primary delete-item" type="button">삭제</button>'+
            '<button class="btn btn-secondary cancle-update" type="button">취소</button>'+
        '</div>';

    $(this).parent().hide();
    saved.after(items);
});

$('.saved-list').on('click', '.update-item', function() {
    let name = $(this).parent().find('#name').val();
    let price = $(this).parent().find('#price').val();
    let content = $(this).parent().find('#content').val();
    let reo_num= $(this).parent().prev().data('num');
    let file =$(this).parent().find('#file');
	let reo={
			reo_num:reo_num,
			reo_pd_num:pd_num,
			reo_name : name,
			reo_price : price,
			reo_content : content
	}
	
	 ajaxPost(true,reo,"<c:url value='/update/option/restraunt'></c:url>",function(data){
			if(data.res){
				let formData = new FormData();
				let files = file[0].files;
				formData.append("uploadFile",files[0]);
				$.ajax({
					url :'<c:url value="/update/option/restraunt/file/'+reo_num+'"></c:url>',
					processData : false,
					contentType : false,
					data : formData,
					type: "POST",
					success : function(data){
						if(data.res){
							alert('수정성공!');
							location.reload();
						}else{
							alert('수정실패!');
							location.reload();
						}
					}
				});
				
			}
	    });
    
});

$('.saved-list').on('click', '.cancle-update', function() {
    let optionItem = $(this).parent();
    let name = $(this).parent().find('#name').val();
    let price = $(this).parent().find('#price').val();
    let content = $(this).parent().find('#content').val();
    optionItem.hide();
    optionItem.prev().show();
    
    
});

$('.saved-list').on('click', '.delete-item', function() {
	if(!confirm('삭제하시겠어요?')) return;
    let name = $(this).parent().find('#name').val();
    let price = $(this).parent().find('#price').val();
    let content = $(this).parent().find('#content').val();
    let reo_num= $(this).parent().prev().data('num');
	let reo={
			reo_num:reo_num,
			reo_pd_num:pd_num,
			reo_name : name,
			reo_price : price,
			reo_content : content
	}
    
	   ajaxPost(true,reo,"<c:url value='/delete/option/restraunt'></c:url>",function(data){
	    	if(data.res) {
	    		alert('삭제성공!');
	    		location.reload();
	    		}
	    	else alert('삭제실패!')
	    });
    
});



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
		
	
function ajaxGet(method, url, successFunc){
	$.ajax({
		async:false,
		type: method,
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunc
	});
}



</script>
