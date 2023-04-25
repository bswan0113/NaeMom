<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- qna 상세페이지 HTML 코드 -->
<div style="width:100%; padding:40px;">
	<div>
		<h4>문의상세</h4>
		<hr>
	</div>
	<div class="board-post">
	  <div class="board-post-header">
	    <h2 class="board-post-title">${qna.qa_title}</h2>
	    <div class="board-post-info">
	      <strong>문의 구분 : </strong>&nbsp;<span class="board-post-category">${qna.qa_qs_category}</span>
	      <strong> 작성일 : </strong>&nbsp;<span class="board-post-date">${qna.qa_registerd_date_str}</span>
	    </div>
	  </div>
	  <div class="board-post-content">
	 	 <strong>문의 내용 : </strong><br>
	    <p>${qna.qa_content}</p>
	  </div>
	</div>
	
	<form class="answer-box" action="<c:url value='/admin/list/qnaAnswer'></c:url>" method="post">
		<textarea class="form-control answer-input" name="qaa_content"></textarea>
		<input type="hidden" name="qaa_qa_num" value="${qna.qa_num}">
		<button class="btn btn-success delete-btn">답변 작성</button>
	</form>
</div>

<style>
.answer-input{
min-height:500px;
}
.answer-box{
border: 1px solid #dae1e6;
}

.board-post {
  border: 1px solid #d8d8d8;
  background-color: #fff;
  padding: 30px;
  margin-bottom: 30px;
  width:80%;
  display:inline-block;
  min-height:500px;
}

.board-post-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.board-post-title {
  font-size: 28px;
  font-weight: bold;
  margin: 0;
}

.board-post-info {
  display: flex;
  align-items: center;
  font-size: 14px;
  color: #666;
}

.board-post-info span {
  margin-right: 20px;
}

.board-post-category {
  padding: 3px 6px;
  border-radius: 3px;
  background-color: #f5f5f5;
  color: #666;
}

.board-post-date {
  white-space: nowrap;
}

.board-post-content p {
  font-size: 16px;
  line-height: 1.5;
  margin: 0;
}

</style>



