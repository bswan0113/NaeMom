<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
   .note-container {
  border: 1px solid #ccc;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position:relative;
  min-height:500px;
}

.note-container h5 {
  font-size: 18px;
  margin: 0 0 10px;
}

.note-container button,.send,.receive {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 8px 12px;
  margin-right: 10px;
  border-radius: 3px;
  cursor: pointer;
  font-size: 14px;
}


.note-container button:hover,.send:hover, .receive:hover {
  background-color: #0056b3;color: #fff;
}

.note-list {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
  
}

.note-list .note-info {
  background-color: #f5f5f5;
  font-weight: bold;
}

.note-list .note-info td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.note-list .note-detail td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
  text-overflow:ellipsis;
  overflow:hidden;
  white-space:nowrap;
}
.note-list .note-detail:nth-child(even) {
  background-color: #f9f9f9;
}

.note-list .note-detail:last-child td {
  border-bottom: none;
}
.content-box{
position:absolute;
width:500px;
height:500px;
border:1px solid #dae1e6;
top:20%;
left:30%;
background:#dae1e6;
}

.note-detail td .content{
background-color:#f9f9f9;
  text-overflow:ellipsis;
  overflow:hidden;
  white-space:nowrap;
  width:500px;
}
.note-detail td .content:hover{
font-weight:bold;
}
	.selected-sender {
		font-weight: bold;
		font-size: 18px;
		color: black;
	}

	.selected-date {
		font-size: 14px;
		color: gray;
	}

	.selected-content {
		margin-top: 10px;
		background-color: #f5f5f5;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		height:80%;
		width:500px;
	}
	.selected-content>*{width:500px;
	}

    </style>
    
    <div class="note-container">
    	<h2>쪽지함</h2>
    	<a href="<c:url value='/note/noteList'></c:url>" class="receive">받은 쪽지</a>
    	<a href="<c:url value='/note/noteList?isRead=1'></c:url>" class="send">보낸 쪽지</a>
    	<button class="send-note" data-toggle="modal" data-target="#Modal">쪽지보내기</button>
    	<table class="note-list">
    		<tr class="note-info">
				<th style="width:110px;">
				    <c:choose>
				        <c:when test="${isSend}">
				            받은 사람
				        </c:when>
				        <c:otherwise>
				            보낸 사람
				        </c:otherwise>
				    </c:choose>
				</th>
    			<th style="width:500px;">내용</th>
    			<th>발송날짜</th>
    			<th> </th>
    			<th> </th>
    		</tr>
    		<c:forEach items="${note}" var="no">
    			<tr class="note-detail" data-num="${no.nt_num}">
    				<td  style="width:110px;">
    				 <c:choose>
				        <c:when test="${isSend}">
				          ${no.nt_receiver}
				        </c:when>
				        <c:otherwise>
				          ${no.nt_sender}
				        </c:otherwise>
				    </c:choose>
    				</td>
    				<td style="width:500px;">
    					<button class="content"style="color: ${no.nt_is_read ? '#dae1e6' : 'black'};">${no.nt_content}</button>
    				</td>
    				<td>${no.nt_date_str}</td>
    				<td>
    					<c:if test="${!isSend}">
    						<button class="reply"data-target="#Modal"data-toggle="modal" data-sender="${no.nt_sender}">답장하기</button>
   						</c:if>
 					</td>
    				<td><button class="delete">삭제하기</button></td>
    			</tr>
    		</c:forEach>
    	</table>
    	<c:if test="${!isSend}">
	    	<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/note/noteList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/note/noteList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/note/noteList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
		</c:if>
    	<c:if test="${isSend}">
	    	<ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/note/noteList?isRead=1&page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/note/noteList?isRead=1&page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/note/noteList?isRead=1&page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
		</c:if>
    	<div class="content-box" style="display:none;">
    		<button class="close"style="float:right; margin:0;">X</button>
    		<span class="selected-sender"></span>
    		<span class="selected-date"></span>
    		<hr>
    		<div class="selected-content">
    		내용 : 
    		</div>
    	</div>
    </div>
    
<div class="modal common-modal" id="Modal">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">쪽지보내기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
      	<input class="form-control" name="nt_receiver" id="nt_receiver">
      	<textarea name="nt_content"class="form-control" id="nt_content"></textarea>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" id="send-note-btn">발송</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
      
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
	$('.content').click(function() {
	    $('.content-box').show();
	    let receiver =$(this).parent().prev().text();
	    let content = $(this).text();
	    let date = $(this).parent().next().text();
	    if(${isSend}){
	    $('.selected-sender').text("받은 사람 : " + receiver);
	    }
	    else{
    	$('.selected-sender').text("보낸 사람 : " + receiver);
	    }
	    $('.selected-date').text("발송일 : " + date);
	    $('.selected-content').text("내용 : " + content);
	    let num =$(this).parent().parent().data('num');
	    $.ajax({
	    	url:"<c:url value='/note/isread/"+num+"'></c:url>",
	    	method:"get"
	    })
	  });
	  
	  $('.close').click(function(){
		  $('.content-box').hide();
		    $('.selected-sender').text("");
		    $('.selected-date').text("");
		    $('.selected-content').text("");
	  });
	  
	  $('.delete').click(function(){
		  let num =$(this).parent().parent().data('num');
		  $.ajax({
		    	url:"<c:url value='/note/delete/"+num+"'></c:url>",
		    	method:"get",
		    	success:function(res){
		    		if(res){
		    			alert("삭제되었습니다.");
		    		}
		    		location.reload();
		    	}
		    })
	  });
	  $('#send-note-btn').click(function(){
		let receiver= $('#nt_receiver').val();
		let content= $('#nt_content').val();
		sendMail(receiver,content);
	  });
	  
	  function sendMail(receiver,content){
		  let note ={
				  nt_receiver : receiver,
				  nt_content : content
		  }
		  $.ajax({
			  method:"post",
			  url:"<c:url value='/note/send'></c:url>",
			  dataType: "json",
			  data: JSON.stringify(note),
			  contentType: "application/json",
			  success:function(res){
				  if(res){
					  alert('발송성공!');
				  }else{
					  alert("쪽지발송에 실패했습니다. 수신자 아이디를 확인해주세요.");
				  }
				  location.reload();
			  }
		  });
	  };

	  
	  $('.reply').click(function(){
		  let sender= $(this).data("sender");
		  $('#nt_receiver').val(sender);
	  })
	  
	});

</script>