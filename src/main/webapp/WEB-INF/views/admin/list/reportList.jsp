<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	    <style>
/* 공통 스타일 */
.container {
  margin: 0 auto;
  max-width: 960px;
  padding: 0 15px;
  box-sizing: border-box;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
}

th, td {
  padding: 15px;
  text-align: left;
  border: 1px solid #ccc;
  text-align:center;
}

table th:nth-child(1),
table td:nth-child(1){
width:30%;
overflow:hidden;
white-space:nowrap;
text-overflow:ellipsis;
}

/* 리뷰 테이블 스타일 */
.review-table {
  background-color: #f9f9f9;
}

.review-table th {
  background-color: #4CAF50;
  color: white;
}

/* 댓글 테이블 스타일 */
.comment-table {
  background-color: #f1f1f1;
}

.comment-table th {
  background-color: #ff9800;
  color: white;
}

/* 코스 테이블 스타일 */
.course-table {
  background-color: #f9f9f9;
}

.course-table th {
  background-color: #2196F3;
  color: white;
}

#report-list{
top:300px;
}

	    </style>
	<div class="container">
		<h3>신고 게시글 조회</h3>
		<table class="review-table">
			<thead>
				<tr>
					<th>리뷰</th>
					<th>작성자</th>
					<th>신고 내용 조회</th>
					<th>사용자 차단</th>
					<th>게시글 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rel}" var="rel">
					<tr>
						<td>${rel.re_content}</td>
						<td>${rel.re_me_id}</td>
						<td><button class="btn btn-danger view" data-num="${rel.re_num}" data-type="review" data-toggle="modal" data-target="#report-list">신고 내용 조회</button></td>
						<td><button class="btn btn-danger prevent"  data-user="${rel.re_me_id}">사용자 차단</button></td>
						<td><button class="btn btn-danger delete" data-num="${rel.re_num}" data-type="review"> 게시글 삭제</button></td>
					</tr>
				</c:forEach>
				<c:if test="${rel.size()== 0}">
					<tr>
						<td colspan="5" style="color:#dae1e6; font-weight:bold;font-size:15px;"> 누적 신고수 5이상의 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<table class="comment-table">
			<thead>
				<tr>
					<th>댓글</th>
					<th>작성자</th>
					<th>신고 내용 조회</th>
					<th>사용자 차단</th>
					<th>게시글 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rcl}" var="rcl">
					<tr >
						<td>${rcl.rc_content}</td>
						<td>${rcl.rc_me_id}</td>
						<td><button class="btn btn-danger view"  data-num="${rcl.rc_num}" data-type="comment" data-toggle="modal" data-target="#report-list">신고 내용 조회</button></td>
						<td><button class="btn btn-danger prevent"  data-user="${rcl.rc_me_id}">사용자 차단</button></td>
						<td><button class="btn btn-danger delete"  data-num="${rcl.rc_num}" data-type="comment">게시글 삭제</button></td>
					</tr>
				</c:forEach>
				<c:if test="${rcl.size()== 0}">
					<tr>
						<td colspan="5" style="color:#dae1e6; font-weight:bold;font-size:15px;"> 누적 신고수 5이상의 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<table class="course-table">
			<thead>
				<tr>
					<th>코스</th>
					<th>작성자</th>
					<th>신고 내용 조회</th>
					<th>사용자 차단</th>
					<th>게시글 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${col}" var="col">
					<tr>
						<td>${col.co_title}</td>
						<td>${col.co_me_id}</td>
						<td><button class="btn btn-danger view"  data-num="${col.co_num}" data-type="course" data-toggle="modal" data-target="#report-list">신고 내용 조회</button></td>
						<td><button class="btn btn-danger prevent"  data-user="${col.co_me_id}">사용자 차단</button></td>
						<td><button class="btn btn-danger delete"  data-num="${col.co_num}" data-type="course">게시글 삭제</button></td>
					</tr>
				</c:forEach>
				<c:if test="${col.size()== 0}">
					<tr>
						<td colspan="5" style="color:#dae1e6; font-weight:bold;font-size:15px;"> 누적 신고수 5이상의 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
		
<div class="modal common-modal" id="report-list">
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
			    			<th>구분</th>
			    			<th>사유</th>
			    			<th>신고날짜</th>
		    			</tr>
		    		</thead>
		    		<tbody class="report-detail">
		    		</tbody>
		    	</table>
		    </div>
		
		    <!-- Modal footer -->
		    <div class="modal-footer">
		      <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>

	
<script>

$('.view').click(function(){
	$('.report-detail').html("");
	let type= $(this).data("type");
	let num =$(this).data("num");
	$.ajax({
		method:"GET",
		url:"<c:url value='/admin/reportList/"+type+"/"+num+"'></c:url>",
		success:function(data){
			console.log(data.list);
			createReport(data.list);
		}
	})
	
	
})

function createReport(re){
	for(let i=0; i<re.length;i++){
		let tr =$('<tr>');
		let td1 =$('<td>').text(re[i].rep_category);
		let td2 =$('<td>').text(re[i].rep_content);
		let td3 =$('<td>').text(re[i].rep_date_str);
		tr.append(td1,td2,td3);
		$('.report-detail').append(tr);
	}
	
}


$('.delete').click(function(){
	if(!confirm("삭제하시겠어요?")) return;
	
	let num = $(this).data("num");
	let type= $(this).data("type");

	if(type=="course"){
		deleteCourse(num);
	}
	if(type=="review"){
		deleteReview(num);
	}
	if(type=="comment"){
		deleteComment(num);
	}
	
})


function deleteCourse(num){
	$.ajax({
		url: "<c:url value='/admin/delete/course/"+num+"'></c:url>",
		method:"get",
		success:function(data){
			if(data.res){
				alert("삭제완료");
			}else{
				alert("삭제실패!")
			}
				location.reload();
		}
	})
}

function deleteReview(num){
	$.ajax({
		url: "<c:url value='/admin/delete/review/"+num+"'></c:url>",
		method:"get",
		success:function(data){
			if(data.res){
				alert("삭제완료");
			}else{
				alert("삭제실패!")
			}
				location.reload();
		}
	})
}

function deleteComment(num){	
	$.ajax({
		url: "<c:url value='/admin/delete/comment/"+num+"'></c:url>",
		method:"get",
		success:function(data){
			if(data.res){
				alert("삭제완료");
			}else{
				alert("삭제실패!")
			}
				location.reload();
		}
	})
}

$('.prevent').click(function(){
	let authority=0;
	let id=$(this).data("user");
	return;
	
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