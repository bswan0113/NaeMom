<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	    <style>
   		.table-striped tbody tr:nth-of-type(odd) {
			background-color: #f9f9f9;
		}
		.table-hover tbody tr:hover {
			background-color: #e6e6e6;
		}
		.qna_title{
		width:30%;
		}
		.qna_title>a{
		color:black;
		}
		tbody{
		  overflow: hidden;
		  white-space: nowrap;
		  text-overflow: ellipsis;
		}
		.controller-box{
			float:right; margin-bottom:30px;
		}
		.btn_controll{
			font-weight:bold;
		}
	    </style>
	<div class="container mt-4">
		<h3>결제관리</h3>
		<div class="controller-box">
			<a href="<c:url value='/admin/list/buyCancelList'></c:url>">
				<button class="btn_controll btn-success btn">모든 결제</button>
			</a>
			<a href="<c:url value='/admin/list/buyCancelList/결제완료'></c:url>">
				<button class="btn_controll btn-success btn">결제완료</button>
			</a>
			<a href="<c:url value='/admin/list/buyCancelList/결제취소요청'></c:url>">
				<button class="btn_controll btn-success btn">결제취소요청</button>
			</a>
			<a href="<c:url value='/admin/list/buyCancelList/결제취소'></c:url>">
				<button class="btn_controll btn-success btn">결제취소</button>
			</a>
		</div>
		<!-- 결제취소 모달 -->
	  	<div class="modal common-modal" id="myModal" style="top:30%">
		  	<div class="modal-dialog">
				<div class="modal-content">
			 	     <!-- Modal Header -->
			  	    <div class="modal-header">
			  	      <h4 class="modal-title">결제취소</h4>
			  	      <button type="button" class="close" data-dismiss="modal">&times;</button>
			 	     </div>
					
			  	    <!-- Modal body -->
			  	    <div class="modal-body">
			 	    주문번호 : <span class="buy_num"></span><br>
			      	상세내용 : <textarea class="form-control" style="resize:none" id="cancel_content" name="cancel_content"></textarea>
			   	  	</div>
			
			      	<!-- Modal footer -->
			      	<div class="modal-footer">
			      	  <button type="button" class="btn btn-danger" data-dismiss="modal" name="cancel_modal" id="cancel_modal" data-num='' data-table=''>취소하기</button>
			      	  <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
			    	</div>

		    	</div>
			</div>
	  	</div>
		<table class="table table-striped mt-4">
			<thead>
				<tr>
					<th>결제상태</th>
					<th>결제날짜</th>
					<th>결제가격</th>
					<th>적립 마일리지</th>
					<th>사용 마일리지</th>
					<th>등록 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="li">
					<tr>
						<td>${li.bl_state }</td>
						<td class="qna_title">${li.bl_date }</td>
						<td>${li.bl_total_price }</td>
						<td>${li.bl_stack_mile }</td>
						<td>${li.bl_use_mile }</td>
						<td>
							<input type="hidden" name="bl_num" value="${li.bl_num }">
							<button class="btn btn-danger btn_buy_cancel" data-toggle="modal" data-target="#myModal" <c:if test='${li.bl_state =="결제취소" }'>disabled</c:if>>결제취소</button>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul class="comment-pagination pagination justify-content-center">
				
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${pm.startPage-1}'/>">이전</a>
					</li>
				</c:if>
		   	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			        <li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
			            <a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${i}'/>">${i}</a>
			        </li>
			    </c:forEach>
			    <c:if test="${pm.next}">
				    <li class="page-item">
				    	<a class="page-link" href="<c:url value='/admin/list/buyCancelList?page=${pm.startPage+1}'/>">다음</a>
				    </li>
			    </c:if>
			</ul>
	</div>
	<script>
		
		$('.btn_buy_cancel').click(function(){
			let order_id = $(this).siblings('[name=bl_num]').val();
			$('.buy_num').text(order_id)
		});
		$('[name=cancel_modal]').click(function(){
	  		let order_id = $('.buy_num').text();
			let reContent = $('[name=cancel_content]').val();
			if(reContent.trim().length  == 0){
				alert('취소 사유를 입력하세요.');
				$('[name=cancel_content]').focus();
				return false;
			}
			let me_id = '${user.me_id}';
			let cancel = {
					order_id : order_id,
					reContent : reContent,
					order_name : me_id
			}
			ajaxPost(cancel, '<c:url value="/admin/cancelBuyList"></c:url>', cancelSuccess);
			
			$('.buy_num').text('');
			$('[name=cancel_content]').val('');
  		});
		function cancelSuccess(data){
			let res = JSON.parse(data.str)
			if(res.status == 200){
				let bl_num = res.data.order_id
				ajaxPost(bl_num, '<c:url value="/admin/cancelListAndReserve"></c:url>', cancelOtherSuccess);
			}
		}
		function cancelOtherSuccess(){
			alert('결제가 취소되었습니다.')
			location.reload();
		}
		//ajax
	  	function ajaxPost(obj, url, successFunction){
			$.ajax({
				async:false,
				type: 'POST',
				data: JSON.stringify(obj),
				url: url,
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : successFunction
			});
		}
	</script>

	
    