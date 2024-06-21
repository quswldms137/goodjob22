<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿잡 - 비밀번호 찾기</title>
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

.qna-big-title {
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

.findId-small-title{
	margin-left: 10px;
	font-weight: 400;
	font-size: 15px;
}

#memberForm,
#companyForm {
	width: 450px;
	margin: 30px;
	border: 1px solid #dadada;
	border-radius: 5px;
}

.memberForm-in button[type="submit"],
.companyForm-in button[type="submit"] {
	width: 400px;
	height: 48px;
	border: 1px solid #FB8500;
	border-radius: 5px;
	background: #FB8500;
	color: #fff;
	font-size: 16px;
	font-family: "Pretendard Variable", Pretendard;
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
.memberForm-in input[type="number"],
.companyForm-in input[type="number"] {
	width: 400px;
	height: 48px;
	padding-left: 8px;
	box-sizing: border-box;
	border: 1px solid #dadada;
	border-radius: 5px 5px 0 0;
	font-family: "Pretendard Variable", Pretendard;
}

.sidebar-box5 p:nth-child(3) a{
	color: #FB8500 !important;
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
	<h3 class="qna-big-title">비밀번호 찾기</h3>
	<div class="findId-small-title">
		<div>회원정보 입력</div>
		<div>회원별로 가입 시 입력한 본인정보를 입력해 주세요.</div>
	</div>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link active" id="home-tab" onclick="showForm('memberForm')" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">개인회원</button>
	 	</li>
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link" id="profile-tab" onclick="showForm('companyForm')" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">기업회원</button>
	 	</li>
	</ul>
	<div id="memberForm" style="display: block;">
		<form>
			<div class="memberForm-in">
				<input type="text" name="username" placeholder="아이디"> 
				<input type="text" name="mem_name" placeholder="이름">
				<input type="text" name="mem_tel" placeholder="전화번호">
				
				<button type="submit" onclick="submitFindMemPassword(event)">비밀번호 찾기</button>
			</div>
		</form>
	</div>
	<div id="companyForm" style="display: none;">
		<form>
			<div class="companyForm-in">
				<input type="text" name="username1" placeholder="아이디"> 
				<input type="text" name="com_name" placeholder="기업명">
				<input type="text" name="com_companynum" placeholder="사업자등록번호">
				
				<button type="submit" onclick="submitFindComPassword(event)">비밀번호 찾기</button>
			</div>
		</form>
	</div>
	
	
<!-- 	<div id="companyForm" style="display:none;"> -->
<!-- 		<span>아이디</span><input type="text" name="username1"><br> -->
<!-- 		<span>가입자명</span><input type="text" name="com_name"><br> -->
<!-- 		<span>사업자등록번호</span><input type="number" name="com_companynum"><br> -->
<!-- 		<button type="submit" class="btn btn-primary btn-lg" onclick="submitFindComPassword(event)">비밀번호 찾기</button> -->
<!-- 	</div> -->
	</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
	function showForm(type){
		var memberForm = document.getElementById('memberForm');
		var companyForm = document.getElementById('companyForm');
		var homeTab = document.getElementById('home-tab');
		var profileTab = document.getElementById('profile-tab');
		
		if(type === 'memberForm'){
			memberForm.style.display = 'block';
			companyForm.style.display = 'none';
			homeTab.classList.add("active");
			profileTab.classList.remove("active");
			homeTab.setAttribute('aria-selected', 'true');
			profileTab.setAttribute('aria-selected', 'false');
		} else {
			memberForm.style.display = 'none';
			companyForm.style.display = 'block';
			homeTab.classList.remove("active");
			profileTab.classList.add("active");
			homeTab.setAttribute('aria-selected', 'false');
			profileTab.setAttribute('aria-selected', 'true');
		}
	}
	
	function submitFindMemPassword(event){
		const username = document.querySelector("Input[name='username']");
		const mem_name = document.querySelector("Input[name='mem_name']");
		const mem_tel = document.querySelector("Input[name='mem_tel']");
		
		if(mem_name.value == null || mem_name.value == ''){
			alert("이름을 입력해주세요.");
			mem_name.focus();
			return ;
		} else if(mem_tel.value == null || mem_tel.value == ''){
			alert("전화번호를 입력해주세요.");
			mem_tel.focus();
			return ;
		} else if(username.value == null || username.value == ''){
			alert("아이디를 입력해주세요.");
			username.focus();
			return ;
		} else{
			console.log(username.value);
			console.log(mem_name.value);
			console.log(mem_tel.value);
			
			const findPassword = {
				username : username.value,
				mem_name : mem_name.value,
				mem_tel : mem_tel.value
			};
			console.log(findPassword);
			const sendData = JSON.stringify(findPassword);
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				if(this.status == 200){
					const username = this.responseText;
					console.log("username: ",username);
					alert("인증되었습니다.");
					window.location.href="/common99/newPassword?username="+encodeURIComponent(username);
				} else {
					alert(this.responseText);
					window.location.href="/common99/join";
				}
			};
			xhttp.open("POST", "http://localhost:8888/api/login/mem-password");
		    xhttp.setRequestHeader("Content-type", "application/json");
		    xhttp.send(sendData);
		}
	}
	
	function submitFindComPassword(event){
		const username = document.querySelector("Input[name='username1']");
		const com_name = document.querySelector("Input[name='com_name']");
		const com_companynum = document.querySelector("Input[name='com_companynum']");
		console.log(com_companynum);
		if(com_name.value == null){
			alert("가입자명을 입력해주세요.");
			com_name.focus();
			return ;
		} else if(com_companynum == null){
			alert("사업자번호를 입력해주세요.");
			com_companynum.focus();
			return ;
		} else if(username.value == null || username.value == ''){
			alert("아이디를 입력해주세요.");
			username.focus();
			return ;
		} else{
			console.log(username.value);
			console.log(com_name.value);
			console.log(com_companynum.value);
			
			const findPassword = {
				username : username.value,
				com_name : com_name.value,
				com_companynum : com_companynum.value
			};
			
			console.log("findPw",findPassword);
			const sendData = JSON.stringify(findPassword);
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				if(this.status == 200){
					alert("인증되었습니다.");
					const username = this.responseText;
					window.location.href="/common99/newPassword?username="+encodeURIComponent(username);
				} else {
					alert(this.responseText);
					window.location.href="/common99/join";
				}
			};
			xhttp.open("POST", "http://localhost:8888/api/login/com-password");
		    xhttp.setRequestHeader("Content-type", "application/json");
		    xhttp.send(sendData);
		} 
	}
	</script>
</body>
</html>