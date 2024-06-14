<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리 페이지</title>
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
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp" %>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="./front/company-sidebar-all.jsp"%>
		</div>
		<div id="container">
			
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp" %>
	</footer>
</body>
</html>