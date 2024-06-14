<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
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
	background: #FDFDFD;
	border-bottom: 1px solid #eee;
}

#head {
	padding: 15px 0 10px;
	max-width: 1100px;
	height: 100%;
	margin: 0 auto;
}

.head-bottom {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#head .logo{
	text-align:center;
	padding-bottom:15px;
}
#head .logo img {
	width: 150px;
}

#head .nav ul {
	display: flex;
	gap: 30px;
	padding-right: 65px;
}

#head .nav ul li a {
	font-size: 15px;
	font-weight: bold;
}

#head .search-bar #head-search {
	width: 250px;
	height: 30px;
	border: 1px solid #FB8500;
	border-radius: 8px;
	padding-left: 10px;
	box-sizing: border-box;
}

.search-bar-area {
	position: relative;
}

#head label {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 7px;
}

#search-submit {
	display: none;
}

#head .user-area ul {
	display: flex;
	gap: 10px;
}

#head .user-area ul li a {
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	color: #FB8500;
	padding: 7px 20px;
	border: 1px solid #eee;
	border-radius: 8px;
}

#head .user-area ul li:nth-child(3) a {
	color: #333;
}
</style>
</head>
<body>

	<header>
		<div id="head">
			<div class="logo">
				<a href="/"><img src="/resource/img/logo.png"></a>
			</div>
			<div class="head-bottom">
				<div class="nav">
					<ul>
						<li><a href="#">채용정보</a></li>
						<li><a href="#">기업정보</a></li>
						<li><a href="#">커뮤니티</a></li>
						<li><a href="#">스킬매칭</a></li>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">공지사항</a></li>
					</ul>
				</div>
				<div class="search-bar-area">
					<div class="search-bar">
						<form action="" method="">
							<input type="text" name="head-search" id="head-search"> <label
								for="search-submit"> <input type="submit" value=""
								id="search-submit"> <img
								src="/resource/img/search-icon.png">
							</label>
						</form>
					</div>
				</div>
				<div class="user-area">
					<ul>
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">기업서비스</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>