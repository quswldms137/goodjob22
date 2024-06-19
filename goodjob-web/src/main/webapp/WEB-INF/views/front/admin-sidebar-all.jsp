<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	color: #333;
	font-family: "Pretendard Variable", Pretendard;
}

a {
	text-decoration: none;
	color: #333;
}

ul {
	list-style: none;
}

#sidebar {
	position:relative;
	top:0px;
	left:0;
	width: 180px;
	height: auto;
	border: 1px solid #eee;
	border-radius: 5px;
}

#sidebar .sidebar-box {
	height: 60px;
	padding: 20px;
	border-bottom: 1px solid #eee;
	box-sizing: border-box;
}
#sidebar .sidebar-box:last-child{
	border-bottom:0;
}

#sidebar .sidebar-box h3 {
	font-size: 15px;
	padding-bottom:15px;
}
#sidebar .sidebar-box p a{
	display:inline-block;
	padding-bottom:10px;
	padding-left:12px;
	font-size:13px;
	color:#666;
}

#sidebar .sidebar-box2{
	height:100px;
	padding-top:30px;
}
#sidebar .sidebar-box3{
	height: 90px;
}
#sidebar .sidebar-box4{
	height: 120px;
}

#sidebar .sidebar-box6{
	height:110px;
	padding-top:30px;
}
</style>
</head>
<body>

	<div id="sidebar">
		<div class="sidebar-box sidebar-box2">
			<h3>관리자 홈</h3>
			<p><a href="/admin">홈</a></p>
		</div>
		<div class="sidebar-box sidebar-box3">
			<h3>개인/기업 회원</h3>
			<p><a href="/admin/user/list">목록보기</a></p>
		</div>
		<div class="sidebar-box sidebar-box4">
			<h3>고객 문의사항</h3>
			<p><a href="/admin/noanswer/list">답변안한문의내역</a></p>
			<p><a href="/admin/yesanswer/list">답변한문의내역</a></p>
		</div>
	</div>

</body>
</html>