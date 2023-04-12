<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.bd-navbar {
  position: sticky;
  top: 0;
  z-index: 1071;
  min-height: 4rem;
  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: calc(100vh - 4rem);
  background: #eee;
  border-right: 1px solid rgba(0,0,0,.1);
  overflow-y: auto;
  min-width: 160px;
  max-width: 220px;
}
.bd-sidebar .nav {
  display: block;
}
.bd-sidebar .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
}
.side-bar{
float:left;
}

 ul{
   margin: 0 auto;
 }
 li{
   text-align: center;
   margin: 10px;
   list-style:none;
 }

a{
text-decoration:none;
color:black;
font-weight:bold;
}
</style>
</head>
<body>
		<h1 style="text-align:center; line-height:145px;">관리자페이지</h1>
<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">

</header>

<div class="side-bar">
    <div class="col-3 bd-sidebar">
      <ul class="nav">
        <li><a href="<c:url value='/admin/home/home'></c:url>">home</a></li>
        <li><a href="<c:url value='/admin/insert/insertProduct'></c:url>">게시글 등록</a><br></li>
        <li><a href="<c:url value='/admin/list/productList'></c:url>">게시글 조회</a></li>
      </ul>
      <br>
  </div>
</div>
</body>
</html>


