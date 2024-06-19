<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
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
.logo a img{
	width: 300px;
}
.logo{
	text-align: center;
}
.userList-area{
	width:800px;
	height:460px;
	margin:0 auto;
	border:1px solid #eee;
	padding-top:60px;
	padding-left:60px;
	padding-right:60px;
}
.listTitle1,
.listTitle2{
	font-size:20px;
	text-align:center;
}

#memberUser,
#companyUser {
	margin: 50px 0;
}

.userList-title{
	display:flex;
	justify-content:space-between;
	background:#fff;
	border-top:2px solid #000;
	padding:20px 0;
	border-bottom:1px solid #ccc;
}
.userList-title li{
	flex:1;
	text-align:center;
	font-weight:bold;
	font-size:18px;
}

.userList-cont{
	display:flex;
	justify-content:space-between;
}
.userList-cont:hover{
	background:rgb(251, 133, 0, 0.1);
}
.userList-cont li{
	flex:1;
	text-align:center;
	border-bottom:1px solid #eee;
	padding:15px 0;
}

#pages{
	width:800px;
	margin:0 auto;
	text-align:center;
}
#pages input[type="button"]{
	width:30px;
	height:30px;
	background:#fff;
	border:1px solid #333;
	cursor:pointer;
	margin:0 5px;
	margin-top:40px;
}
#pages input[type="button"]:hover{
	background:rgb(251, 133, 0, 0.1);
}
.sidebar-box2 p:nth-child(2) a{
	color: #FB8500 !important;
}


</style>
</head>
<body>
	<header>
		<%@ include file="../front/admin-header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/admin-sidebar-all.jsp"%>
		</div>
		<div id="container">
		
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>


