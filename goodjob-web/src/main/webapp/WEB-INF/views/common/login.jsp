<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
	<div>
		<button onclick="showForm('member')">개인회원</button>
		<button onclick="showForm('company')">기업회원</button>
	</div>
	<div id="memberForm" style="display:block;">
		<form>
			<input type="text" name="username" placeholder="Input username"><br>
			<input type="password" name="password" placeholder="Input password"><br>
			<input type="submit" value="로그인" onclick="submitLogin(event)">
		</form>
	</div>
	
	<div id="companyForm" style="display:none;">
		<form>
			<input type="text" name="username1" placeholder="Input username1"><br>
			<input type="password" name="password1" placeholder="Input password1"><br>
			<input type="submit" value="로그인" onclick="submitLogin(event)">
		</form>
	</div>
	<div id="response"></div>
	<a href="/common99/findUsername">아이디 찾기</a>
	<a href="/common99/findPassword">비밀번호 찾기</a>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
		function showForm(type){
			var memberForm = document.getElementById('memberForm');
			var companyForm = document.getElementById('companyForm');
			
			if(type === 'member'){
				memberForm.style.display = 'block';
				companyForm.style.display = 'none';
			} else {
				memberForm.style.display = 'none';
				companyForm.style.display = 'block';
			}
		}
		
		function submitLogin(event) {
		    event.preventDefault();
		    
		    const username1 = document.querySelector("Input[name='username']");
		    const password1 = document.querySelector("Input[name='password']");

		    const username2 = document.querySelector("Input[name='username1']");
		    const password2 = document.querySelector("Input[name='password1']");
		    
		    let user;
		    if(username1.value){
		    	console.log(username1.value);
		    	user = {
			        username: username1.value,
			        password: password1.value
				};
		    } else{
		    	user = {
			        username: username2.value,
			        password: password2.value
				};
		    }
		    
		    console.log(user);
		    const sendData = JSON.stringify(user);
		    const xhttp = new XMLHttpRequest();
		    xhttp.withCredentials = true; // withCredentials 설정
		    xhttp.onload = function() {
		        console.log(this.status);  // 응답 상태 확인
		        console.log(this.responseText);  // 응답 내용 확인
		        if (this.status === 200) {
		        	const username3 = this.getResponseHeader("username");
		        	const role3 = this.getResponseHeader("role");
		        	
		        	console.log("username: ", username3);
		        	console.log("role: ", role3);
		        	
		        	localStorage.setItem("username", username3);
		        	localStorage.setItem("role", role3);
		        	
		        	console.log(localStorage.getItem("username"));
		        	
		        	alert("환영합니다!!");
		        	
		            const response = JSON.parse(this.responseText);
		            window.location.href = response.redirectUrl;
		        } else {
		            alert("아이디 또는 비밀번호가 일치하지 않습니다. \n다시 확인 후 입력해주시기 바랍니다.");
		        }
		    };
		    xhttp.open("POST", "http://localhost:8888/api/login");
		    xhttp.setRequestHeader("Content-type", "application/json");
		    xhttp.send(sendData);
		}

	</script>
</body>
</html>