<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
body {
	position: relative;
	margin: 0;
	padding: 0;
}

main {
	
}

.change-btn {
	width: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 15px;
}

.change-btn button {
	border: 0;
	background: #fff;
	font-size: 16px;
	font-family: "Pretendard Variable", Pretendard;
	cursor: pointer;
}

#memberForm {
	width: 450px;
	border: 1px solid #dadada;
	border-radius: 5px;
}

#memberForm .memberForm-in {
	width: 100%;
	margin: 20px auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.memberForm-in input[type="text"] {
	width: 400px;
	height: 48px;
	padding-left: 8px;
	box-sizing: border-box;
	border: 1px solid #dadada;
	border-radius: 5px 5px 0 0;
	font-family: "Pretendard Variable", Pretendard;
}

.memberForm-in input[type="password"]
	{
	width: 400px;
	height: 48px;
	padding-left: 8px;
	border: 1px solid #dadada;
	box-sizing: border-box;
	border-top: 0;
	border-radius: 0 0 5px 5px;
	margin-bottom: 20px;
	font-family: "Pretendard Variable", Pretendard;
}

#loginBtn, #returnBtn
	{
	width: 400px;
	height: 48px;
	border: 1px solid #FB8500;
	border-radius: 5px;
	background: #FB8500;
	color: #fff;
	font-size: 16px;
	font-family: "Pretendard Variable", Pretendard;
	margin-bottom: 10px;
}

.memberForm-in .find-info {
	color: #eee;
	margin-bottom: 20px;
}

.memberForm-in .find-info a {
	color: #aaa;
	font-size: 14px;
}

.memberForm-in .find-info a:hover {
	color: #333;
}

.change-btn button.active-btn {
	color: #FB8500; /* 텍스트 색상 */
}

#memberForm {
	width: 100vw;
	height: 100vh;
	position: absolute;
	left: 0;
	top: 0;
	background: rgb(0, 0, 0, 0.8);
}

#memberForm .memberForm-in {
	padding-top:250px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div id="memberForm" style="display: block;">
			<form>
				<div class="memberForm-in">
					<input type="text" name="username" placeholder="아이디"> <input
						type="password" name="password" placeholder="비밀번호">
					<div class="find-info">
						<a href="/common99/findUsername">아이디 찾기</a> <span>|</span> <a
							href="/common99/findPassword">비밀번호 찾기</a>
					</div>
					<input type="submit" id="loginBtn" value="로그인" onclick="submitLogin(event)">
					<input type="button" id="returnBtn" value="돌아가기" onclick="location.href='/'">
				</div>
			</form>
		</div>


	</main>
	<script>
	function submitLogin(event){
		event.preventDefault();
		
		const username1 = document.querySelector("Input[name='username']");
		const password1 = document.querySelector("Input[name='password']");
		
		if (username1.value == '') {
			alert("아이디를 입력해주세요.");
			username1.focus();
			return;
		} else if (password1.value == '') {
			alert("비밀번호를 입력해주세요.");
			password1.focus();
			return;
		} else{
			const admin = {
				username : username1.value,
				password : password1.value
			};
			
			const sendData = JSON.stringify(admin);
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function() {
				console.log(this.status); // 응답 상태 확인
				console.log(this.responseText); // 응답 내용 확인
				if (this.status === 200) {
					const username2 = this.getResponseHeader("username");
					const role2 = this.getResponseHeader("role");

					console.log("username: ", username2);
					console.log("role: ", role2);

					localStorage.setItem("username", username2);
					localStorage.setItem("role", role2);

					console.log(localStorage.getItem("username"));

					alert("환영합니다!!");

					const response = JSON.parse(this.responseText);
					window.location.href = response.redirectUrl;
				} else {
					alert(this.responseText);
				}
			};
			xhttp.open("POST", "http://localhost:8888/api/login/admin");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
		}
	}
	</script>
</body>
</html>