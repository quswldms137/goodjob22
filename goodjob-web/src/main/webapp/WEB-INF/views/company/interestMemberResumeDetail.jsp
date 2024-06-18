<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상세정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/static/css/resumeWrite.css">
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

.company-nav ul li:nth-child(2) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

<
style>body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.companyInfoForm {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	width: 100%;
}

.companyInfoForm label {
	display: block;
	margin-top: 15px;
	font-weight: bold;
}

.companyInfoForm input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.companyInfoForm input[type="text"]:focus {
	border-color: #007bff;
	outline: none;
}

.companyphoto {
	text-align: center;
	border: 1px solid #eee;
	border-top: 0;
	padding: 8.9px 0;
	font-size: 14px;
	background: #f7f7f7;
}

.photolabel .photoFrame-box {
	width: 800px;
	height: 200px;
	border: 1px solid #eee;
}

<!--
버튼style -->.submit_btn {
	text-align: center;
	margin: 80px 0;
}

input[type="submit"] {
	width: 160px;
	color: #fff;
	background: #323743;
	padding: 15px 0;
	border: 0;
	font-size: 18px;
	cursor: pointer;
}

input[type="button"] {
	width: 160px;
	color: #323743;
	background: #fff;
	border: 1px solid #323743;
	padding: 15px 0;
	font-size: 18px;
	cursor: pointer;
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
		<div class="container">
			<div>지원자및관심구직자이력서상세보기 페이지</div>			
		</div>
	</main>
	<!-- 여기까지 -->


	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>




</body>
</html>