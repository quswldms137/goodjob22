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
	height: 702px;
	border: 1px solid #eee;
	border-radius: 5px;
	border-top:0;
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
#sidebar .sidebar-box1{
	background:#323743;
	text-align:center;
	border-radius:5px 5px 0 0;
}
#sidebar .sidebar-box1 h3 a{
	display:inline-block;
	padding:20px 56px;
	color:#fff;
}
#sidebar .sidebar-box2{
	height:156px;
	padding-top:25px;
}
#sidebar .sidebar-box3,
#sidebar .sidebar-box4
{
	height:133px;
	padding-top:25px;
}
#sidebar .sidebar-box5,
#sidebar .sidebar-box6{
	height:110px;
	padding-top:25px;
}
</style>
</head>
<body>

	<div id="sidebar">
		<div class="sidebar-box1">
			<h3><a href="#">공고등록</a></h3>
		</div>
		<div class="sidebar-box sidebar-box2">
			<h3>공고·지원자 관리</h3>
			<p><a href="#">전체 채용공고 관리</a></p>
			<p><a href="#">지원자 관리</a></p>
			<p><a href="#">면접 캘린더</a></p>
		</div>
		<div class="sidebar-box sidebar-box3">
			<h3>인재관리</h3>
			<p><a href="#">인재 검색</a></p>
			<p><a href="#">관심 구직자 목록</a></p>
		</div>
		<div class="sidebar-box sidebar-box4">
			<h3>커뮤니티</h3>
			<p><a href="#">커뮤니티 메인</a></p>
			<p><a href="#">게시글 작성</a></p>
		</div>
		<div class="sidebar-box sidebar-box5">
			<h3>이벤트</h3>
			<p><a href="#">진행중인 이벤트</a></p>
		</div>
		<div class="sidebar-box sidebar-box6">
			<h3>회원정보 관리</h3>
			<p><a href="#">회원정보 수정</a></p>
		</div>
	</div>

</body>
</html>