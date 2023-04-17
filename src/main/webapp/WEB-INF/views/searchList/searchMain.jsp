<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<style>
	.container {
		display: flex;
		flex-direction: row;
		min-height: 2500px;
		overflow: hidden;
	}
	.left {
		display: flex;
		flex-direction: column;
		flex-basis: 100%;
		flex-grow: 1;
		padding: 10px;
		box-sizing: border-box;
		overflow-y: scroll;
		scrollbar-width: none;
	}
	.left::-webkit-scrollbar {
		width: 0;
		height: 0;
	}
	.search-res{
	padding:20px;
	}
	.search-inner{
	position:relative;
	border: 1px solid #dae1e6;
	height:100%;
	box-shadow: 4px 4px 4px #dae1e6;
	border-radius : 20%;
	}
		.detail-link{
		position : absolute;
		bottom:2px;
		right:2px;
		color:black;
		}
		.order-link {
	  margin-right: 10px;
	  color: #8d8d8d;
	  font-size: 14px;
	  text-decoration: none;
	  border-bottom: 2px solid transparent;
	  transition: border-color 0.2s ease-in-out;
	}
	
	.order-link:hover {
	  border-color: #5f5f5f;
	}
	
	.search-order {
	  display: flex;
	  align-items: center;
	  justify-content: flex-end;
	  padding-right: 20px;
	}
	
	.search-order > *:last-child {
	  margin-right: 0;
	}

</style>
    
    
    	<div class="container">
		<div class="left">
			<div style="flex-basis: 5%;" class="search-order">
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}'></c:url>">최신순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}&orderBy=view'></c:url>">인기순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}&orderBy=wish'></c:url>">추천순 정렬</a>
			</div>
			<div style="flex-basis: 19%;" class="search-la search-res">
				<h5>검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<c:if test="${ la.size() == 0}">
							<div style="text-align:center">
								<span style="line-height:431px; color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
					<a class="detail-link" href="">더보기</a>
				</div>
			</div>
			<div style="flex-basis: 19%;"  class="search-re search-res">
				<h5>검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<c:if test="${ re.size() == 0}">
							<div style="text-align:center">
								<span style="line-height:431px; color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
					<a class="detail-link" href="">더보기</a>
				</div>
			</div>
			<div style="flex-basis: 19%;"  class="search-ac search-res">
			 	<h5>검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<c:if test="${ ac.size() == 0}">
							<div style="text-align:center">
								<span style="line-height:431px; color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
					<a class="detail-link" href="">더보기</a>
				</div>
			</div>
			<div style="flex-basis: 19%;"  class="search-fe search-res">
				<h5>검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<c:if test="${ fe.size() == 0}">
							<div style="text-align:center">
								<span style="line-height:431px; color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
					<a class="detail-link" href="">더보기</a>
				</div>
			</div>
			<div style="flex-basis: 19%;">
			</div>
		</div>
	</div>