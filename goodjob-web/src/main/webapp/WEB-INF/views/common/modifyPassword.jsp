<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	box-sizing:border-box;
}
#red {
	color: red;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/common-sidebar-all.jsp"%>
		</div>
	<div id="container">
	<div>비밀번호 재설정</div>
	<div><span id="red">새로운 비밀번호</span>를 입력해 주세요.</div>
	<table>
		<tr>
			<th>새로운 비밀번호</th>
			<td><input type="text" name="password"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary btn-lg" onclick="modifyPassword(event)">확인</button>
	</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
	function modifyPassword(event){
		const urlParams = new URLSearchParams(window.location.search);
		let username = urlParams.get('username');
		console.log("username", username);
		
		const newPw = document.querySelector("Input[name='password']").value;
		console.log(newPw);
		
		const user = {
			username: username,
			password: newPw
		}
		const sendData = JSON.stringify(user);
		console.log("sendData: " + sendData);
		
		const xhttp = new XMLHttpRequest();
        xhttp.onload = function(){
            if(this.status === 200){
                alert(this.responseText);
                window.location.href="/common99/login"
            } else{
                alert(this.responseText);
            }
        };
        xhttp.open("PUT", "http://localhost:8888/api/login/newPassword");
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send(sendData);
	}
	</script>
</body>
</html>