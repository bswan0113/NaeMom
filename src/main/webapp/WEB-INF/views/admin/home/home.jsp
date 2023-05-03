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
			<canvas id="searchkeyword"></canvas>
		</div>
		<div class="block">
			<h5>월간 인기검색어</h5>
			원형차트
		</div>
		<div class="block">
			<h5>연간 인기검색어</h5>
			원형차트
		</div>
		<div class="block">
			<h5>일간 방문자 통계</h5>
			선그래프, x축 시간(일), y축 방문자(10명단위)
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



function drawLineGraph(data, id){
	
}
function drawpieChart(data, id){
	
}
function drawBarGraph(data, id){
	
}
</script>


