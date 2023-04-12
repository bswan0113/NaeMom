<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
  <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
  <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
  <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
  <!-- <script type="text/javascript" src="<c:url value='//dapi.kakao.com/v2/maps/sdk.js?appkey=??'></c:url>"></script> -->
  <title>courseList</title>
  <style>
  	*{
		padding: 0; margin: 0;
	}
	#body{ 
	  min-width: 1190px; 
	  font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	  line-height: 16px; font-size: 12px; color: #202020; 
	}
	ul,li{
	  list-style: none;
	}
  
	.clearfix::after{
	  content: ''; clear: both; display: block; 
	}
	a{
	  text-decoration: none;
	}
	.contents {
	    width: 1190px;
	    margin: 0 auto;
	    padding: 0 0 27px 0;
	}
	.cos-title-name{
	  font-size: 30px;
	}
	.box_listSort{
		width: 1190px;
		padding-bottom: 20px; border-bottom: 1px solid #ccc;
	}
	.sort_list{
		float: right; padding-right: 48px;
	}
	
	
	.box_cosList{
		width: 1190px; display: flex; flex-wrap: wrap;
		padding-bottom: 20px; border-bottom: 1px solid #ccc;
	}
	.course_list{
		width: 300px; margin-right: 48px; margin-left: 48px; margin-top: 48px; 
		
	}
	.course_desk{
		width: 300px; height: 125px; background: grey; position: relative;
	}
	
	.course_desk > a{
		position: absolute; left: 0; top: 0; right: 0; bottom: 0; text-decoration: none;
		background: rgba(0, 0, 0, 0.5); box-sizing: border-box; padding: 20px 20px;
	}
	.course_desk strong{
		overflow: hidden; height: 47px; font-size: 20px; color: #fff;
		margin-bottom: 7px; font-weight: 700; line-height: 1.2; text-overflow: ellipsis;
		display: block;
	}
	.box_distance{
		width: 180px; position: absolute; bottom: 0;
	}
	.box_distance > li{
		width: 100%; overflow: hidden; display: inline-block; text-overflow: ellipsis;
		white-space: nowrap; color: #e4f0fa; font-size: 15px;
	}
	.userInfo{
		position: absolute; right: 10px; bottom: 6px; display: block; max-width: 131px;
		line-height: 30px;
	}
	.userInfo em{
		overflow: hidden; display: block; white-space: nowrap; text-overflow: ellipsis;
		font-size: 16px; color: #fff; font-weight: 700; font-style: normal;
	}
	.course_item_img{
		width: 100%; height: 100%; object-fit: cover; object-position: top;
	}
	.box_cosList .course_list >ul{
		border: 1px solid #e5e4e4; padding: 0 20px 16px 40px;
	}
	.box_cosList .course_list > ul li:first-child {
    padding-top: 20px;
	}
	.box_cosList .course_list > ul li{
		background: url(<c:url value='/resources/img/courseImg/line_leftobj.png'></c:url>) 0 0 repeat-y; line-height: 20px; padding: 10px 0;
	}
	.box_cosList .course_list > ul li:last-child{
		background: url(<c:url value='/resources/img/courseImg/line_leftobj.png'></c:url>) 0 0 no-repeat;
	}
	.box_cosList .course_list > ul li > span{
		display: block; margin-left: -5px; padding-left: 20px; background: url(<c:url value='/resources/img/courseImg/ico_leftobj.png'></c:url>) 0 50% no-repeat;
		color: #000; font-size: 16px;
	}
	.box_cosList .course_list > ul li > span a{
		text-decoration: none; color: #333;
	}
	.content_null_box{
		width : 1190px; height : 300px; text-align:center; padding-top:100px;
	}
  </style>
  
</head>
<body>
	<div class="contents">
		<label class="cos-title-name ml-5">코스제목</label>
		<div class="box_listSort clearfix">
			<div class="sort_list">
				<button type="button" class="btn btn-outline-success" onclick="location.href='/naemom/course/list?orderBy=co_num'">최신순</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='/naemom/course/list?orderBy=co_up'">추천순</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='/naemom/course/list?orderBy=co_views'">조회순</button>
			</div>
		</div>
		<div class="box_cosList clearfix">
			<c:if test="${list.size() == 0 }">
				<div class="content_null_box">
					<span style="font-size: 50px">해당하는 코스가 없습니다</span>
				</div>
			</c:if>
			<c:forEach items="${list}" var="co">
				<c:if test="${co.co_report < 10 }">
					<div class="course_list">
						<div class="course_desk">
							<a href="<c:url value='/course/detail/${co.co_num }'></c:url>"><strong>${co.co_title}</strong>
								<ul class="box_distance">
									<li>
										조회수 : <span>${co.co_views }</span> 추천수 : <span>${co.co_up }</span>
									</li>
									<li>
										총거리 : <span>${co.co_total_distance }</span>km
									</li>
								</ul>
								<span class="userInfo">
									<em>${co.co_me_id }</em>
								</span>
							</a>
							<c:forEach items="${files}" var="fi">
								<c:forEach items="${items}" var="item">
									<c:if test="${fi.fi_table_key == item.ci_pd_num && co.co_num == item.ci_co_num && item.ci_index == 1}">
										<img src="<c:url value='/download${fi.fi_name }'></c:url>" alt="" class="course_item_img">
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
						<ul>
							<c:forEach items="${items}" var="item">
								<c:if test="${co.co_num == item.ci_co_num}">
									<li>
										<span>
												<a href="#">${item.pd_title }</a>
										</span>
									</li>
								</c:if>
							</c:forEach>
							
						</ul>
					</div>
				</c:if>
			</c:forEach>
			
			
			
		</div>
		<ul class="pagination justify-content-center mt-5">
			<li class="page-item <c:if test="${!pm.prev }"> disabled</c:if>">
				<a href="<c:url value='/course/list?page=${pm.startPage-1}&search=${pm.cri.search }&type=${pm.cri.type }'></c:url>" class="page-link">이전</a>
			</li>
			<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
				<li class="page-item <c:if test="${i==pm.cri.page }"> active</c:if>">
					<a href="<c:url value='/course/list?page=${i}&search=${pm.cri.search }&type=${pm.cri.type }'></c:url>" class="page-link">${i}</a>
				</li>
			</c:forEach>
			
			<li class="page-item <c:if test="${!pm.next }"> disabled</c:if>">
				<a href="<c:url value='/course/list?page=${pm.endPage+1}&search=${pm.cri.search }&type=${pm.cri.type }'></c:url>" class="page-link">다음</a>
			</li>
		</ul>
		<form class="input-group mb-3 mt-5" style="width: 1190px;" action="#">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<select class="form-control" name="type">
						<option value="0">전체</option>
						<option value="1">당일여행</option>
						<option value="2">1박2일</option>
						<option value="3">2박3일 이상</option>
					</select>
				</div>
				<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" value="${pm.cri.search}">
				<div class="input-group-append">
					<button class="btn btn-success" type="submit">검색</button>
				</div> 
			</div>
		</form>
		
			<a class="btn btn-outline-success" href="<c:url value='/course/insert'></c:url>">글쓰기</a>
		
	</div>
  
	
	
	
<script>
	$('.btn_date').click(function(){
		
		
	})
</script>
	
</body>
</html>
