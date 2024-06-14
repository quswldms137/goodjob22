<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
#container h1{
	text-align: center;
}
form[name=frm]{
	display: flex;
	flex-direction: column;
	width: 300px;
	margin: 0 auto;
}
form[name=frm] input{
	padding: 10px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="./front/header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="./front/member-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<h1>회원정보 수정</h1>
			<form name="frm">
				<input type="hidden" name="mem_no"> <input type="text"
					name="username" placeholder="아이디"> <input type="text"
					name="mem_name" placeholder="이름"> <input type="tel"
					name="mem_tel" placeholder="010-1234-5678"> <input
					type="email" name="mem_email" placeholder="이메일"> <input
					type="text" name="mem_gender" placeholder="성별"> <input
					type="text" name="mem_birth" placeholder="생년월일"> <input
					type="text" name="mem_addr" placeholder="주소"> <input
					type="submit" value="수정하기" onclick="saveInfo(event)"> <input
					type="submit" value="회원탈퇴" onclick="deleteInfo()">
				<div id="demo"></div>
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>

	<script type="text/javascript">
		// 화면이 실행될때 사용자 정보를 가지고 와서 인풋에 벨류를 넣어주는 식;
		$(document).ready(function() {
			const username = "${username}";

			$.ajax({
				url : "http://localhost:8888/api/member/info/" + username,
				dataType : "json",
				method : "GET",
				success : function(response) {
					$("input[name=mem_no]").val(response.mem_no);
					$("input[name=username]").val(response.username);
					$("input[name=mem_name]").val(response.mem_name);
					$("input[name=mem_tel]").val(response.mem_tel);
					$("input[name=mem_email]").val(response.mem_email);
					$("input[name=mem_gender]").val(response.mem_gender);
					$("input[name=mem_birth]").val(response.mem_birth);
					$("input[name=mem_addr]").val(response.mem_addr);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		});

		function saveInfo(event) {
			event.preventdefault;

			const xhr = new XMLHttpRequest();
			xhr.onload = function() {
				alert("수정이 완료됬습니다.");
				
				const response = JSON.parse(this.responseText);
				$("input[name=mem_no]").val(response.mem_no);
				$("input[name=username]").val(response.username);
				$("input[name=mem_name]").val(response.mem_name);
				$("input[name=mem_tel]").val(response.mem_tel);
				$("input[name=mem_email]").val(response.mem_email);
				$("input[name=mem_gender]").val(response.mem_gender);
				$("input[name=mem_birth]").val(response.mem_birth);
				$("input[name=mem_addr]").val(response.mem_addr);
			}
			xhr.open("POST", "http://localhost:8888/api/member/info", true);
			xhr.setRequestHeader("Content-type", "application/json");

			const member = JSON.stringify({
				mem_no : $("input[name=mem_no]").val(),
				username : $("input[name=username]").val(),
				mem_name : $("input[name=mem_name]").val(),
				mem_tel : $("input[name=mem_tel]").val(),
				mem_email : $("input[name=mem_email]").val(),
				mem_gender : $("input[name=mem_gender]").val(),
				mem_birth : $("input[name=mem_birth]").val(),
				mem_addr : $("input[name=mem_addr]").val()

			})
			xhr.send(member);

		}
		
		function deleteInfo(){
			const mem_no = $("input[name=mem_no]");
			const username = $("input[name=username]");
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				alert(this.responseText);
				if(this.responseText === "회원탈퇴 성공"){
					location.href="";
				}
			}
			xhr.open("DELETE", "http://localhost:8888/api/member/info/" + mem_no.val() + "/" + username.val(), true);
			xhr.send();
		}
	</script>
</body>
</html>



