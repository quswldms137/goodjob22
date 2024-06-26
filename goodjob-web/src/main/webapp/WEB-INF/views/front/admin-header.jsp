<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin:0;
	padding-left:0;
}
img{
	vertical-align:baseline;
}

header {
	width: 100%;
	margin: 0 auto;
	background: #FDFDFD;
	border-bottom: 1px solid #eee;
}

#head {
	display: flex;
	justify-content: space-between;
	align-items:center;
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
	line-height:normal;
}
#head .logo img {
	display:inline-block;
	width: 150px;
}


#head label {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 7px;
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

#username{
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	color: #FB8500;
	padding: 7px 20px;
	border: 1px solid #eee;
	border-radius: 8px;
}
.logout-btn{
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	color: #333;
	padding: 7px 20px;
	border: 1px solid #eee;
	border-radius: 8px;
	font-weight:400;
}
#adminLogin{
	color: white;
}
.hairImg{
	opacity: 0.5;
	position:absolute;
	top:10px;
	right:1000px;
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
				<div class="user-area" id="notLogin" style="display: block;">
				<ul>
					<li><a href="/common99/login">로그인</a></li>
					<li><a href="/common99/join">회원가입</a></li>
					<li><a href="/company">기업서비스</a></li>
				</ul>
				</div>
				<div id="login" style="display:none;">
					<div><a href="/resume/resumeManage"><span id="username"></span></a> <a href="#" onclick="logout()" class="logout-btn"> 로그아웃</a></div>
					<div></div>
				</div>
			<span><a href="/admin/login" id="adminLogin"><img alt="머리카락 사진" class="hairImg" src="/resource/img/hair.png"></a></span>
			</div>
		</div>
	</header>
<script>
window.onload = function(){
	const username = localStorage.getItem("username");
	const role = localStorage.getItem("role");
	
	if(username){
		notLogin.style.display = "none";
		login.style.display = "block";
		const usernameElement = document.getElementById("username");
		usernameElement.innerText = username + ' 님';
		
		const parentLink = usernameElement.closest('a');
		
		if(role === 'ROLE_MANAGER'){
			parentLink.href = "/admin";
		} 
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
			alert("로그아웃 완료되었습니다. 다음에 또 보장*^^*");
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