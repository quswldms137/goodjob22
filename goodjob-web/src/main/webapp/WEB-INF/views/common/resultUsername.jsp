<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #ccc;
	box-sizing:border-box;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<div id="id" style="display:none;">아이디 조회</div>
	<div id="pw" style="display:none;">비밀번호 조회</div> 
	<div>
		<div>- 입력된 정보로 등록된 아이디는 총 <span id="num"></span>개 있습니다.</div>
		<div></div>
		<div id="username"></div>
	</div>
	<a class="btn btn-primary btn-lg" href="/common99/login">로그인</a>
    <a class="btn btn-primary btn-lg" href="/common99/findPassword">비밀번호찾기</a>
	</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
<script>
	$(document).ready(function (){
		const urlParams = new URLSearchParams(window.location.search);
		const username = urlParams.get("username");
		const password = urlParams.get("password");
		
		if(username != null){
			console.log("username", username);
			$('#username').text(username);
		} else if(password != null){
			console.log("password",password);
			$('#password').text(password);
		}
		
	});
</script>
</body>
</html>