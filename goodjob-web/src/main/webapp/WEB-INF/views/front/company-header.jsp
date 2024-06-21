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
.company-nav{
	display:flex;
	justify-content:space-between;
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
#idpw, #idpw a{
	color: white;
	}
	
	.gomain a{
	border-bottom:0 !important;
	}


</style>
</head>
<body>

	<header>
		<div id="company-head">
			<div class="company-head-top">
				<div class="company-logo">
					<a href="/company"><img src="/resource/img/logo-white.png"></a>
				</div>
				<div class="company-login-area" id="notLogin">
					<ul>
						<li><a href="/common99/login">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div id="login" style="display:none;">
					<div id="idpw"><span id="username"></span> <a href="#" onclick="logout()"> 로그아웃</a></div>
					<div></div>
				</div>
			</div>
			<div class="company-nav">
				<ul>
					<li><a href="/company">홈</a></li>
					<li><a href="/company/employWrite">공고등록</a></li>
					<li><a href="/company/employManage">공고·지원자 관리</a></li>
					<li><a href="/company/interestMemberList">인재관리</a></li>
					<!-- <li><a href="#">커뮤니티</a></li>  -->
					<li><a href="/company/event">이벤트</a></li>
				</ul>
				<ul>
					<li class="gomain"><a href="http://localhost:9991/">메인으로 가기</a></li>
				</ul>
			</div>
		</div>
	</header>
<script>
window.onload = function(){
	const username = localStorage.getItem("username");
	console.log(username);
	
	if(username){
		notLogin.style.display = "none";
		login.style.display = "block";
		document.getElementById("username").innerText = username + '님 환영합니다 / ';
	}
}

function logout(){
	const username = localStorage.getItem("username");
	console.log(username);
	localStorage.removeItem("username");
	localStorage.removeItem("role");
	
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		if(this.status == 200){
			alert("로그아웃이 완료되었습니다. 행복한 하루 되세요^^");
			var response = JSON.parse(this.responseText);
			window.location.href = response.redirectUrl;
			
		} else{
			alert(this.responseText);
		}
	}
	xhttp.open("POST", "http://localhost:8888/api/login/logout");
	xhttp.send();
	
}


</script>
</body>
</html>