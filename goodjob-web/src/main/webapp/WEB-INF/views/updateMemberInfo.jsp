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
body{
	background:#f7f7f7;
}

#sidebar{
	background:#fff;
}

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #eee;
	border-radius:5px;
	box-sizing: border-box;
	background:#fff;
}
#container h1{
	font-size: 1.3rem;
	margin-top: 20px;
	margin-bottom : 50px;
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
	border: 1px solid #e0e0e0;
	color: #ababab;
}

form[name=frm] input[value=수정하기]{
	margin: 10px 0;
	background: #FB8500;
	border-radius: 3px;
	color: white;
}

form[name=frm] input[value=회원탈퇴]{

}

input[name=username], input[name=mem_name]{
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

input[type=email], input[name=mem_addr]{
	margin-bottom: 10px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
}
#gender_container{
	width: 300px;
	height: 37.78px;
	border : 1px solid #e0e0e0;
	box-sizing : border-box; 
}

#gender_box{
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}
#man, #woman{
	border: 1px solid #e0e0e0;
	padding: 5px 20px;
	text-align: center;
}
#man:visited , #woman:visited {
	background: blue;
}
.sidebar-box6 p:nth-child(2) a{
	color:#FB8500 !important;
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
				<input type="hidden" name="mem_no"> 
					<input type="text" name="username" placeholder="아이디"> 
					<input type="password" name="password" placeholder="비밀번호">
					<input type="email" name="mem_email" placeholder="이메일"> 
					<div id="usernameResult"></div>
					<div id="passwordResult"></div>
					<div id="emailResult"></div>

					<input type="text"
					name="mem_name" placeholder="이름"> <input type="tel"
					name="mem_tel" placeholder="010-1234-5678"> 
					<div id="gender_container">
						<div id="gender_box">
							<a id="man" href="#">남자</a>
							<a id="woman" href="#">여자</a>
						</div>
					</div>
					<input type="text" name="mem_birth" placeholder="생년월일"> 
					<input
					type="text" name="mem_addr" placeholder="주소"> <input
					type="submit" value="수정하기" onclick="saveInfo(event)"> <input
					type="button" value="회원탈퇴" id="deleteBtn">
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>

	<script type="text/javascript">
		// 화면이 실행될때 사용자 정보를 가지고 와서 인풋에 벨류를 넣어주는 식;
		$(document).ready(function() {
			const username = localStorage.getItem("username");
			
			$.ajax({
				url : "http://localhost:8888/api/member/info/" + username,
				dataType : "json",
				method : "GET",
				success : function(response) {
					$("input[name=mem_no]").val(response.mem_no);
					$("input[name=username]").val(response.username);
					$("input[name=password]").val(response.password);
					$("input[name=mem_name]").val(response.mem_name);
					$("input[name=mem_tel]").val(response.mem_tel);
					$("input[name=mem_email]").val(response.mem_email);
					if(response.mem_gender === "M"){
						$("#man").css("background", "red");
						$("#man").css("color", "white");
						$("#woman").css("background", "white");
						$("#woman").css("color", "black");
					}else {
						$("#woman").css("background", "red");
						$("#woman").css("color", "white");
						$("#man").css("background", "white");
						$("#man").css("color", "black");
					}
					
					$("input[name=mem_birth]").val(response.mem_birth);
					$("input[name=mem_addr]").val(response.mem_addr);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
			
			// 아이디 중복 체크(유효성검사)
			$("input[name=username]").on({
				blur : function(){
					const username = $("input[name=username]");
					
					$.ajax({
						url : "http://localhost:8888/api/member/id/" + username.val(),
						method : "GET",
						dataType : "text",
						success : function(response){
							if(response !== "사용 가능한 아이디입니다."){
								$("#usernameResult").css("color", "red").html(response);
							}else{
								$("#usernameResult").css("color", "red").html("");
							}
						},
						error : function(xhr, status, error){
							console.log(error);
						}
					});
				}
			});
			
			$("#man").on({
				click : function(){
					$("#man").css("background", "red");
					$("#man").css("color", "white");
					$("#woman").css("background", "white");
					$("#woman").css("color", "black");
				}
			});
			
			$("#woman").on({
				click : function(){
					$("#woman").css("background", "red");
					$("#woman").css("color", "white");
					$("#man").css("background", "white");
					$("#man").css("color", "black");
				}
			});
			
			let isRequestInProgress = false;
			
			$("#deleteBtn").on({
				"click" : function(){
					
					if (isRequestInProgress) return;

			        isRequestInProgress = true;
					
					const mem_no = $("input[name=mem_no]");
					const username = $("input[name=username]");
					$.ajax({
						url : "http://localhost:8888/api/member/info/" + mem_no.val() + "/" + username.val(),
						dataType : "text",
						method : "DELETE",
						success : function(response){
							alert("회원탈퇴가 성공적으로 마쳤습니다.");
							location.href="/";
						},
						error : function(xhr, status, error){
							console.log(error);
						},
						complete : function(){
							 isRequestInProgress = false;
						}
					});
				}
			});
			
		});

		function saveInfo(event) {
			event.preventdefault;
			let gender = "null";
			const man = document.querySelector("#man");
			const woman = document.querySelector("#woman");
			
			if(man.style.background === "red"){
				gender = "M";
			}else{
				gender = "F";
			}
			
			const xhr = new XMLHttpRequest();
			xhr.onload = function() {
				
				alert("회원정보 수정 완료.");
				
				const response = JSON.parse(this.responseText);
				$("input[name=mem_no]").val(response.mem_no);
				$("input[name=username]").val(response.username);
				$("input[name=password]").val(response.password);
				$("input[name=mem_name]").val(response.mem_name);
				$("input[name=mem_tel]").val(response.mem_tel);
				if(response.mem_gender === "M"){
					$("#man").css("background", "red");
					$("#man").css("color", "white");
					$("#woman").css("background", "white");
					$("#woman").css("color", "black");
				}else {
					$("#woman").css("background", "red");
					$("#woman").css("color", "white");
					$("#man").css("background", "white");
					$("#man").css("color", "black");
				}
				$("input[name=mem_email]").val(response.mem_email);
				$("input[name=mem_birth]").val(response.mem_birth);
				$("input[name=mem_addr]").val(response.mem_addr);
			}
			xhr.open("POST", "http://localhost:8888/api/member/info", true);
			xhr.setRequestHeader("Content-type", "application/json");

			const member = JSON.stringify({
				mem_no : $("input[name=mem_no]").val(),
				username : $("input[name=username]").val(),
				password : $("input[name=password]").val(),
				mem_name : $("input[name=mem_name]").val(),
				mem_tel : $("input[name=mem_tel]").val(),
				mem_email : $("input[name=mem_email]").val(),
				mem_gender : gender,
				mem_birth : $("input[name=mem_birth]").val(),
				mem_addr : $("input[name=mem_addr]").val()

			})
			xhr.send(member);

		}
		
		
		
		
	</script>
</body>
</html>



