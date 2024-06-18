<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 입사지원 현황</title>
<style>
body{
	background:#fafafa;
}

#sidebar{
	background:#fff;
}

main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #eee;
	box-sizing:border-box;
	border-radius:5px;
	background:#fff;
}

.sidebar-box3 p:nth-child(2) a{
	color: #FB8500 !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/member-sidebar-all.jsp"%>
		</div>
		<div id="container">
		사이드바가 있는 페이지<br>
		border 지우시고 영역안에서 작업하시면됩니다.
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>