<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자페이지 - 상세등록</title> 
<style>

h1{
	text-align: center;
	margin: 50px;
	font-weight: bold;
}
       
</style>
 	
<h1 class="text-primary">컨텐츠 등록 페이지</h1> <br><hr>
<div class="container-fluid mt-6 mb-6">
	<form action="<c:url value='/main/insert/checked'/>" method="post">
		<div class="form-group">
			<label for="title">검색</label>
			<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력해주세요.">
		</div>
		<div class="form-group">
			<div class="search-list">
				<div class="container">
			    <table class="table table-hover" id="user-table">
			    <thead>
			      <tr>
			        <th>이름</th>
			        <th>지역</th>
			        <th></th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach items="${plist}" var="product">
			      <tr>
			        <td>${product.pd_title}<input type="hidden" name="pd_title" value="${product.pd_title}"></td>
			        <td>${product.pd_street_address}<input type="hidden" name="pd_street_address" value="${product.pd_street_address}"></td>
			        <td><input type="checkbox" name="pdc_checked" id="pdc_checked" value="${product.pd_num} " <c:if test="${product.pdc_num != null}">checked</c:if>></td>
			      </tr>
			      
			    </c:forEach>
			    </tbody>
			  </table>
			</div>
		</div>
		<br><hr>
		<button type="submit" class="btn btn-success btn-insert">등록하기</button>
		<button class="btn btn-danger btn-cancel">등록취소</button>
		<br><hr>
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js">

//키워드
$(document).ready(function(){
	$('#keyword').keypress(function(){
		console.log(this);
		
		$.ajax({
		    'url':'/main/insert',   
		    'data':{'keyword':$('#keyword').val()},
		    'dataType':'json',
		    'type':'GET',
		    'success':function(data){
		    
		    	console.log(data);
		    	console.log('aJax after'); 
		    },

			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}

		   });
	})
}) 

/* $(document).ready(function() {
  $('input[name="pdc_checked"]').prop('checked', true);
  $(".btn-insert").click(function() {
    var checkedList = [];
    $('input[name="pdc_checked"]:checked').each(function() {
      checkedList.push($(this).val());
      
    });
    
    $.ajax({
      type: "POST",
      url: "<c:url value='/main/insert'/>",
      data: { checked: checkedList },
      success: function(response) {
        console.log(response);
      },
      error: function(xhr, status, error) {
        console.log(xhr.responseText);
      }
    });
  });
});
 */
$(document).ready(function() 
	  $('input[name="pdc_checked"]').each(function() {
	    var pdNum = $(this).val();
	    if ($.inArray(pdNum, checkedList) !== -1) {
	      $(this).prop('checked', true);
	    }
	  });
	  
	  $(".btn-insert").click(function() {
	    var checkedList = [];
	    $('input[name="pdc_checked"]:checked').each(function() {
	      checkedList.push($(this).val());
	    });
	    
	    $.ajax({
	      type: "POST",
	      url: "<c:url value='/main/insert/checked'/>",
	      data: { pdc_checked: checkedList },
	      success: function(response) {
	        console.log(response);
	      },
	      error: function(xhr, status, error) {
	        console.log(xhr.responseText);
	      }
	    });
	  });
	});

</script>

