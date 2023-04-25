<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	    <style>
	    
	   		.table-striped tbody tr:nth-of-type(odd) {
			background-color: #f9f9f9;
		}
		.table-hover tbody tr:hover {
			background-color: #e6e6e6;
		}
		.qna_title{
		width:30%;
		}
		.qna_title>a{
		color:black;
		}
		tbody{
		  overflow: hidden;
		  white-space: nowrap;
		  text-overflow: ellipsis;
		}
		.user-info td, .user-head th{
		text-align:center;
		}
		
		
.detail-search-window-box form {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.detail-search-input {
  width: 70%;
  height: 30px;
  padding: 10px;
  border: none;
  border-radius: 10px;
  font-size: 16px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  margin-right: 10px;
}

.detail-search-input:focus {
  outline: none;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
}

.detail-search-window-box form button {
  display: inline-block;
  background-color: #1abc9c;
  color: white;
  padding: 10px;
  border-radius: 10px;
  transition: all 0.2s;
  font-size: 16px;
}

.detail-search-window-box form button:hover {
  background-color: #16a085;
  cursor: pointer;
}

.prevent{
width:110px;
}

.modal{
top:300px;
}

.modal-dialog {
  margin: 0 auto;
  width:1000px;
}

#report-modal, #board-modal, #payment-modal {
    font-family: 'Noto Sans KR', sans-serif;
}

.modal-content {
    background-color: #f8f9fa;
}

.modal-header {
    background-color: #343a40;
    color: white;
}

.modal-title {
    font-size: 1.5rem;
}



.modal-dialog table {
    width: 100%;
    border-collapse: collapse;
    margin: 1rem 0;
}

.modal-dialog th,
.modal-dialog td {
    text-align: center;
    padding: 0.5rem;
    border: 1px solid #dee2e6;
}

.modal-dialog th {
    background-color: #e9ecef;
}

.modal-dialog tbody tr:nth-child(even) {
    background-color: #f8f9fa;
}

.report-content{
width:50px !important; 
white-space: nowrap;
text-overflow: ellipsis;
overflow:hidden;


}

	
	    </style>
	<div class="container">
	<h3>이용자 관리</h3>
		<div class="detail-search-window-box">
        	<form action="<c:url value='/admin/list/userList?page=${i}&search=${pm.cri.search}'/>">
           		 <input type="text" class="detail-search-input" name="search">
           	 	 <button>아이디 검색</button>
            </form>
        </div>
		<table class="table table-striped">
			<thead>
				<tr class="user-head">
					<th>아이디</th>
					<th>이름</th>
					<th>결제내역확인</th>
					<th>게시글 작성내역 확인</th>
					<th>신고내역확인</th>
					<th>비밀번호 초기화</th>
					<th>프로필확인</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ul}" var="ul">
					<tr class="user-info" data-user="${ul.me_id}">
							<td <c:if test="${ul.me_authority == 0}">style="color:red;"</c:if>>${ul.me_id}</td>
						<td>${ul.me_name}</td>
						<td><a class="btn btn-success list list-payment" data-toggle="modal" data-target="#payment-modal">결제내역</a></td>
						<td><a class="btn btn-success list list-board" data-toggle="modal" data-target="#board-modal">작성내역</a></td>
						<td><a class="btn btn-success list list-report" data-toggle="modal" data-target="#report-modal">신고내역</a></td>
						<td><button class="btn btn-success reset-pw">비밀번호초기화</button></td>
						<td><a class="btn btn-success" href="<c:url value='/mypage/profile/${ul.me_id}'></c:url>">기타 프로필 확인</a></td>
						<c:if test="${ul.me_authority == 0}">
							<td><button class="btn btn-danger prevent prevent-off">차단 해제</button></td>
						</c:if>
						<c:if test="${ul.me_authority != 0}">
							<td><button class="btn btn-danger prevent prevent-on">사용자 차단</button></td>
						</c:if>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/admin/list/userList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/admin/list/userList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/admin/list/userList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>
	
	<!-- 모달 -->
	
<div class="modal common-modal" id="payment-modal">
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		      <h4 class="modal-title">결제 내역 확인</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
   		    	<table>
		    		<thead>
		    			<tr>
		    				<th>이용정보</th>
		    				<th>결제정보</th>
		    				<th>결제금액</th>
		    				<th>결제날짜</th>
		    			</tr>
		    		</thead>
		    		<tbody class="payment-list modal-table-body">
		    		</tbody>
		    	</table>
		    	<div class="payment-pagination pagi-box">
		    	</div>
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>

<div class="modal common-modal" id="board-modal">
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		      <h4 class="modal-title">작성 내역 확인</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
		    	<select class="form-control select-boardType">
		    		<option value="0">-카테고리 선택-</option>
		    		<option value="코스">코스</option>
		    		<option value="리뷰">리뷰</option>
		    		<option value="댓글">댓글</option>
		    	</select>
   		    	<table>
		    		<thead>
		    			<tr>
		    				<th>제목</th>
		    				<th>등록날짜</th>
		    			</tr>
		    		</thead>
		    		<tbody class="board-list modal-table-body">
		    		</tbody>
		    	</table>
			    <div class="board-pagination pagi-box">
		    	</div>
		    </div>
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>

<div class="modal common-modal" id="report-modal" >
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
		      <h4 class="modal-title">신고 내역 확인</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
		    	<table>
		    		<thead>
		    			<tr>
		    				<th>분류</th>
		    				<th>신고 된 게시글</th>
		    				<th>누적 신고 횟수</th>
		    			</tr>
		    		</thead>
		    		<tbody class="report-list modal-table-body">
		    		</tbody>
		    	</table>
		    	<div class="report-pagination pagi-box">
		    	</div>
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>
<script>


$(document).on("click",".list",function(){
	let id = $(this).parents(".user-info").data("user");
	$('.modal-table-body').empty();
	$('.modal').attr("data-user",id);
	if($(this).hasClass("list-payment")){
		getPaymentList(id,1);
		return;
	}
	if($(this).hasClass("list-report")){
		getReportList(id,1);
		return;
	}
	
});
$(document).on("change",".select-boardType",function(){
	let type=$(this).val();
	if(type == "0")return;
	let id =$(this).parents('.modal').attr("data-user");
	getBoardList(id,1,type);
})


function getReportList(id,page){
    $.ajax({
        url:"<c:url value='/admin/getReportList/"+id+"/"+page+"'></c:url>",
        method:"GET",
        async:false, 
        success : function(data){
            for(let i=0; i<data.re.length;i++){
                let tr = $('<tr>');
                let title = $('<td>').text(data.re[i].title).addClass("report-content");
                let rep_table = $('<td>').text(data.re[i].rep_table);
                let reportCount = $('<td>').text(data.re[i].reportCount);
                tr.append(rep_table,title,reportCount);
                $('.report-list').append(tr);
            }
            addPagination("report",data.pm);
        }
    });
}




function getPaymentList(id, page){
	$.ajax({
		url:"<c:url value='/admin/getPaymentList/"+id+"/"+page+"'></c:url>",
		method:"GET",
		async:false, 
		success : function(data){
			for(let i=0; i<data.bl.length;i++){
                let tr = $('<tr>');
                let state = $('<td>').text(data.bl[i].bl_state);
                let bl_total_price = $('<td>').text(data.bl[i].bl_total_price);
                let bl_date = $('<td>').text(data.bl[i].bl_date_str);
                let button = $('<a>').addClass("btn btn-success").attr("href", "<c:url value='/" + data.bl[i].bl_num + "'/>").text("결제정보");
           		let link = $('<td>').html(button);
                
                tr.append(state,link,bl_total_price,bl_date);
                $('.payment-list').append(tr);
			}
			addPagination("payment",data.pm);
		}
	})
}


function getBoardList(id,page,type){
	$.ajax({
		url:"<c:url value='/admin/getBoardList/"+id+"/"+page+"/"+type+"'></c:url>",
		method:"GET",
		success : function(data){
			console.log(data.pm)
			console.log(data.ob)
			if(type=="코스"){
				createCourse(data.ob);

				addPagination("board",data.pm,"코스");
			}
			if(type=="리뷰"){
				createReview(data.ob);

				addPagination("board",data.pm,"리뷰");
			}
			if(type=="댓글"){
				createComment(data.ob);
				addPagination("board",data.pm,"댓글");
			} 
		}
	})
}

function createCourse(course){
	let tr = $('<tr>');
	let td1= $('<td>');
	let a = $('<a>').attr("href","<c:url></c:url>").addClass("btn btn-success").text(course.co_title);
	td1.html(a);
	let td2=$('<td>').text(course.co_register_data_str);
	tr.append(td1,td2);
	$('.board-list').html(tr);
	
	
}
function createReview(review){
	
}
function createComment(comment){
	
}

function addPagination(type,pm, bo_type){
	$('.pagi-box').html("");
	let ul = $('<ul>').addClass("comment-pagination pagination justify-content-center");

	for(let i=1; i<=pm.endPage;i++){
		let li= $('<li>').addClass("page-item").data("page",i);
		let a= $('<button>').addClass("page-link").text(i).attr("data-page",i);
		li.html(a);
		ul.append(li);
	}
	
	if(type=="board"){
		$('.board-pagination').append(ul).attr("data-botype",bo_type);
		return;	
		
	}
	if(type=="payment"){
		$('.payment-pagination').append(ul);
		return;	
		
	}
	if(type=="report"){
		$('.report-pagination').append(ul);
		return;	
	}
	
}

$(document).on("click",".page-link",function(){
	let page = $(this).data("page");
	let id = $(this).parents('.modal').attr("data-user");
	$('.modal-table-body').empty();
	if($(this).parents().hasClass("report-pagination")){
		getReportList(id, page);
		return;
	}

	if($(this).parents().hasClass("board-pagination")){
		let type=$(".board-pagination").attr("data-botype");
		getBoardList(id, page, type);
		return;
	}

	if($(this).parents().hasClass("payment-pagination")){
		getPaymentList(id, page);
		return;
	}
})



$('.reset-pw').click(function(){
	let id = $(this).parents(".user-info").data("user");
	if(!confirm(id+'님의 비밀번호를 초기화하시겠습니까?'))
		return;
	$.ajax({
		url:"<c:url value='/admin/resetPw/"+id+"'></c:url>",
		method:"GET",
		success : function(data){
			if(data.res){
				alert('초기화성공')
			}else{
				alert('초기화 실패')
			}
		}
	})
	
})

$('.prevent').click(function(){
		let authority=0;
		let id=$(this).parents(".user-info").data("user");
		
	if($(this).hasClass('prevent-off')){
		authority=1;
	}
	let member ={
			me_authority:authority,
			me_id: id
	}
	if(authority == 0){
		if(!confirm(id+"를 차단하시겠습니까?"))return false;
	}
	if(authority == 1){
		if(!confirm(id+"의 차단을 해제하시겠습니까?"))return false;
	}
	
	
	$.ajax({
		url:"<c:url value='/admin/preventUser'></c:url>",
		method:"POST",
		dataType:"json"	,	
		data: JSON.stringify(member),
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			if(data.res && authority==0){
				alert('차단되었습니다.');
				location.reload();
			}if(data.res && authority==1){
				alert('차단이 해제되었습니다.');
				location.reload();
			}			
			if(!data.res){
				alert('오류가 발생하였습니다. 다시 시도해주세요.')
			}
		}
	})
})


</script>