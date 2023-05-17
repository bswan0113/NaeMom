<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* 컨테이너 및 검색창 스타일 */
.search-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

p{
margin-bottom:0;
}

.detail-search-window-box form {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.detail-search-input {
  width: 70%;
  height: 30px;
  padding: 10px;
  border: none;
  border-radius: 10px;
  font-size: 16px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  margin-right: 10px;
}

.detail-search-input:focus {
  outline: none;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
}

.detail-search-window-box form button {
  display: inline-block;
  background-color: #1abc9c;
  color: white;
  padding: 10px;
  border-radius: 10px;
  transition: all 0.2s;
  font-size: 16px;
}

.detail-search-window-box form button:hover {
  background-color: #16a085;
  cursor: pointer;
}

/* 검색 결과 스타일 */
.detail-search-result {
  display: flex;
  flex-wrap: wrap;
  margin: 0;
  padding: 0;
}
.de-result-item {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 300px;
  margin-bottom: 20px;
  min-width:800px;
}

.de-result-box {
  display: flex;
  flex-direction: column;
  height: 100%;
  border: 1px solid #ccc;
  padding: 10px;
}
.de-result-box .img-link {
  width:200px;
  height:200px;
  display: inline-block;
}



.result-info-box {
  display: flex;
  align-items: center;
  height:100px;
  
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.result-info-box span {
  margin-right: 15px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.result-content-box {
padding:10px;
 white-space: normal;
   overflow: hidden;
  text-overflow: ellipsis;
 
}
.result-content-box > div{
	padding:10px;
 white-space: normal;
   overflow: hidden;
  text-overflow: ellipsis;
}

.result-content-box p {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 7;
  -webkit-box-orient: vertical;
}

.de-result-top{
display:flex;
height:200px;
}

.info-imp{
width :200px;
}
.result-info-box >.info-imp:nth-child(2){
width:325px;
}
.result-info-box > span:nth-child(4),
.result-info-box > span:nth-child(5) {
  margin-left: auto;
}

.search-order {
	  display: flex;
	  align-items: center;
	  justify-content: flex-end;
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
</style>
    <div class="search-container">
        <div class="detail-search-window-box">
        	<form action="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&search=${pm.cri.search}'/>">
        		 <input type="hidden" name="pc_category" value="${pm.cri.pc_category}">
           		 <input type="text" class="detail-search-input" name="search">
           	 	 <button>검색</button>
            </form>
        </div>
        <div class="search-order">
				<a class="order-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${pm.cri.page}&search=${pm.cri.search}'></c:url>">최신순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${pm.cri.page}&search=${pm.cri.search}&orderBy=view'></c:url>">인기순 정렬</a>
				<a class="order-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${pm.cri.page}&search=${pm.cri.search}&orderBy=wish'></c:url>">추천순 정렬</a>
		</div>
        <c:if test="${pList.size() == 0}">
			<div style="text-align:center">
				<span style=" color:#dae1e6;"> 적합한 검색 결과가 없습니다. </span>
			</div>
		</c:if>
        <ul class="detail-search-result">
       
	        <c:forEach items="${pList}" var="p">
	            <li class="de-result-item">
	                <div class="de-result-box">
	                	<div class="de-result-top">
		                    <a class="img-link" href="<c:url value='/product/detail/detailLayoutTMP/${p.pd_num}?search=${pm.cri.search}'></c:url>"><img src="<c:url value='/download${p.file.fi_name}'></c:url>" alt="" width="200px" height="200px"></a>
		                    <div class="result-content-box">
		                    	${p.pd_content}
		                    </div>
	                    </div>
	                    <hr>
	                    <div class="result-info-box">
	                        <span class="info-imp">
	                        	<a style="color:black; font-weight:bold;" href="<c:url value='/product/detail/detailLayoutTMP/${p.pd_num}?search=${pm.cri.search}'></c:url>">${p.pd_title}</a></span>
	                        <span class="info-imp">위치 : ${p.pd_street_address} ${p.pd_detail_address}</span>
	                        <span class="info-imp">open : ${p.pd_open_time_str} &nbsp&nbsp close : ${p.pd_close_time_str}</span>
	                        <span><i class="fas fa-heart"></i> : ${p.wishCount}</span>
	                        <span><i class="fas fa-eye"></i> : ${p.pd_viewcount}</span>
	                    </div>
	                </div>
	            </li>
            </c:forEach>
        </ul>
        <ul class="comment-pagination pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${pm.startPage-1}&search=${pm.cri.search}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${i}&search=${pm.cri.search}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/searchList/searchDetailList?pc_category=${pm.cri.pc_category}&page=${pm.startPage+1}&search=${pm.cri.search}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
    </div>