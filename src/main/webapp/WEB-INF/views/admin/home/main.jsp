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
			<h5>전일 시간대별 방문자 통계</h5>
			<canvas id="visitDaily"></canvas>
		</div>
		<div class="block">
			<h5>전월 일간 방문자 통계</h5>
			<canvas id="visitMonthly"></canvas>
		</div>
		<div class="block">
			<h5>연간 방문자 통계</h5>
			<canvas id="visitYearly"></canvas>
		</div>
		<div class="block">
			<h5>인기상품 랭킹(조회수별)</h5>
			<canvas id="rankingByViewCount"></canvas>
		</div>
		<div class="block">
			<h5>금주의 인기상품(조회수별)</h5>
			<canvas id="rankTodayByViewCount"></canvas>
		</div>
		<div class="block">
			<h5>금월의 인기상품(조회수별)</h5>
			<canvas id="rankMonthlyByViewCount"></canvas>
		</div>
		<div class="block">
			<h5>인기상품 랭킹(찜순)</h5>
			<canvas id="rankingByRated"></canvas>
		</div>
		<div class="block">
			<h5>금주의 인기상품(찜순)</h5>
			<canvas id="rankingByRatedDaily"></canvas>
		</div>
		<div class="block">
			<h5>금월의 인기상품(찜순)</h5>
			<canvas id="rankingByRatedMonthly"></canvas>
		</div>
	</div>

<script>

let calendar =${calendar}
let dailyKeyword=${keyword};
let monthlyKeyword=${keywordM};
let yearlyKeyword=${keywordY};
let visitG= ${visit};
let visitM = ${visitM};
let visitMG= ${visitMG};
let visitMM= ${visitMM};
let visitYG= ${visitYG};
let visitYM= ${visitYM};
let productRanking = ${productRanking};
let weeklyPRanking = ${weeklyPRanking};
let monthlyPRanking=${monthlyPRanking};
let productRankingByRated = ${productRankingByRated};
let rankingByRatedDaily= ${rankingByRatedMonthly};
let rankingByRatedMonthly= ${rankingByRatedMonthly};


$(document).ready(function(){
	drawpieChart(dailyKeyword,"#dailykeyword");
	drawpieChart(monthlyKeyword,"#monthlykeyword");
	drawpieChart(yearlyKeyword,"#yearlykeyword");
	drawLineGraph(visitG,visitM,"#visitDaily");
	drawLineGraphMonthly(visitMG,visitMM,"#visitMonthly");
	drawLineGraphYearly(visitYG,visitYM,"#visitYearly");
	drawBarGraph(productRanking,"#rankingByViewCount");
	drawBarGraph2(weeklyPRanking,"#rankTodayByViewCount");
	drawBarGraph2(monthlyPRanking,"#rankMonthlyByViewCount");
	drawBarGraphByRated(productRankingByRated,"#rankingByRated");
	drawBarGraphByRated2(rankingByRatedDaily,"#rankingByRatedDaily");
	drawBarGraphByRated2(rankingByRatedMonthly,"#rankingByRatedMonthly");
})

function drawLineGraphYearly(getData,getData2, id){
	let ctx = $(id);
	let data = [];
	let data2 = [];
	// 시간대 데이터
	let month = [];
	let today = new Date();
	
	for(let i=0; i<12;i++){ 
	    month.push(i+1); 
	    data.push(0);
	    data2.push(0);
	}
	for(let i=0; i<getData.length; i++){
	    data[parseInt(getData[i].month, 10) - 1]++;
	}
	for(let i=0; i<getData2.length; i++){
	    data2[parseInt(getData2[i].month, 10) - 1]++;
	}
		
	let chart = new Chart(ctx, {
		  // 차트 종류
		  type: 'line',

		  // 데이터
		  data: {
		    labels: month, // x축의 라벨 값 (시간대)
		    datasets: [{
			      label: '비회원', // 데이터 이름
			      data: data, // y축의 값 (데이터)
			      fill: false, // 선만 표시
			      borderColor: '#FF4500 ', // 선 색상
			      tension: 0.1 // 곡선의 길이 (0~1)
			    },{
				      label: '회원', // 데이터 이름
				      data: data2, // y축의 값 (데이터)
				      fill: false, // 선만 표시
				      borderColor: '#00BFFF', // 선 색상
				      tension: 0.1 // 곡선의 길이 (0~1)
				    }]
		  },

		  // 옵션
		  options: {
		    scales: {
		      yAxes: [{
		        ticks: {
		          precision: 0,
		          beginAtZero: true // y축의 최소값을 0으로 지정
		        }
		      }]
		    }
		  }
		});
}

function drawLineGraphMonthly(getData,getData2, id){
	let ctx = $(id);
	let data = [];
	let data2 = [];
	// 시간대 데이터
	let day = [];
	let today = new Date();
	
	for(let i=0; i<calendar.lastDay;i++){
		day.push(i);
		data.push(0);
		data2.push(0);
	}
	for(let i=0; i<getData.length; i++){
		let day = parseInt(getData[i].day, 10); // day 변수를 10진수 숫자로 파싱
		  data[day]++;
	}
	for(let i=0; i<getData2.length; i++){
		let day = parseInt(getData2[i].day, 10); // day 변수를 10진수 숫자로 파싱
		  data2[day]++;
	}
		
	let chart = new Chart(ctx, {
		  // 차트 종류
		  type: 'line',

		  // 데이터
		  data: {
		    labels: day, // x축의 라벨 값 (시간대)
		    datasets: [{
			      label: '비회원', // 데이터 이름
			      data: data, // y축의 값 (데이터)
			      fill: false, // 선만 표시
			      borderColor: '#FF4500 ', // 선 색상
			      tension: 0.1 // 곡선의 길이 (0~1)
			    },{
				      label: '회원', // 데이터 이름
				      data: data2, // y축의 값 (데이터)
				      fill: false, // 선만 표시
				      borderColor: '#00BFFF', // 선 색상
				      tension: 0.1 // 곡선의 길이 (0~1)
				    }]
		  },

		  // 옵션
		  options: {
		    scales: {
		      yAxes: [{
		        ticks: {
		        	precision: 0,
		          beginAtZero: true // y축의 최소값을 0으로 지정
		        }
		      }]
		    }
		  }
		});
}

function drawLineGraph(getData,getData2, id){
	
	let ctx = $(id);
	let data = [];
	let data2 = [];
	// 시간대 데이터
	let times = [];
	for (let i = 0; i < 24; i++) {
	  times.push(i);
	  data.push(0);
	  data2.push(0);
	}
	
	for(let i=0; i<getData.length; i++){
		data[getData[i].hour]++;
	}
	for(let i=0; i<getData2.length; i++){
		data2[getData2[i].hour]++;
	}

	// 데이터

	let chart = new Chart(ctx, {
	  // 차트 종류
	  type: 'line',

	  // 데이터
	  data: {
	    labels: times, // x축의 라벨 값 (시간대)
	    datasets: [{
		      label: '비회원', // 데이터 이름
		      data: data, // y축의 값 (데이터)
		      fill: false, // 선만 표시
		      borderColor: '#FF4500 ', // 선 색상
		      tension: 0.1 // 곡선의 길이 (0~1)
		    },{
			      label: '회원', // 데이터 이름
			      data: data2, // y축의 값 (데이터)
			      fill: false, // 선만 표시
			      borderColor: '#00BFFF', // 선 색상
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
        },
    };

    let myChart = new Chart($(id), config);
}
function drawBarGraph(getData, id){
	let ctx = $(id);
	
	let label =[];
	let data1 = [];
	
	for(let i=0; i<getData.length; i++){
		label.push(getData[i].pd_title);
		data1.push(getData[i].pd_viewcount);
	}
	
	let data = {
		labels: label,
		datasets: [{
			label: "누적 조회수",
			data: data1
		}]
	};

	let options = {
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		},
		responsive: true
		
	};

	let chart = new Chart(ctx, {
		type: 'bar',
		data: data,
		options: options
	});
}

function drawBarGraph2(getData, id){
	let ctx = $(id);
	
	let label =[];
	let data1 = [];
	let data2 = [];
	for(let i=0; i<getData.length; i++){
		label.push(getData[i].pd_title);
		data1.push(getData[i].view_dif);
		data2.push(getData[i].cp_viewcount);
	}
	
	let data = {
		labels: label,
		datasets: [{
			label: "조회수 증가량",
			data: data1
		},{
			label: "누적 조회수",
			data: data2
		}],
			
	};
	let options = {
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		},
		responsive: true
		
	};

	let chart = new Chart(ctx, {
		type: 'bar',
		data: data,
		options: options
	});
}
function drawBarGraphByRated(getData, id){
let ctx = $(id);
	
	let label =[];
	let data1 = [];
	for(let i=0; i<getData.length; i++){
		label.push(getData[i].pd_title);
		data1.push(getData[i].wishcount);
	}
	
	let data = {
		labels: label,
		datasets: [{
			label: "찜갯수",
			data: data1
		}]
	};
			
	let options = {
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		},
		responsive: true
		
	};

	let chart = new Chart(ctx, {
		type: 'bar',
		data: data,
		options: options
	});
}

function drawBarGraphByRated2(getData, id){
	let ctx = $(id);
		
		let label =[];
		let data1 = [];
		let data2 = []
		for(let i=0; i<getData.length; i++){
			label.push(getData[i].pd_title);
			data1.push(getData[i].cp_rated);
			data2.push(getData[i].rate_dif);
		}
		console.log(data1)
		console.log(data2)
		
		let data = {
			labels: label,
			datasets: [{
				label: "찜갯수",
				data: data1
			},{
				label: "찜증가량",
				data: data2
			}]
		};
				
		let options = {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
			responsive: true
			
		};

		let chart = new Chart(ctx, {
			type: 'bar',
			data: data,
			options: options
		});
	}
</script>


