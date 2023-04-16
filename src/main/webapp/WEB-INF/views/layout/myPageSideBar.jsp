<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .side-bar-list {
    padding: 20px;
    border-radius :4px;
    
	background-color: #29c16d72;
  }
  .side-bar-item {
    margin-bottom: 10px;
     box-shadow: 0 2px 5px #dae1e6;
     border-radius:10px;
     
  }
  .side-bar-link {
    display: block;
    padding: 10px;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    
  }
  .side-bar-link:hover {
    background-color: #fff;
    color: #29c16d72;
  }
</style>
<ul class="side-bar-list">
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/main"></c:url>" class="side-bar-link">메인</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/qnaList"></c:url>" class="side-bar-link">문의</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/reviewList"></c:url>" class="side-bar-link">후기조회</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/courseList"></c:url>" class="side-bar-link">여행코스 확인(작업진행중)</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/wishList"></c:url>" class="side-bar-link">찜(임시완료 코스연동필요)</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/reserveList"></c:url>" class="side-bar-link">결제/예약내역확인</a>
	</li>
	<li class="side-bar-item">
		<a href="<c:url value="/mypage/mileageList"></c:url>" class="side-bar-link">마일리지 조회</a>
	</li>

</ul>