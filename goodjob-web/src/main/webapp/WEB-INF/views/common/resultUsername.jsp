<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width: 740px;
	margin: 0 auto;
	min-height: 700px;
	background: #fff;
}

.findId-big-title {
	margin-bottom: 15px;
	font-weight: 400;
	font-size: 22px;
}
.findId-small-title{
	margin-left: 10px;
	font-weight: 400;
	font-size: 15px;
}

.resultUsername {
	margin-top:10px;
	width: 600px;
	height: 200px;
    padding: 19px 19px;
    margin-right: 20px;
    border: 1px solid #dadada;
    border-radius: 5px;
}

.doModify{
	margin-right:120px;
	text-align:center;
	margin-top:20px;
}

.doModify a{
	padding:15px 60px;
	color:#fff;
	background:#FB8500;
	border:1px solid #FB8500;
	border-radius:5px;
	font-size:14px;
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
	<h2 class="findId-big-title">아이디 조회</h2>
	<div class="findId-small-title">
		<div>· 개인정보보호를 위해 일부분은 *로 표시됩니다.</div>
		<div>· 동명이인이 있는 경우, 본인 외의 ID가 노출될 수 있습니다.</div>
	</div>
	
	<div class="resultUsername"><!-- 박스 모양으로 테두리 -->
		<div>- 입력된 정보로 등록된 아이디가 아래에 표시됩니다.</div>
		<div id="pw" style="display:none;">비밀번호 조회</div>
		<div id="id" style="display:none;">아이디 조회</div>
		<div id="demo"></div>
	</div>
	<div class="doModify">
		<a href="/common99/login">로그인</a>
    	<a href="/common99/findPassword">비밀번호찾기</a>
	</div>
	</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
<script>
	$(document).ready(function (){
		const urlParams = new URLSearchParams(window.location.search);
		const username = urlParams.get("username");
		//const password = urlParams.get("password");
		
		function maskUsername(username){
			if(username.length <= 2){
				return "*",repeat(username.length);
			} else{
				return username.substring(0, username.length - 2) + "*".repeat(2);
			}
		}
		
		if(username){
			const maskedUsername = maskUsername(username);
			console.log("maskedUsername = ", maskedUsername);
			$('#demo').html(maskedUsername);
		}
		
	});
</script>
</body>
</html>