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
	   		<button class="nav-link" id="home-tab" onclick="qnaWrite()" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">문의·신고</button>
	 	</li>
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link active" id="profile-tab" onclick="getQnaList()" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">문의·신고 내역</button>
	 	</li>
	</ul>
	</div>
	<!-- 문의 상세내용 -->
	<div id="title"></div>
	<div id="category"></div>
	<div id="content"></div>
	<div id="reg_date"></div>

	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	<script>

	function show(){
		var writeForm = document.getElementById('qnaWrite');
		var qnaList = document.getElementById('qnaListContainer');
		var homeTab = document.getElementById('home-tab');
		var profileTab = document.getElementById('profile-tab');
		
		writeForm.style.display = 'block';
		qnaList.style.display = 'none';
		homeTab.classList.add("active");
		profileTab.classList.remove("active");
		homeTab.setAttribute('aria-selected', 'true');
		profileTab.setAttribute('aria-selected', 'false');
		
	}
	
	window.onload = function(){
		const urlParams = new URLSearchParams(window.location.search);
		const cs_no = urlParams.get("cs_no");
		console.log(cs_no);
		
		const cs_no2 = {
				cs_no : cs_no
		}
		
		const sendData = JSON.stringify(cs_no2);
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.status === 200){
				alert(this.responseText);
			} else{
				alert("다시 입력해주세요.");
			}
		};
		xhttp.open("GET", "http://localhost:8888/api/qna-99/detail");
		xhttp.setRequestHeader("Content-type", "application/json");
		
		const username = localStorage.getItem("username");
    	const role = localStorage.getItem("role");

    	xhttp.setRequestHeader("username", username);
		xhttp.setRequestHeader("role", role);
		
		xhttp.send(sendData);
		
	}
	
	
	function qnaWrite(){
		window.location.href="/qna99/qnaWrite";
	}
	</script>
</body>
</html>