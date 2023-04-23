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
		<div class="block">Block 1</div>
		<div class="block">Block 2</div>
		<div class="block">Block 3</div>
		<div class="block">Block 4</div>
		<div class="block">Block 5</div>
		<div class="block">Block 6</div>
		<div class="block">Block 7</div>
		<div class="block">Block 8</div>
	</div>