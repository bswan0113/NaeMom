<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 현재 날짜 정보를 가져옴
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int year = cal.get(java.util.Calendar.YEAR); // 년도
    int month = cal.get(java.util.Calendar.MONTH) + 1; // 월 (0부터 시작하므로 +1)
    // 해당 월의 첫 날과 마지막 날 정보를 가져옴
    java.util.Calendar firstDayOfMonth = java.util.Calendar.getInstance();
    firstDayOfMonth.set(year, month - 1, 1); // 해당 월의 첫 날로 설정
    int lastDayOfMonth = firstDayOfMonth.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); // 해당 월의 마지막 날

    // 해당 월의 첫 번째 날짜의 요일을 가져옴
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("E");
    String firstDayOfWeek = sdf.format(firstDayOfMonth.getTime());
%>


<style>
	.calendar {
		border: 1px solid #ccc;
		padding: 20px;
		margin-top: 50px;
		background-color: #f5f5f5;
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
		background-color: #d9edf7;
	}
	.day-link{
	border:none;
	background:none;
	}
</style>

<div class="container">
<h1>이달의 축제</h1>
	<div class="row">
		<div class="col-md-12">
			<div class="calendar">
				<div class="calendar-header"><%= year %> 년 <%= month %> 월</div>
				<%= lastDayOfMonth %>
				<%= firstDayOfWeek %>
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
					          <td><button class="day-link">0</button></td>
					        </c:forEach>
					      </tr>
					    </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


    