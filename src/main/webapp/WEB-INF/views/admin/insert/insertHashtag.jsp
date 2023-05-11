<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  /* container style */
    .containerTest {
        margin: 50px auto;
        max-width: 800px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 20px;
        background-color: #fff;
    }

    /* heading styles */
    h4 {
        margin-top: 0;
        margin-bottom: 20px;
        font-size: 24px;
        color: #007bff;
    }

    /* list styles */
    .ori-list {
        margin-bottom: 20px;
        display: flex; flex-wrap: wrap;
    }

    .containerTest saveHash {
        font-size: 18px;
        color: #555;
        margin-bottom: 10px;
    }

    .ori-list div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        color:#ccc;
        font-weight:bold;
        font-size:22px;
        width:auto;
    }

    .ori-list div:hover {
        background-color: #f2f2f2;
    }


    .insert-part h5 {
        font-size: 18px;
        color: #555;
        margin-bottom: 10px;
    }

    .insert-input {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 100%;
        box-sizing: border-box;
        font-size: 16px;
    }


</style>  
   
    <div class="containerTest">
    	<h4>${title}</h4>
   		<h5 class="saveHash">저장 목록</h5>
    	<div class="ori-list">
    		<c:forEach items="${regi}" var="hash">
    			<div>
    			&#35;${hash.hg_name}
    			<button class="btn btn-danger delete-btn ml-3" data-num="${hash.hg_num}">삭제</button>
    			</div> 
    		</c:forEach>
    	</div>
    	<div class="insert-part">
    		<h5>신규 등록</h5>
    		<div class="insert-list">
				<input type="text" class="insert-input" id="name" name="hg_age">
			</div>
			<button class="btn btn-success list-add">추가</button>
			<button class="btn btn-success save-btn">변경내용 저장</button>
    	</div>
    </div>
    
<script>
$(document).on("click",".delete-btn",function(){
	let num =$(this).data("num");
	if(!confirm("삭제하시겠습니까?"))return;
	$.ajax({
		url: "<c:url value='/admin/delete/hashtag/"+num+"'></c:url>",
		method:"get",
		success:function(data){
			if(data.res){
				alert("삭제성공!")
			}else{
				alert("삭제실패")
			}
			location.reload();
		}
		
	});
});

$(document).on("click",".list-add",function(){
	let input = $('.insert-input').last().clone().val('');
	$('.insert-list').append(input);
})

$(document).on("click",".save-btn",function(){
	let pd_num =${pd_num};
	let list = [];
	let input = $('.insert-input');
	let empty = false;
	input.each(function(){
		if($(this).val().trim().length == 0){
			empty=true;
		}
		list.push($(this).val());
	})
	if(empty){
		alert('입력되지 않은 항목이 있습니다.')
		return;
	}
	
	
	$.ajax({
		method:"post",
		url: "<c:url value='/admin/save/hashtag/"+pd_num+"'></c:url>",
		data : JSON.stringify(list),
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success:function(data){
			if(data.res){
				alert('등록성공!')
			}else{
				alert('등록실패!')
			}
			location.reload();
			
		}
	})
})



</script>