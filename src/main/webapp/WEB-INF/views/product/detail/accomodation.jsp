<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>내맘대로 - 내 취향대로 골라담는 숙소</title>
    <style>
    
    </style>  
<div class="container-fluid">
<h1>${product.pd_title}</h1>
<div>${product.pd_subtitle}</div>
<div>${product.pd_content}</div>
<div>${product.pd_street_address}</div>
<div>${product.pd_registerd_address}</div>
<div>${product.pd_detail_address}</div>
<div>${product.pd_parking}</div>
<div>${product.pd_capacity}</div>
<div>${product.pd_viewcount}</div>
<div>${product.pd_open_time}</div>
<div>${product.pd_close_time}</div>
</div>

