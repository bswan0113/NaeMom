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
  #note-box{
	margin-left:10px;
   border:1px solid white;
   position:relative;
   display:inline-block;
  }
  #note-box a{
  font-size:22px;
    height:50px;
  line-height:150px;
  width:150px;
  margin-left:20px;
  margin-right:3px;
  color:#29c16d;
  }
  .send-count{
  position:absolute;
  background-color:red;
  border-radius:100%;
  color:white;
  width:20px;
  height:20px;
  font-size:14px;
  text-align:center;
  top:57px;
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
    <span>아이디:</span>
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
    ${user.expirationMileage}
  </li>
</ul>
    <button data-toggle="modal" data-target="#myModal" class="btn btn-success btn-update">프로필 편집하기</button>
    <div id="note-box">
    	<div class="send-count">${user.unreadMail}</div>
	    <a href="<c:url value='/note/noteList'></c:url>"><i class="fas fa-envelope"></i>쪽지함</a>
    </div>
<!-- 신고 모달 -->
  <div class="modal common-modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			비밀번호 입력 : 
			<input class="form-control" id="pw" type="password">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success check-pw" data-dismiss="modal" id="report-modal">입력</button>
          <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
    
    
<script>
$('.check-pw').click(function(){
	   var pw = $('#pw').val();
	    if(pw.trim().length<=0){
	    	alert('비밀번호를 입력해주세요')
	    	return false;
	    }
	    $.ajax({
	        type: 'POST',
	        data: 'pw=' + pw, 
	        url: "<c:url value='/mypage/pwcheck'></c:url>",
	        success: function(data){
	        	if(data.res){
	        		location.href = "<c:url value='/mypage/profile'></c:url>"; // 수정된 부분

		    	}
	        	else{
	        		alert('비밀번호가 틀립니다!')
	        		location.reload();
	        		
	        	}
	        }
	    });

	    
})

</script>