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
}

.note-container h5 {
  font-size: 18px;
  margin: 0 0 10px;
}

.note-container button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 8px 12px;
  margin-right: 10px;
  border-radius: 3px;
  cursor: pointer;
  font-size: 14px;
}

.note-container button:hover {
  background-color: #0056b3;
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
}
.note-list .note-detail td :nth-child(2){
width:500px;
}

.note-list .note-detail:nth-child(even) {
  background-color: #f9f9f9;
}

.note-list .note-detail:last-child td {
  border-bottom: none;
}

    </style>
    
    <div class="note-container">
    	<h5>쪽지함</h5>
    	<button>받은쪽지</button>
    	<button>보낸쪽지</button>
    	<button>쪽지보내기</button>
    	<table class="note-list">
    		<tr class="note-info">
    			<td>보낸사람</td>
    			<td>내용</td>
    			<td>발송날짜</td>
    			<td></td>
    			<td></td>
    		</tr>
    		<c:forEach items="${note}" var="no">
    			<tr class="note-detail">
    				<td>${no.nt_receiver}</td>
    				<td>${no.nt_content}</td>
    				<td>${no.nt_date_str}</td>
    				<td><button>답장하기</button></td>
    				<td><button>삭제하기</button></td>
    			</tr>
    		</c:forEach>
    	</table>
    </div>