<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.rec-box{
display:flex
}
.info-box {
	
  justify-content: space-between;
  margin: 10px;
  border: 2px solid #29c16d72;
  border-radius: 10px;
  padding: 10px;
}

.info-title {
  color: #008080;
  font-weight: bold;
  text-decoration: none;
  font-size: 20px;
}

.rec-img {
  width: 400px;
  border: 2px solid #29c16d72;
  border-radius: 10px;
  margin:20px;
}
.info-content{
width:400px;
height: 300px;
overflow: hidden;
text-overflow:ellipsis;
}

.none-box{
line-height :400px;
color:#dae1e6;
width:100%;
text-align:center;
}

</style>

    <div class="container">
	    <h3>추천 상품</h3>
    	<div class="rec-box">
    	</div>
    	<button class='btn btn-success btn-another'>다른 추천 상품도 확인해볼래요!</button>
    </div>
    

<script>
let count = 0;

$(function(){
	getRec(count);
})

$(document).on("click",".btn-another",function(){
	count =count+2;
	getRec(count);
})
function getRec(count){
	$('.rec-box').html("");
	$.ajax({
		url:"<c:url value='/main/rec/"+count+"'></c:url>",
		method:"get",
		success : function(data){
			console.log(data.rec.length)
			for(let i=0; i<data.rec.length;i++){
				
				createRecTag(data.rec[i], data.img[i].fi_name);
			}
			if(data.rec.length==0){
				createNoneTag();
			}
			
		}
	})
	
}

function createNoneTag(){
	let none =$("<div>").text("오늘의 상품추천이 끝났어요!").addClass('none-box');
	$('.rec-box').prepend(none);
	$('.btn-another').hide();
	
}


function createRecTag(product, file) {
 	  let recBox = $('.rec-box');
	  let imgLink = $("<a>").attr("href", "<c:url value='/product/detail/detailLayoutTMP/"+product.pd_num+"'></c:url>");
	  let img = $("<img>").attr("src", "<c:url value='/download"+file+"'></c:url>").addClass('rec-img');
	  imgLink.append(img);
	  
	  let info =$("<div>").addClass("info-box");
	  let title =$("<a>").text(product.pd_title).addClass("info-title").attr("href","<c:url value='/product/detail/detailLayoutTMP/"+product.pd_num+"'></c:url>");
	  let content = $("<div>").html(product.pd_content).addClass("info-content");
	  info.append(title,content);
	  
	  
	  let item = $("<div>").addClass("rec-item").append(imgLink, info);
	  recBox.prepend(item);

	}

</script>