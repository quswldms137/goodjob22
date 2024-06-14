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
			<input type="submit" value="로그인" onclick="submitUser(event)">
		</form>
	</div>
	
	<div id="companyForm" style="display:none;">
		<form>
			<input type="text" name="username" placeholder="Input username1"><br>
			<input type="password" name="password" placeholder="Input password1"><br>
			<input type="submit" value="로그인" onclick="submitUser(event)">
		</form>
	</div>
	<div id="response"></div>
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
		
		function submitUser(event){
			event.preventDefault();
			
			const username1 = document.querySelector("Input[name='username']");
			const password1 = document.querySelector("Input[name='password']");
			
			const user = {
					username : username1.value,
					password : password1.value
			}
			const sendData = JSON.stringify(user);
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				if(this.status === 200){
					alert(this.responseText);
					window.location.href="/common99";
				} else{
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