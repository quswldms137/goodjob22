<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}
#blue {
	color:blue;
}
main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #eee;
	border-radius: 5px;
	box-sizing: border-box;
	background: #fff;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
	<div class="sidebar-container">
		<%@ include file="../front/common-sidebar-all.jsp"%>
	</div>
	<div id="container">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link" id="home-tab" onclick="show()" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">문의·신고</button>
	 	</li>
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link active" id="profile-tab" onclick="getQnaList()" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">문의·신고 내역</button>
	 	</li>
	</ul>
	</div>
	
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	<script>
	window.onload = function(){
		
	} 
	</script>
</body>
</html>