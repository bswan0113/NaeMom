<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <title>관리자페이지 - 게시글목록</title> 
    
    
 <style>
 .search-result-container{
   border: 1px solid #dae1e6;
   width: 80%;
   margin: 0 auto;
   margin-top: 50px;
 }
 .search-container{
   width: 80%;
   margin: 0 auto;
 }



.item-img{
width:100px;
height:100px;
}
</style> 

 <h1 style="margin-left:150px;">게시글 목록 조회</h1>


  <div class="search-container">
    <div class="search-filter">
      <select class="select-category  form-control">
        <option value="0" selected>카테고리 선택</option>
        <option value="1">여행지</option>
        <option value="2">음식점</option>
        <option value="3">숙박</option>
        <option value="4">축제</option>
        
      </select>
      <select class="search-select  form-control">
        <option value="0" selected>검색필터선택</option>
        <option value="1">내용</option>
        <option value="2">제목</option>
        <option value="3">주소</option>
      </select>
    </div>
      <div class="form-group mr-2">
        <label for="searchInput" class="sr-only">검색어 입력</label>
        <input type="text" class="form-control" id="searchInput" placeholder="검색어 입력">
      </div>
      <button type="submit" class="btn btn-primary" id="search-btn">검색</button>
  </div>

  
  <div class="search-result-container mt-6">
    <ul>
    <c:forEach items="${list}" var="item">
      <li>
      	<img class="item-img" alt="" src="<c:url value='/download${item.file.fi_name}'></c:url>">
      	<a class="item-link" href="<c:url value='/product/detail/detailLayoutTMP/${item.pd_num}'></c:url>">${item.pd_title}</a>
        <a href="<c:url value='/admin/insert/updateProduct/${item.pd_num}'></c:url>"class="btn btn-dark product-update" data-num="${item.pd_num}">수정</a>
        <button class="btn btn-dark product-delete" data-num="${item.pd_num}">삭제</button>
        <c:if test="${item.pd_pc_num==1}">
         <a class="btn btn-dark" href="<c:url value='/admin/insert/optionLandMark/'></c:url>${item.pd_num}">옵션관리</a>
        </c:if>
        <c:if test="${item.pd_pc_num==2}">
         <a class="btn btn-dark" href="<c:url value='/admin/insert/optionRestraunt/'></c:url>${item.pd_num}">옵션관리</a>
        </c:if>
        <c:if test="${item.pd_pc_num==3}">
         <a class="btn btn-dark" href="<c:url value='/admin/insert/optionAccomodation/'></c:url>${item.pd_num}">옵션관리</a>
        </c:if>
        <c:if test="${item.pd_pc_num==4}">
         <a class="btn btn-dark" href="<c:url value='/admin/insert/optionFestival/'></c:url>${item.pd_num}">옵션관리</a>
        </c:if>
      </li>
     </c:forEach>
    </ul>


  </div>
    <a style="float:right;"href="<c:url value='/admin/insert/insertProduct'></c:url>" class="btn btn-dark">게시글 등록</a>
  <ul class="comment-pagination pagination justify-content-center">
		<li class="page-item">
			<a class="page-link" href="#">이전</a>
		</li>
	    <li class="page-item">
	    	<a class="page-link" href="#">1</a>
	    </li>
	    <li class="page-item">
	    	<a class="page-link" href="#">다음</a>
	    </li>
	</ul>
<script>
$('#search-btn').click(function(){
	let search = $('#searchInput').val();
	let category =$(this).prev().prev().children('.select-category').val();
	let filter =$(this).prev().prev().children('.search-select').val();
	
	ajaxGet(true,data, url, function(data){
		
	})
	});
	
	
	
$('.product-delete').click(function(){
	if(!confirm('정말 삭제하시겠어요?'))return;
	let number =$(this).data('num');
	ajaxPost(true,number,"<c:url value='/admin/delete/product'></c:url>", function(data){
		if(data.res){
			alert('삭제성공!');
			location.reload();
		}else{
			alert('삭제실패!')
		}
	})
})
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