<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .profile-list{
    display: flex;
    flex-wrap: wrap;
    list-style-type: none;
    padding: 0;
    margin: 0;
  }
  .profile-list li {
  	padding:20px;
    margin: 10px;
  }
  .profile-list li span {
    display: block;
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
    margin-top: 20px;
  }
  .profile-list li img {
    border-radius: 50%;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
  }
  .btn-update-container {
    display: flex;
    justify-content: flex-start;
    margin-top: 20px;
  }
  .btn-update {
    display: inline-block;
    background-color: #29c16d;
    color: #fff;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-left: 55px;
  }
  .btn-update:hover {
    background-color: #239a55;
  }
</style>

<ul class="profile-list">
  <li>
    <span>프로필 사진:</span>
    <br>
    <c:if test="${user.member_profile ==null}">
    <img src="https://via.placeholder.com/200x200" alt="프로필 사진" width="200" height="200">
    </c:if>
    <c:if test="${user.member_profile !=null}">
      <img src="<c:url value='/download${user.member_profile.mf_name}'/>" alt="프로필 사진" width="200" height="200">
    </c:if>
  </li>
  <li>
    <span>아이디:</span><br>
    ${user.me_id}
    <span>닉네임 :</span>
     ${user.me_nickname}
     <span>생일 : </span>
     ${user.me_birthday_str}
     <span>이메일 : </span>
     ${user.me_ma_email}
     
  </li>
  <li>
    <span>주소:</span>
    ${user.me_street_address} ${user.me_detail_address}<br>
    <span style="font-weight:400; font-size:16px; margin:0;">(지번 주소: ${user.me_registered_address} ${user.me_detail_address}) </span>
  </li>
  <li>
    <span>마지막 방문일:</span>
    ${user.me_session_limit_str}
  </li>
  <li>
    <span>잔여 마일리지:</span>
    ${user.me_mileage}<br>
    <span>일주일 내 소멸 마일리지:</span>
    ${user.me_mileage}
  </li>
</ul>
    <a href="<c:url value="/mypage/profile"></c:url>"class="btn-update">프로필 편집하기</a>
