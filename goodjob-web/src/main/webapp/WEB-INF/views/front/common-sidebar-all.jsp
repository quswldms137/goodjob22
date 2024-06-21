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
h3, p{
margin-bottom: 0;
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

#sidebar .sidebar-box2,
#sidebar .sidebar-box3,
#sidebar .sidebar-box5{
	height:133px;
	padding-top:30px;
}
#sidebar .sidebar-box4{
	height: 60px;
}

#sidebar .sidebar-box6{
	height:110px;
	padding-top:30px;
}
</style>
</head>
<body>

	<div id="sidebar">
		<div class="sidebar-box sidebar-box4">
			<h3>고객센터</h3>
		</div>
		<div class="sidebar-box sidebar-box3">
			<h3>문의·신고</h3>
			<p><a href="/qna99/qnaWrite">문의글 작성하기</a></p>
			<p><a href="/qna99/qnaWrite?test=1">내가 작성한 문의</a></p>
		</div>
		<div class="sidebar-box sidebar-box5">
			<h3>아이디·비밀번호 찾기</h3>
			<p><a href="/common99/findUsername">아이디 찾기</a></p>
			<p><a href="/common99/findPassword">비밀번호 찾기</a></p>
		</div>
	</div>

</body>
</html>