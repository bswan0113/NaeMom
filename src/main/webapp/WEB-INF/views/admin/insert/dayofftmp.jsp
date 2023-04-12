<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <title>임시휴무 등록</title>
        <style>
        .datepicker {
        transform: scale(1.5);
        transform-origin: left top;
        display: inline-block;
        vertical-align: top; /* 폼태그와 데이트피커가 수직정렬 */
        margin-right: 2rem; /* 데이트피커 오른쪽에 폼태그를 위치시키기 위해 margin 추가 */
    }
    form {
        display: inline-block;
        vertical-align: top; /* 폼태그와 데이트피커가 수직정렬 */
        flex-direction: row;
        align-items: center;
        margin-left:200px;
    }
    .form-group {
        margin-right: 2rem;
    }
    table{
    display:inline-block;
    }
    .my-table{
    border:1px solid #dae1e6;
    position:relative;
    }
    .my-table tbody tr td{
    padding:5px;
    border: 1px solid #dae1e6;
    text-align:center;
    }
	.my-table thead th {
	  background-color: #dae1e6; /* 헤드 음영 처리 */
	  padding:5px;
	  border: 1px solid #dae1e6;
	  text-align:center;
	}
	caption{
	postion:absolute;
	top:0;
	}
    
        </style>


<h4>${product.pd_title} 임시휴무 등록</h4><a style="" class="btn btn-dark" href="<c:url value='/admin/list/productList'></c:url>">등록취소</a>
<h4 style="margin-left:750px;">등록된 휴무</h4>
    <div class="datepicker"></div>
<form action="<c:url value='/admin/insert/dayofftmp'></c:url>" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="start_date">시작날짜:</label>
    <input type="text" class="form-control" id="start_date" name="to_start">
  </div>

  <div class="form-group">
    <label for="end_date">종료날짜:</label>
    <input type="text" class="form-control" id="end_date" name="to_end">
  </div>
  <input type="hidden" name="pd_num" value="${product.pd_num}">
  <button class="btn btn-dark" id="save">임시휴무저장</button>
</form>
<table class="my-table">
  <thead>
    <tr>
      <th>시작날짜</th>
      <th>종료날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="tempOff" items="${tmp}">
      <tr>
        <td>${tempOff.to_start_str}</td>
        <td>${tempOff.to_end_str}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
<script>
$('form').submit(function(event) {
    event.preventDefault(); // 기본 제출 이벤트를 중지합니다.

    let to_start = $('#start_date').val();
    let to_end = $('#end_date').val();
    console.log(to_start);
    console.log(to_end);
    if (to_start > to_end) {
        alert('시작날짜가 종료날짜보다 큽니다!');
        return;
    }
    if (confirm('임시휴무를'+to_start+'부터'+to_end+'까지 등록할까요?')) {
        // 폼을 제출하는 코드를 작성합니다.
        this.submit();
    } else {
        alert('임시휴무등록을 취소했습니다!');
    }
});


$(document).ready(function() {
    // Datepicker initialization
    var selectedStartDate, selectedEndDate;

    $('.datepicker').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true,
      todayHighlight: true,
      clearBtn: true,
      clearBtnText: '초기화', // "Clear" 버튼의 문구를 "초기화"로 변경
      multidate: 2,
      multidateSeparator: ' - ',
      forceParse: false
    }).on('changeDate', function(e) {
      // 선택한 날짜를 변수에 저장
        selectedStartDate = moment(e.dates[0]).format('YYYY-MM-DD');
        selectedEndDate = moment(e.dates[1]).format('YYYY-MM-DD');

      console.log(selectedStartDate)
      // 인풋태그에 각각 선택한 날짜 입력
      $('#start_date').val(selectedStartDate);
      $('#end_date').val(selectedEndDate);
    });
  });
</script>