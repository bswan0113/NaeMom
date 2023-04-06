<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <title>관리자페이지 - 게시글목록</title> 
      
<div class="container-fluid mt-6 mb-6">
	<div>
	<c:forEach items="${list}" var="product">
	
	</c:forEach>
	</div>

</div>

