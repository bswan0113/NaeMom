<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<title>축제 옵션 등록</title> 
	<style>
	
	
	</style>

<div class="container-fluid" data-pd_num="${pd_num}">
<h2 style="text-align:center;">옵션 관리</h2>
	<div class="saved-list">
		<c:forEach items="${optionList}" var="option">
			<div class="saved-item" data-num="${option.fo_num}">
				<div class="form-group">
					<label for="age">구분:</label>
					<input type="text" class="form-control" id="age" name="fo_age" readonly value="${option.fo_age}">
				</div>
				<div class="form-group">
					<label for="price">가격:</label>
					<input type="text" class="form-control" id="price" name="fo_price"readonly value="${option.fo_price}">
				</div>
				<button class="btn btn-dark update-saved"> 수정하기</button>		
			</div>	
		</c:forEach>
	</div>
	<div class="option-list">
		<div class="option-item">
			<div class="form-group">
				<label for="age">구분:</label>
				<input type="text" class="form-control" id="age" name="fo_age">
			</div>
			<div class="form-group">
				<label for="price">가격:</label>
				<input type="text" class="form-control" id="price" name="fo_price">
			</div>
		</div>
	</div>
	<button class="btn btn-dark" id="addOption" type="button">옵션추가</button>
	<button class="btn btn-success " id="saveOption"type="button">저장하기</button>
	<a class="btn btn-success" href="<c:url value='/admin/list/productList'></c:url>">수정완료</a>
</div>

<script>
let pd_num =$('.container-fluid').data('pd_num');


$('#saveOption').click(function(){
	let optionItem= [];
	let res = false;
	  $('.option-item').each(function(index) {
		    let age = $(this).find('input[name="fo_age"]').val();
		    let price = $(this).find('input[name="fo_price"]').val();

		    if(age.trim().length == 0){
		    	alert('구분을 입력해주세요.');
		    	return;
		    }
		    if(price.trim().length == 0){
		    	alert('가격을 입력해주세요.');
		    	return;
		    }			    
		    if (!/^\d+$/.test(price)) {
		        alert('가격의 값이 잘못되었습니다.');
		        vali = false;
		        return false;
		    }
		  optionItem.push(createOptionItem(age,price));
		  res=true;
		  });
	  if(!res)return;	  
	  
  ajaxPost(true,optionItem,"<c:url value='/insert/option/festival'></c:url>",function(data){
  	if(data.res) {
		alert('추가성공!');
		location.reload();
		}
  	else alert('추가실패!')
  });
})
function createOptionItem(age, price) {
  return {
	fo_pd_num:pd_num,
    fo_age: age,
    fo_price: price
  }
}

$('.update-saved').click(function() {
    let age = $(this).parent().find('#age').val();
    let price = $(this).parent().find('#price').val();
    let saved = $(this).parent();
    let items = 
        '<div class="option-item">'+
            '<div class="form-group">'+
                '<label for="age">구분:</label>'+
                '<input type="text" class="form-control" id="age" name="fo_age" value='+age+'>'+
            '</div>'+
            '<div class="form-group">'+
                '<label for="price">가격:</label>'+
                '<input type="text" class="form-control" id="price" name="fo_price" value='+price+'>'+
            '</div>'+
            '<button class="btn btn-primary update-item" type="button">수정</button>'+
            '<button class="btn btn-primary delete-item" type="button">삭제</button>'+
            '<button class="btn btn-secondary cancle-update" type="button">취소</button>'+
        '</div>';

    $(this).parent().hide();
    saved.after(items);
});

$('.saved-list').on('click', '.update-item', function() {
    let age = $(this).parent().find('#age').val();
    let price = $(this).parent().find('#price').val();
    let fo_num= $(this).parent().prev().data('num');
	let fo={
			fo_num:fo_num,
			fo_pd_num:pd_num,
			fo_age : age,
			fo_price : price
	}

    if(age.trim().length == 0){
    	alert('구분을 입력해주세요.');
    	return;
    }
    if(price.trim().length == 0){
    	alert('가격을 입력해주세요.');
    	return;
    }			    
    if (!/^\d+$/.test(price)) {
        alert('가격의 값이 잘못되었습니다.');
        vali = false;
        return false;
    }
	
	 ajaxPost(true,fo,"<c:url value='/update/option/festival'></c:url>",function(data){
	    	if(data.res) {
	    		alert('수정성공!');
	    		location.reload();
	    		}
	    	else alert('수정실패!')
	    });
    
});

$('.saved-list').on('click', '.cancle-update', function() {
    let optionItem = $(this).parent();
    let age = $(this).parent().find('#age').val();
    let price = $(this).parent().find('#price').val();
    optionItem.hide();
    optionItem.prev().show();
    
    
});

$('.saved-list').on('click', '.delete-item', function() {
	if(!confirm('삭제하시겠어요?')) return;
    let age = $(this).parent().find('#age').val();
    let price = $(this).parent().find('#price').val();
    let fo_num= $(this).parent().prev().data('num');
	let fo={
			fo_num:fo_num,
			fo_pd_num:pd_num,
			fo_age : age,
			fo_price : price
	}
    
	   ajaxPost(true,fo,"<c:url value='/delete/option/festival'></c:url>",function(data){
	    	if(data.res) {
	    		alert('삭제성공!');
	    		location.reload();
	    		}
	    	else alert('삭제실패!')
	    });
    
});

$('#addOption').click(function() {
  let item = $('.option-item').first().clone();
  item.find('input').val('');
  $('.option-list').append(item);

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
