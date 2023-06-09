<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<style>
	.calendar {
		border: 1px solid #ccc;
		padding: 20px;
		margin-top: 50px;
		background-color: #f5f5f5;
		position:relative;
		min-width: 1000px;
	}
	.calendar-header {
		text-align: center;
		font-size: 24px;
		margin-bottom: 20px;
	}
	.calendar-table {
		width: 100%;
		table-layout: fixed;
	}
	.calendar-table th,
	.calendar-table td {
		padding: 10px;
		text-align: center;
		border: 1px solid #ccc;
		vertical-align: middle;
		max-height:200px;
	}
	.calendar-table th {
		background-color: #f5f5f5;
		font-weight: bold;
	}
	.calendar-table td {
		background-color: #fff;
		height:100px;
		text-align:start;   
		 vertical-align: top; /* 숫자를 상단으로 이동 */
    	padding-top: 10px;
	}
	.calendar-table td.today {
		background-color: #29c16d72;
	}
	.calendar-table td.today .day-link{
		font-weight:bold;
		color:
	}
	.day-link{
	border:none;
	background:none;
	}
	.btn-month {
	  position: absolute;
	  top: 10px;
	  width: 120px;
	  height: 40px;
	  background-color: #29c16d;
	  border: none;
	  border-radius: 20px;
	  color: #fff;
	  font-weight: bold;
	  font-size: 16px;
	  cursor: pointer;
	}
	
	.btn-month:hover {
	  background-color: #4caf50;
	}
	
	.prev {
	  left: 10px;
	}
	
	.next {
	  right: 10px;
	}

	.calendar-table td.noneday {
		background:#dae1e6; 
	}
	
	
	.year-select { 
	display: flex;
	  align-items: center;
	  justify-content: center;
	  width: 120px;
	  height: 40px;
	  font-size: 16px;
	  font-weight: bold;
	  color: #333;
	  border: 2px solid #ccc;
	  border-radius: 5px;
	  outline: none;
	  padding: 5px 10px;
	  background-color: #fff;
	  background-image: linear-gradient(to bottom, #f8f8f8, #fff);
	  background-repeat: no-repeat;
	  background-position: center right 10px;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  margin: 0 auto; /* 추가 */
		  
	}
	
		.fe-item {
	  color: gray;
	  background-color: none;
	  overflow:hidden;
	  text-overflow: ellipsis;
   	 white-space: nowrap;
   	 border-bottom: 1px solid gray;
	  
	}
	.fe-list{
	max-height:170px;
	overflow:hidden;
	 text-overflow: ellipsis;
   	 white-space: nowrap;
	}
	
	.fe-link {
	  display: block;
	  text-decoration: none;
    color: yellowgreen;
	}
	
	.fe-link:hover {
	  background-color: lightgray;
	}
	.today .fe-link {
	font-weight:bold;
	color:#2c6425
	}
	
</style>

<div class="container">
<h1>이달의 축제</h1>
	<div class="row">
		<div class="col-md-12">
			<div class="calendar">
				<button class="btn-month prev">이전달 축제</button>
				<div class="calendar-header">
				</div>
				<button class="btn-month next">다음달 축제</button>
				<table class="calendar-table">
					<thead>
						<tr>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
							<th>일</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach begin="0" end="5" var="week">
					      <tr>
					        <c:forEach begin="0" end="6" var="day">
					          <td>
					          	<button class="day-link">
					          	</button>
					          	<ul class="fe-list">
					          	</ul>
					          </td>
					        </c:forEach>
					      </tr>
					    </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


    
<script>
	let date ={};
	let selectedDay={
			 year: parseInt(new Date().getFullYear()),
			 month: parseInt(new Date().getMonth()) + 1,
			 day : 0
	}
	
$(document).ready(function(){
	let today = selectedDay;
	
	inputDate(today);
	inputYearMonth();
	inputDay();
})	

$(document).on("click",".prev",function(){
	selectedDay.month = selectedDay.month-1
	if(selectedDay.month<=0){
		selectedDay.month =12;
		selectedDay.year = selectedDay.year-1;
	}
	inputDate(selectedDay);
	inputYearMonth();
	inputDay();
})

$(document).on("click",".next",function(){
	selectedDay.month = selectedDay.month+1
	if(selectedDay.month>12){
		selectedDay.month =1;
		selectedDay.year = selectedDay.year+1;
	}
	inputDate(selectedDay);
	inputYearMonth();
	inputDay();
})

function inputDate(today){	
	$.ajax({
		async:false,
		data : today,
		method : "POST",
		url : "<c:url value='/getDateInfoOfThisMonth'></c:url>",
		success: function(data){
			date=data.cal;	
		}
	});
};
function inputYearMonth(){
	$('.calendar-header').html('<div data-year="'+date.year+'" data-month="'+date.month+'"class="year-select">'+date.year + '년' + date.month + '월</div>');
	
}


function inputDay(){
	$('tbody tr td').removeClass('today');
	$('tbody tr td').removeClass('noneday');
	$('tbody tr td').find('.day-link').html('');
	
	let firstDayofWeek = date.firstDay;
	let toDay = date.toDay;
	let lastDay = date.lastDay;
	// a를 지닌 th 요소 선택
	let targetTh = $('th').filter((index, element) => {
	  return $(element).text() === firstDayofWeek;
	});

	// 해당 열의 첫번째 td 요소 선택
	let targetTd = $('tbody tr td').eq(targetTh.index());
	$('.fe-list').html('');
	for (let i = targetTh.index(), j = 0; j < lastDay; i++, j++) {
		let pdList= [];
		// 해당하는 td 엘리먼트를 찾아서 날짜를 업데이트합니다.
		$('tbody tr td').eq(targetTh.index() + j).find('.day-link').html(j + 1);
		$('tbody tr td').eq(targetTh.index() + j).data("date", j+1);
		selectedDay.day=j + 1
		pdList = addFesInfo();
		if(pdList.length>0){
			for(let k=0; k<pdList.length; k++){
				let feItem = $('<li>').addClass('fe-item');
				let feLink = $('<a>').addClass('fe-link')
									    .text(pdList[k].pd_title)  
									    .attr('data-num', pdList[k].pd_num)  
									    .attr('href', '<c:url value="/product/detail/detailLayoutTMP/'+pdList[k].pd_num+'"></c:url>');
				feItem.append(feLink);
				$('.fe-list').eq(targetTh.index() + j).append(feItem);
			}
		}
		
	}
	
	
	
	if(date.month==parseInt(new Date().getMonth()+1)){
		$('tbody tr td').eq(targetTh.index()+toDay-1).addClass('today');
		
	}
	$('tbody tr td:has(.day-link:empty)').addClass('noneday');

}

function addFesInfo(){
	let pdList=[];
	let pd_title;
	let pd_num;
	let start;
	let end;
	$.ajax({
		async:false,
		data : selectedDay,
		method : "POST",
		url : "<c:url value='/getFeInfo'></c:url>",
		success: function(data){
			for(let i=0; i<data.FeList.length; i++){
				let product = {
						pd_title:data.FeList[i].pd_title,
						pd_num:data.FeList[i].pd_num,
						start :data.FeList[i].pd_fe_start_str,
						end :data.FeList[i].pd_fe_end_str,
				}
						pdList.push(product)
			}
		}
	});
		return pdList;
	

}



</script>