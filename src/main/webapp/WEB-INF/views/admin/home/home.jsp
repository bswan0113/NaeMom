<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
				.container {
			display: grid;
			grid-template-columns: repeat(2, 1fr);
			grid-template-rows: repeat(4, 1fr);
			grid-gap: 20px;
			padding: 20px;
			background-color: #f0f0f0;
		}
		.block {
			height: 400px;
			background-color: #fff;
			box-shadow: 0 0 5px rgba(0,0,0,0.2);
			border-radius: 5px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			text-align: center;
			font-size: 24px;
			font-weight: bold;
		}
		.block:hover {
			box-shadow: 0 0 10px rgba(0,0,0,0.3);
		}
	</style>
	<h1>main home</h1>
	<div class="container">
		<div class="block">
			<h5>그래프 1</h5>
			<canvas id="myChart"></canvas>
		</div>
		<div class="block"></div>
		<div class="block"></div>
		<div class="block"></div>
		<div class="block"></div>
		<div class="block"></div>
		<div class="block"></div>
		<div class="block"></div>
	</div>
	
<script>
$(function() {
	  // 캔버스 선택
	  let ctx = document.getElementById("myChart").getContext("2d");

	  // 데이터 생성
	  let data = {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
	    datasets: [{
	      label: "매출",
	      backgroundColor: "rgba(255,99,132,0.2)",
	      borderColor: "rgba(255,99,132,1)",
	      borderWidth: 2,
	      hoverBackgroundColor: "rgba(255,99,132,0.4)",
	      hoverBorderColor: "rgba(255,99,132,1)",
	      data: [100, 200, 300, 400, 500, 600],
	    }]
	  };

	  // 옵션 설정
	  let options = {
	    responsive: true,
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true,
	        }
	      }]
	    }
	  };

	  // 차트 생성
	  let myChart = new Chart(ctx, {
	    type: 'bar',
	    data: data,
	    options: options
	  });
	});


</script>