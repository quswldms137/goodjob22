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
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 700px;
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

#memberForm,
#companyForm {
	width: 450px;
	margin: 30px auto;
	border: 1px solid #dadada;
	border-radius: 5px;
}

#memberForm .memberForm-in,
#companyForm .companyForm-in {
	width: 100%;
	margin: 20px auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.memberForm-in input[type="text"],
.companyForm-in input[type="text"] {
	width: 400px;
	height: 48px;
	padding-left: 8px;
	box-sizing: border-box;
	border: 1px solid #dadada;
	border-radius: 5px 5px 0 0;
	font-family: "Pretendard Variable", Pretendard;
}

.memberForm-in input[type="password"],
.companyForm-in input[type="password"] {
	width: 400px;
	height: 48px;
	padding-left: 8px;
	border: 1px solid #dadada;
	box-sizing: border-box;
	border-top: 0;
	border-radius: 0 0 5px 5px;
	box-shadow: 0px 5px 5px #fafafa;
	margin-bottom: 20px;
	font-family: "Pretendard Variable", Pretendard;
}

.memberForm-in input[type="submit"],
.companyForm-in input[type="submit"] {
	width: 400px;
	height: 48px;
	border: 1px solid #FB8500;
	border-radius: 5px;
	background: #FB8500;
	color: #fff;
	font-size: 16px;
	font-family: "Pretendard Variable", Pretendard;
}

.memberForm-in .find-info,
.companyForm-in .find-info{
	color:#eee;
	margin-bottom:20px;
}
.memberForm-in .find-info a,
.companyForm-in .find-info a{
	color:#aaa;
	font-size:14px;
}
.memberForm-in .find-info a:hover,
.companyForm-in .find-info a:hover{
	color:#333;
}

.change-btn button.active-btn {
    color: #FB8500; /* 텍스트 색상 */
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>

		<div class="change-btn">
			<button onclick="showForm('member')" id="normal-member">개인회원</button>
			<span>|</span>
			<button onclick="showForm('company')" id="company-member">기업회원</button>
		</div>
		<div id="memberForm" style="display: block;">
			<form>
				<div class="memberForm-in">
					<input type="text" name="username" placeholder="아이디"> <input
						type="password" name="password" placeholder="비밀번호">
					<div class="find-info">
						<a href="/common99/findUsername">아이디 찾기</a>
						<span>|</span>
						<a href="/common99/findPassword">비밀번호 찾기</a>
					</div>
					<input type="submit" value="로그인" onclick="submitMemLogin(event)">
				</div>
			</form>
		</div>

		<div id="companyForm" style="display: none;">
			<form>
				<div class="companyForm-in">
					<input type="text" name="username1" placeholder="기업 아이디">
					<input type="password" name="password1"
						placeholder="기업 비밀번호">
						<div class="find-info">
						<a href="/common99/findUsername">아이디 찾기</a>
						<span>|</span>
						<a href="/common99/findPassword">비밀번호 찾기</a>
					</div> 
						<input type="submit"
						value="로그인" onclick="submitComLogin(event)">
				</div>
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    // 페이지가 로드되면 개인회원 버튼을 기본으로 활성화 상태로 설정
	    var normalMemberBtn = document.getElementById('normal-member');
	    normalMemberBtn.classList.add('active-btn');

	    // 기본적으로 개인회원 폼을 보여줌
	    var memberForm = document.getElementById('memberForm');
	    var companyForm = document.getElementById('companyForm');
	    memberForm.style.display = 'block';
	    companyForm.style.display = 'none';
	});
	
	
		function showForm(type) {
			var memberForm = document.getElementById('memberForm');
			var companyForm = document.getElementById('companyForm');
			var normalMemberBtn = document.getElementById('normal-member'); // 개인회원 버튼
		    var companyMemberBtn = document.getElementById('company-member'); // 기업회원 버튼
			
			if (type === 'member') {
				memberForm.style.display = 'block';
				companyForm.style.display = 'none';
				
				// 개인회원 버튼 활성화 스타일 적용
		        normalMemberBtn.classList.add('active-btn');
		        companyMemberBtn.classList.remove('active-btn');
			} else {
				memberForm.style.display = 'none';
				companyForm.style.display = 'block';
				
				// 기업회원 버튼 활성화 스타일 적용
		        normalMemberBtn.classList.remove('active-btn');
		        companyMemberBtn.classList.add('active-btn');
			}
		}
		
		function submitMemLogin(event) {
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
				const member = {
					username : username1.value,
					password : password1.value
				};
				
				const sendData = JSON.stringify(member);
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
					console.log(this.status); // 응답 상태 확인
					console.log(this.responseText); // 응답 내용 확인
					if (this.status === 200) {
						const username3 = this.getResponseHeader("username");
						const role3 = this.getResponseHeader("role");

						localStorage.setItem("username", username3);
						localStorage.setItem("role", role3);

						alert("환영합니다!!");

						const response = JSON.parse(this.responseText);
						window.location.href = response.redirectUrl;
					} else {
						alert("아이디 또는 비밀번호가 일치하지 않습니다. \n다시 확인 후 입력해주시기 바랍니다.");
					}
				};
				xhttp.open("POST", "http://localhost:8888/api/login/member");
				xhttp.setRequestHeader("Content-type", "application/json");
				xhttp.send(sendData);
			}
		};
		
		function submitComLogin(event) {
			event.preventDefault();

			const username = document.querySelector("Input[name='username1']");
			const password = document.querySelector("Input[name='password1']");

			if (username.value == '') {
				alert("아이디를 입력해주세요.");
				username.focus();
				return;
			} else if (password.value == '') {
				alert("비밀번호를 입력해주세요.");
				password.focus();
				return;
			} else{
				const company = {
					username : username.value,
					password : password.value
				};
				const sendData = JSON.stringify(company);
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
					if (this.status === 200) {
						const username1 = this.getResponseHeader("username");
						const role1 = this.getResponseHeader("role");

						localStorage.setItem("username", username1);
						localStorage.setItem("role", role1);

						alert("환영합니다!!");

						const response = JSON.parse(this.responseText);
						window.location.href = response.redirectUrl;
					} else {
						alert("아이디 또는 비밀번호가 일치하지 않습니다. \n다시 확인 후 입력해주시기 바랍니다.");
					}
				};
				xhttp.open("POST", "http://localhost:8888/api/login/company");
				xhttp.setRequestHeader("Content-type", "application/json");
				xhttp.send(sendData);
			}
		};
	</script>
</body>
</html>