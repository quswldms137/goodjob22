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
	width: 740px;
	margin: 0 auto;
	min-height: 700px;
	background: #fff;
}

#red {
	color: red;
}

.findPw-big-title {
	margin-bottom: 15px;
	font-weight: 400;
	font-size: 22px;
}

.modifyForm{
	margin-right:120px;
	text-align:center;
	margin-top:20px;
}
button{
	padding:15px 50px;
	color:#fff;
	background:#FB8500;
	border:1px solid #FB8500;
	font-size:14px;
}

.button{
	border-radius: 5px;
}

.table {
  width: 800px;
  border-collapse: collapse; /* 테두리 겹침을 없애 깔끔하게 만듦 */
  margin: 20px 20px; /* 상하 여백 */
}

.table th, .table td {
  padding: 20px 30px; /* 셀 패딩 */
  border: 1px solid #ddd; /* 셀 테두리 */
  text-align: left; /* 텍스트 왼쪽 정렬 */
}

.table th {
  background-color: #FDFDFD;
  color: #333; /* 헤더 글자색 */
}

.table input[type="password"] {
	width: 200px;
	height: 25px;
	padding-left: 8px;
	border: 1px solid #dadada;
	box-sizing: border-box;
	border-radius: 0 0 5px 5px;
	box-shadow: 0px 5px 5px #fafafa;
	font-family: "Pretendard Variable", Pretendard;
}

</style>
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
	<div class="findPw-big-title">비밀번호 재설정</div>
	<table class="table">
		<tr>
			<th>
				<span id="red">새로운 비밀번호</span>를 입력해 주세요.
			</th>
			<td>
			</td>
		</tr>
		<tr>
			<th>새로운 비밀번호</th>
			<td><input type="password" name="password"></td>
		</tr>
	</table>
	<div class="modifyForm">
		<button type="submit" class="button" onclick="modifyPassword(event)">확인</button>
	</div>	
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