<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

#sidebar{
	background:#fff;
}

.company-nav ul li:nth-child(3) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

main #container {
	width: 900px;
	min-height: 700px;
	background-color: #fff;
	border-radius: 10px;
	box-sizing: border-box;
	padding: 20px;
}

.recruit-area {
	width: 90%;
	margin: 0 auto;
	display: flex;
	padding: 25px;
	border: 1px solid #ddd;
	border-top: 2px solid #FB8500;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.recruit-left {
	width: 20%;
	border-right: 1px solid #eee;
	padding-right: 30px;
	margin-right: 30px;
}

.recruit-mid {
	width: 60%;
}

.recruit-right-top {
	padding-bottom: 20px;
}

.recruit-right-bot {
	display: flex;
    justify-content: space-between;
}

.recruit-right-bot p {
	margin-right: 30px;
}

.recruit-right-right {
	width: 20%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.updateBtn, .deleteBtn {
	background-color: orange;
	width: 60px;
	height: 30px;
	text-align: center;
	padding: 5px;
	transition: background-color 0.2s ease;
	border-radius: 5px;
	border: none;
	color: white;
	cursor: pointer;
	margin: 5px 0;
}

.updateBtn:hover, .deleteBtn:hover {
	background-color: skyblue;
}

h1, h2 {
    color: #333;
}

.recruit-labels {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.recruit-labels h2 {
	margin-right: 20px;
    font-size: 18px;
}
</style>
</head>
<body>
<header>
		<%@ include file="../front/company-header.jsp"%>
</header>
<!-- 메인 내용 -->
<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		
		<div id="container">
			<div class="recruit-area">
				<div class="recruit-left">
					<h2 class="recruit_number">채용공고명이 들어가는 부분</h2>
				</div>
				<div class="recruit-mid">
					<div class="recruit-labels">
						<h2>이름</h2>
						<h2>구직상태</h2>
					</div>
					<div class="recruit-right-top">
						<h2 class="recruit_title">이력서 제목이 들어갈겁니다</h2>
					</div>
					<div class="recruit-right-bot">
						<p class="recruit_career">희망직무</p>
						<p class="recruit_education">지원분야</p>
						<p class="recruit_location">주소</p>
					</div>
				</div>
				<div class="recruit-right-right">
					<button class="updateBtn">수정</button>
					<button class="deleteBtn">삭제</button>
				</div>
			</div>
			<div id="demo"></div>
		</div>
</main>
<!-- 여기까지 -->

<footer>
		<%@ include file="../front/footer.jsp"%>
</footer>
</body>
</html>
