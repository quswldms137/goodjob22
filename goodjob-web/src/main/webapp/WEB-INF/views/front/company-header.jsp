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

header {
	width: 100%;
	margin: 0 auto;
	background: #323743;
}

#company-head {
	width: 1100px;
	margin: 0 auto;
	padding:15px 0 0px;
}

.company-logo img {
	width: 150px;
}

.company-head-top{
	display:flex;
	justify-content:space-between;
	padding-bottom:20px;
}
.company-login-area ul{
	display:flex;
	gap:20px;
}
.company-login-area ul li a{
	display:inline-block;
	color:#fff;
	font-size:12px;
}

.company-nav ul{
	display:flex;
	gap:25px;
}
.company-nav ul li a{
	display:inline-block;
	color:#fff;
	font-size:18px;
}

</style>
</head>
<body>

	<header>
		<div id="company-head">
			<div class="company-head-top">
				<div class="company-logo">
					<a href="#"><img src="/resource/img/logo-white.png"></a>
				</div>
				<div class="company-login-area">
					<ul>
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div class="company-nav">
				<ul>
					<li><a href="/company">홈</a></li>
					<li><a href="/company/employWrite">공고등록</a></li>
					<li><a href="/company/employManage">공고·지원자 관리</a></li>
					<li><a href="#">인재관리</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
			</div>
		</div>
	</header>

</body>
</html>