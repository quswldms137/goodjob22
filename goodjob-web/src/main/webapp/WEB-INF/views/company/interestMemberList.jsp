<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.company-nav ul li:nth-child(4) a{
	border-bottom:5px solid #FB8500;
	padding-bottom:10px;
}

.sidebar-box3 p:nth-child(2) {
	font-weight: bold;
}

</style>
</head>
<body>
<header>
	<%@ include file="../front/company-header.jsp" %>
</header>
<main>
	<div class="sidebar-container">
		<%@ include file="../front/company-sidebar-all.jsp"%>
	</div>
	<div id="container">
		<h2>관심 구직자 목록</h2>
		<div class="list-area">
			<div class="list-left">
				<h3 class="member_name">관심 구직자 이름</h3>
			</div>
			<div class="list-mid">
				<div class="list-mid-top">
					<h3 class="list-">대표 이력서 제목</h3>
				</div>
				<div class="list-mid-bot">
					<p class="hope_job">희망직무</p>
					<p class="sk_name">보유스킬</p>
					<p class="part">지원분야</p>
					<p class="addr">주소</p>
				</div>
			</div>
			<div class="list-right">
				<button class="interestBtn" onclick="interest()">관심</button> <button class="propositionBtn" onclick="proposition()">포지션 제안</button>
			</div>
		</div>
	</div>
</main>
<footer>
	<%@ include file="../front/footer.jsp" %>
</footer>
</body>
</html>