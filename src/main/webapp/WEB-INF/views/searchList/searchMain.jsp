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
	height:100%;
	box-shadow: 4px 4px 4px #dae1e6;
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
	
	/* 검색결과 전체 영역 */
.search-res {
    margin-top: 50px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* 검색결과 제목 */
.search-res h5 {
    font-size: 1.5rem;
    font-weight: bold;
    padding: 20px;
    background-color: #f5f5f5;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

/* 검색결과 내용 영역 */
.search-inner {
    padding: 20px;
}

/* 검색결과 리스트 */
.search-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    list-style: none;
    margin: 0;
    padding: 0;
}

/* 검색결과 아이템 */
.search-item {
    width: 48%;
    height: 200px; /* 높이를 200px로 고정 */
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
    padding:5px;
    position:relative;
}

/* 검색결과 이미지 */
.search-item img {
    display: block;
    object-fit: cover; /* 이미지 비율 유지하면서 자르기 */
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

/* 검색결과 제목 */
.search-item a:first-of-type {
    display: block;
    padding: 10px;
    font-size: 1.2rem;
    font-weight: bold;
    color: #333;
    text-decoration: none;
}

.search-item a{
float:left;
}

/* 검색결과 내용 */
.search-item-content {
    height: 120px;
    padding: 10px;

}
.search-item-content>p{
    font-size: 1rem;
    color: #666;
    line-height: 1.5;
    overflow: hidden;
    display: -webkit-box; /* WebKit 기반 브라우저에서 여러 줄 표시 */
    -webkit-line-clamp: 5; /* WebKit 기반 브라우저에서 생략 부호 표시할 줄 수 */
    -webkit-box-orient: vertical; /* WebKit 기반 브라우저에서 수직 방향으로 배치 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
}

/* 더보기 버튼 */
.detail-link {
    display: block;
    margin: 0 auto;
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 1rem;
    font-weight: bold;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

/* 더보기 버튼 호버 상태 */
.detail-link:hover {
    background-color: #0069d9;
}

.item-info {
    position: absolute;
    width:100%;
    bottom: 0;
    left: 0;
    padding:3px;

}

.item-info::after{
}
.item-info>a{
    font-size: 20px;
    color: #333;
    text-decoration: none;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    line-height : 49px;
    min-width:380px;

}
.item-info > span{
height:68px;
display:inline-block;
line-height:68px;
}

.co-info>a{
min-width:0px;
}
.co-info >span{
float:right;
margin-left:6px;
}


</style>
    
    
    	<div class="container">
		<div class="left">
			<div class="search-order">
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}'></c:url>">최신순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}&orderBy=view'></c:url>">인기순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchMain?search=${search}&orderBy=wish'></c:url>">추천순 정렬</a>
			</div>
			<div class="search-la search-res">
				<h5> 여행지 검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<ul class="search-list">
							<c:forEach items="${la}" var="i">
								<li class="search-item">
									<a href="<c:url value='/product/detail/detailLayoutTMP/${i.pd_num}'></c:url>"><img class="rounded" width="125px" height="125px" src="<c:url value='/download${i.file.fi_name}'></c:url>"></a>
									<div class="search-item-content">${i.pd_content}</div>
									<div class="item-info">
										<a href="<c:url value='/product/detail/detailLayoutTMP/${i.pd_num}'></c:url>">${i.pd_title}</a>
										<span><i style="margin-right: 0;"class="fas fa-eye"></i> : ${i.pd_viewcount}</span>
										<span><i style="margin-right: 0;"class="fas fa-heart"></i>: ${i.wishCount}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${ la.size() == 0}">
							<div style="text-align:center">
								<span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
				</div>
				<c:if test="${ la.size() != 0}">
		        	<a class="detail-link" href="<c:url value='/searchList/searchLa?search=${search}'></c:url>">더보기</a>
	        	</c:if>
				<c:if test="${ la.size() == 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchLa'></c:url>">여행지 더보기</a>
				</c:if>
			</div>
			<div class="search-re search-res">
				<h5> 음식점 검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<ul class="search-list">
							<c:forEach items="${re}" var="i">
								<li class="search-item">
									<a href="<c:url value='/product/detail/detailreyoutTMP/${i.pd_num}'></c:url>"><img class="rounded" width="125px" height="125px" src="<c:url value='/download${i.file.fi_name}'></c:url>"></a>
									<div class="search-item-content">${i.pd_content}</div>
									<div class="item-info">
										<a href="<c:url value='/product/detail/detailreyoutTMP/${i.pd_num}'></c:url>">${i.pd_title}</a>
										<span><i style="margin-right: 0;"class="fas fa-eye"></i> : ${i.pd_viewcount}</span>
										<span><i style="margin-right: 0;"class="fas fa-heart"></i>: ${i.wishCount}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${ re.size() == 0}">
							<div style="text-align:center">
								<span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
				</div>
				<c:if test="${ re.size() != 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchRe?search=${search}'></c:url>">더보기</a>
				</c:if>
				<c:if test="${ re.size() == 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchRe'></c:url>">음식점 더보기</a>
				</c:if>
			</div>
			<div class="search-fe search-res">
				<h5> 축제 검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<ul class="search-list">
							<c:forEach items="${fe}" var="i">
								<li class="search-item">
									<a href="<c:url value='/product/detail/detailreyoutTMP/${i.pd_num}'></c:url>"><img class="rounded" width="125px" height="125px" src="<c:url value='/download${i.file.fi_name}'></c:url>"></a>
									<div class="search-item-content">${i.pd_content}</div>
									<div class="item-info">
										<a href="<c:url value='/product/detail/detailreyoutTMP/${i.pd_num}'></c:url>">${i.pd_title}</a>
										<span><i style="margin-right: 0;"class="fas fa-eye"></i> : ${i.pd_viewcount}</span>
										<span><i style="margin-right: 0;"class="fas fa-heart"></i>: ${i.wishCount}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${ fe.size() == 0}">
							<div style="text-align:center">
								<span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
				</div>
				<c:if test="${ re.size() != 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchFe?search=${search}'></c:url>">더보기</a>
				</c:if>
				<c:if test="${ fe.size() == 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchFe'></c:url>">축제 더보기</a>
				</c:if>
			</div>
			<div class="search-ao search-res">
				<h5> 숙박 검색결과</h5>
				<div class="search-inner">
					<div class="search-result">
						<ul class="search-list">
							<c:forEach items="${ac}" var="i">
								<li class="search-item">
									<a href="<c:url value='/product/detail/detailfeyoutTMP/${i.pd_num}'></c:url>"><img class="rounded" width="125px" height="125px" src="<c:url value='/download${i.file.fi_name}'></c:url>"></a>
									<div class="search-item-content">${i.pd_content}</div>
									<div class="item-info">
										<a href="<c:url value='/product/detail/detailfeyoutTMP/${i.pd_num}'></c:url>">${i.pd_title}</a>
										<span><i style="margin-right: 0;"class="fas fa-eye"></i> : ${i.pd_viewcount}</span>
										<span><i style="margin-right: 0;"class="fas fa-heart"></i>: ${i.wishCount}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${ ac.size() == 0}">
							<div style="text-align:center">
								<span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
							</div>
						</c:if>
					</div>
				</div>
				<c:if test="${ ac.size() != 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchAc?search=${search}'></c:url>">더보기</a>
				</c:if>
				<c:if test="${ ac.size() == 0}">
					<a class="detail-link" href="<c:url value='/searchList/searchAc'></c:url>">숙박 더보기</a>
				</c:if>
			</div>
			<div class="search-co search-res">
			    <h5> 코스 검색결과</h5>
			    <div class="search-inner">
			        <div class="search-result">
			            <ul class="search-list">
			                <c:forEach items="${co}" var="i">
			                    <li class="search-item">
			                        <a href="<c:url value='/course/detail/${i.co_num}'></c:url>"><img class="rounded" width="125px" height="125px" src="<c:url value='/download${i.file.fi_name}'></c:url>"></a>
			                        <div class="search-item-content">${i.co_content}</div>
			                        <div class="item-info co-info">
			                            <a href="<c:url value='/course/detail/${i.co_num}'></c:url>">${i.co_title}</a>
			                            <span><i style="margin-right: 0;"class="fas fa-eye"></i> : ${i.co_views}</span>
			                            <span><i class="fas fa-thumbs-up"></i> : ${i.co_up} <i class="fas fa-thumbs-down"></i> : ${i.co_down}</span>
			                            <span>작성자 : ${i.co_me_id}</span>
			                        </div>
			                    </li>
			                </c:forEach>
			            </ul>
			            <c:if test="${ co.size() == 0}">
			                <div style="text-align:center">
			                    <span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
			                </div>
			            </c:if>
			        </div>
			    </div>
			    <c:if test="${ co.size() != 0}">
			    	<a class="detail-link" href="<c:url value='/course/list?type=0&search=${search}'></c:url>">더보기</a>
			    </c:if>
				<c:if test="${ co.size() == 0}">
					<a class="detail-link" href="<c:url value='/course/list'></c:url>">코스 더보기</a>
				</c:if>
			</div>
		</div>
	</div>