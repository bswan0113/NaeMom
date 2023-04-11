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
   min-width:1100px;
 }
 .search-container{
   width: 80%;
   margin: 0 auto;
 }
 .search-result-box::after{
 content=''; display:block; clear:both;
 }
 
 .ocbox{
 padding:20px;
 }



.item-img{
width:100px;
height:100px;
}
</style> 

 <h1 style="margin-left:150px;">게시글 목록 조회</h1>
<form action="<c:url value='/admin/list/productList'></c:url>">
  <div class="search-container">
    <div class="search-filter">
		<select class="select-category form-control" name="pc_category">
		  <option value="0" <c:if test="${pm.cri.pc_category == '0'}">selected</c:if>>카테고리 선택</option>
		  <option value="1" <c:if test="${pm.cri.pc_category == '1'}">selected</c:if>>여행지</option>
		  <option value="2" <c:if test="${pm.cri.pc_category == '2'}">selected</c:if>>음식점</option>
		  <option value="3" <c:if test="${pm.cri.pc_category == '3'}">selected</c:if>>숙박</option>
		  <option value="4" <c:if test="${pm.cri.pc_category == '4'}">selected</c:if>>축제</option>
		</select>
		<select class="search-select form-control" name="searchFilter">
		  <option value="0" <c:if test="${pm.cri.searchFilter == '0'}">selected</c:if>>검색필터선택</option>
		  <option value="1" <c:if test="${pm.cri.searchFilter == '1'}">selected</c:if>>내용</option>
		  <option value="2" <c:if test="${pm.cri.searchFilter == '2'}">selected</c:if>>제목</option>
		  <option value="3" <c:if test="${pm.cri.searchFilter == '3'}">selected</c:if>>주소</option>
		</select>
    </div>
      <div class="form-group mr-2">
        <label for="searchInput" class="sr-only">검색어 입력</label>
        <input type="text" class="form-control" id="searchInput" placeholder="검색어 입력" value="${pm.cri.search}" name="search">
      </div>
      <button type="submit" class="btn btn-primary" id="search-btn">검색</button>
  </div>
</form>

  
  <div class="search-result-container mt-6">
    <ul style="margin: 0 auto; ">
    <c:forEach items="${list}" var="item">
      <li class="search-result-box" style="text-align:start;">
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
        <div class="ocbox" style="display:inline-block; margin-left:20px;" data-pd_num="${item.pd_num}">
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="월" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='월'}">checked</c:if>
			    </c:forEach>>월
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="화" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='화'}">checked</c:if>
			    </c:forEach>>화
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="수" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='수'}">checked</c:if>
			    </c:forEach>>수
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="목" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='목'}">checked</c:if>
			    </c:forEach>>목
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="금" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='금'}">checked</c:if>
			    </c:forEach>>금
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="토" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='토'}">checked</c:if>
			    </c:forEach>>토
			  </label>
			</div>
	       <div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="일" 
			    <c:forEach items="${item.dayoff}" var="day" >
			    <c:if test="${day.do_date=='일'}">checked</c:if>
			    </c:forEach>>일
			  </label>
			</div>
			
			<button class="btn btn-dark save-closed" >휴무일 저장</button>
		</div>
		<a class="btn btn-dark" href="<c:url value='/admin/insert/dayofftmp/${item.pd_num}'></c:url>">임시휴무 등록</a>
      </li>
     </c:forEach>
    </ul>


  </div>
    <a style="float:right;"href="<c:url value='/admin/insert/insertProduct'></c:url>" class="btn btn-dark">게시글 등록</a>
<ul class="pagination justify-content-center">
    <c:if test="${pm.prev}">
        <li class="page-item">
            <a class="page-link" href="<c:url value='/admin/list/productList?page=${pm.startPage-1}&search=${pm.cri.search}&type=${pm.cri.type}'/>">이전</a>
        </li>
    </c:if>
    <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
            <a class="page-link" href="<c:url value='/admin/list/productList?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'/>">${i}</a>
        </li>
    </c:forEach>
    <c:if test="${pm.next}">
        <li class="page-item">
            <a class="page-link" href="<c:url value='/admin/list/productList?page=${pm.endPage+1}&search=${pm.cri.search}&type=${pm.cri.type}'/>">다음</a>
        </li>
    </c:if>
</ul>
<script>

$(document).ready(function() {
	  // 페이지가 로드될 때 실행되는 함수
	  $('input.form-check-input').each(function() {
	    // 모든 form-check-input 요소를 반복하여 실행
	    if ($(this).is(':checked')) {
	      $(this).attr('data-state', '1'); // 체크된 요소의 data-state를 1로 설정
	    } else {
	      $(this).attr('data-state', '-1'); // 체크되지 않은 요소의 data-state를 -1로 설정
	    }
	  });

	  // 체크박스 상태가 변경될 때 실행되는 함수
	  $('input.form-check-input').on('change', function() {
	    if ($(this).is(':checked')) {
	      $(this).attr('data-state', '1'); // 체크된 요소의 data-state를 1로 설정
	    } else {
	      $(this).attr('data-state', '-1'); // 체크되지 않은 요소의 data-state를 -1로 설정
	    }
	  });
	});

$(document).on("click",".save-closed",function(){
	let closed=[];
	let opend=[];
	let pdNum=$(this).parent().data('pd_num');
    
	$(this).parent().find("input[type='checkbox']").each(function() {
		if($(this).data('state')!='1') closed.push($(this).val());
		if($(this).data('state')!='-1') opend.push($(this).val());
	  });

	 ajaxPost(false,closed,"<c:url value='/admin/dayoff/"+pdNum+"'></c:url>", function(data){
	 })
	 ajaxPost(false,opend,"<c:url value='/admin/dayoff/insert/"+pdNum+"'></c:url>", function(data){
		if(data.res){	 
		 alert('수정완료!');
			 location.reload();}
	 })
})
	
	
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
		
	
function ajaxGet(async,data, url, successFunc){
	$.ajax({
		async:async,
		type: 'GET',
		data: JSON.stringify(data),
		url: url,
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : successFunc
	});
}
</script>