<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
				.container {
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			grid-template-rows: repeat(4, 1fr);
			grid-gap: 20px;
			padding: 20px;
			background-color: #f0f0f0;
			min-width:900px;
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
			position:relative;
		}
		.block:hover {
			box-shadow: 0 0 10px rgba(0,0,0,0.3);
		}
		.block h5{
		position:absolute;
		top:4px;
		}
	</style>
	<h1>main home</h1>
	<div class="container">
		<div class="block">
			<h5>일간 인기검색어 Top 10</h5>
			<canvas id="dailykeyword"></canvas>
		</div>
		<div class="block">
			<h5>월간 인기검색어 Top 10</h5>
			<canvas id="monthlykeyword"></canvas>
		</div>
		<div class="block">
			<h5>연간 인기검색어 Top 10</h5>
			<canvas id="yearlykeyword"></canvas>
		</div>
		<div class="block">
			<h5>일간 방문자 통계</h5>
			선그래프, x축 시간(일), y축 방문자(10명단위)
			<canvas id="guest"></canvas>
		</div>
		<div class="block">
			<h5>월간 방문자 통계</h5>
			선그래프, x축 시간(월단위), y축 방문자(100명단위)
		</div>
		<div class="block">
			<h5>연간 방문자 통계</h5>
			선그래프, x축 시간(년단위), y축 방문자(1000명단위)
		</div>
		<div class="block">
			<h5>인기상품 랭킹(조회수별)</h5>
			막대그래프, x축 시간(일), y축 총조회수순으로 10위까지 나열
		</div>
		<div class="block">
			<h5>금일의 인기상품(조회수별)</h5>
			막대그래프, x축 상품, y축 총조회수, 조회수 증가량, 증가량 기준으로 10위까지 나열
		</div>
		<div class="block">
			<h5>금월의 인기상품(조회수별)</h5>
			막대그래프, x축 상품, y축 총조회수, 조회수 증가량, 증가량 기준으로 10위까지 나열
		</div>
		<div class="block">
			<h5>인기상품 랭킹(별점순)</h5>
			막대그래프, x축 시간(일), y축 총별점순으로 10위까지 나열
		</div>
		<div class="block">
			<h5>금일의 인기상품(별점순)</h5>
			막대그래프, x축 상품, y축 총조회수, 조회수 증가량, 증가량 기준으로 10위까지 나열
		</div>
		<div class="block">
			<h5>금월의 인기상품(별점순)</h5>
			막대그래프, x축 상품, y축 총조회수, 조회수 증가량, 증가량 기준으로 10위까지 나열
		</div>
	</div>

<script>


let dailyKeyword=${keyword};
let monthlyKeyword=${keywordM};
let yearlyKeyword=${keywordY};

$(document).ready(function(){
	drawpieChart(dailyKeyword,"#dailykeyword");
	drawpieChart(monthlyKeyword,"#monthlykeyword");
	drawpieChart(yearlyKeyword,"#yearlykeyword");
	drawLineGraph(0,"#guest");
	
})



function drawLineGraph(getData, id){
	let ctx = $(id);
	// 시간대 데이터
	let times = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"];

	// 데이터
	let data = [10, 20, 30, 25, 40, 35, 20, 15, 30, 40, 45, 50, 60, 55, 45, 30, 25, 20, 30, 35, 40, 50, 45, 30];
	let data2 = [101, 120, 30, 25, 40, 35, 20, 15, 30, 40, 45, 50, 60, 55, 45, 30, 25, 20, 30, 35, 40, 50, 45, 30];

	let chart = new Chart(ctx, {
	  // 차트 종류
	  type: 'line',

	  // 데이터
	  data: {
	    labels: times, // x축의 라벨 값 (시간대)
	    datasets: [{
		      label: '회원', // 데이터 이름
		      data: data, // y축의 값 (데이터)
		      fill: false, // 선만 표시
		      borderColor: 'rgb(75, 192, 192)', // 선 색상
		      tension: 0.1 // 곡선의 길이 (0~1)
		    }]
	  },

	  // 옵션
	  options: {
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true // y축의 최소값을 0으로 지정
	        }
	      }]
	    }
	  }
	});

}
function drawpieChart(getData, id){
    let labels = [];
    let data = {
        labels: labels,
        datasets: [{
            label: '검색 비율',
            data: [],
            borderWidth: 1
        }]
    };
    for(let i=0; i<getData.length; i++){
		labels.push(getData[i].sk_keyword);
		data.datasets[0].data.push(getData[i].per)
	}

    let config = {
        type: 'pie',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true
                }
            }
        },
    };

    let myChart = new Chart($(id), config);
}
function drawBarGraph(getData, id){
	
}
</script>


