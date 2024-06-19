<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
		<form name="frm_memJoin">
			<span>아이디</span><button onclick="checkUsername(event)">아이디 중복 확인</button><br>
			<input type="text" name="username"><br>
			<div>비밀번호</div><input type="password" name="password"><br>
			<input type="hidden" name="role" value="ROLE_MEMBER">
			<div>이름</div><input type="text" name="mem_name" ><br>
			<div>전화번호</div>
			<div>· 숫자만 입력해주세요.</div>
			<input type="text" name="mem_tel"><br>
			<div>이메일</div><input type="text" name="mem_email"><br>
			<div>성별</div>
			<input type="radio" name="mem_gender" value="남">남성
			<input type="radio" name="mem_gender" value="여">여성<br>
			<div>생년월일</div><input type="date" name="mem_birth"><br>
			<div>주소</div><input type="text" name="mem_addr"><br>
			<input type="submit" value="가입하기" onclick="memberSubmit(event)">
		</form>
	</div>
	<div id="companyForm" style="display:none;">
		<form name="frm_comJoin">
			<div>아이디</div><input type="text" name="username1"><br>
			<div>비밀번호</div><input type="password" name="password1"><br>
			<input type="hidden" name="role1" value="ROLE_COMPANY">
			<div>기업명</div><input type="text" name="com_name"><br>
			<div>기업형태</div><input type="text" name="com_type"><br>
			<div>대표자명</div><input type="text" name="com_ceo"><br>
			<div>기업주소</div><input type="text" name="com_addr"><br>
			<div>사업자등록번호</div>
			<div>· 숫자만 입력해주세요.</div>
			<input type="number" name="com_companynum"><br>
			<div>담당자 전화번호</div>
			<div>· 숫자만 입력해주세요.</div>
			<input type="number" name="com_tel"><br>
			<div>담당자 이메일</div><input type="text" name="com_email"><br>
			<input type="submit" value="가입하기" onclick="companySubmit(event)">
		</form>
	</div>
	<script>
	function checkUsername(event){
		event.preventDefault(); 
		const inputUsername = document.querySelector("Input[name='username']");
		const username = inputUsername.value;
		const url = "http://localhost:8888/api/join/check-username?username="+encodeURIComponent(username);
		console.log(username);
		const sendData = JSON.stringify(username);
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function(){
			if(this.status === 200){
				alert(this.responseText);
			} else{
				alert(this.responseText);
			}
			inputUsername.focus();
		};
		xhttp.onerror = function(){
			alert("네트워크 오류가 발생했습니다.");
		};
		xhttp.open("GET", url);
		xhttp.send();
	}
	
		
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
		

		function memberSubmit(event){
			event.preventDefault();
			
			const username1 = document.querySelector("Input[name='username']");
			const password1 = document.querySelector("Input[name='password']");
			const role1 = document.querySelector("Input[name='role']");
			const mem_name1 = document.querySelector("Input[name='mem_name']");
			const mem_tel1 = document.querySelector("Input[name='mem_tel']");
			const mem_email1 = document.querySelector("Input[name='mem_email']");
			const mem_gender1 = document.querySelector("Input[name='mem_gender']:checked");
			const mem_birth1 = document.querySelector("Input[name='mem_birth']");
			const mem_addr1 = document.querySelector("Input[name='mem_addr']");
			
			if(username1.value == ''){
		    	alert("아이디를 입력해 주세요.");
		    	username1.focus();
		    	return ;
		    } else if(password1.value == ''){
		    	alert("비밀번호를 입력해 주세요.");
		    	password1.focus();
		    	return ;
		    } else if(mem_name1.value == ''){
		    	alert("이름을 입력해 주세요.");
		    	mem_name1.focus();
		    	return ;
		    } else if(mem_tel1.value == ''){
		    	alert("전화번호를 입력해 주세요.");
		    	mem_tel1.focus();
		    	return ;
		    } else if(mem_tel1.value.match(/[^0-9]/g)){
		    	alert("전화번호는 숫자만 입력해주세요.");
		    	return ;
		    } else if(mem_email1.value == ''){
		    	alert("이메일을 입력해 주세요.");
		    	mem_email1.focus();
		    	return ;
		    } else if(!mem_gender1){
		    	alert("성별을 선택해 주세요.");
		    	return ;
		    } else if(mem_birth1.value == ''){
		    	alert("생년월일을 선택해 주세요.");
		    	mem_birth1.focus();
		    	return ;
		    } else if(mem_addr1.value == ''){
		    	alert("주소를 입력해주세요.");
		    	mem_addr1.focus();
		    	return ;
		    } else {
		    	const member = {
						username : username1.value,
						password : password1.value,
						role : role1.value,
						mem_name : mem_name1.value,
						mem_tel : mem_tel1.value,
						mem_email : mem_email1.value,
						mem_gender : mem_gender1.value,
						mem_birth : mem_birth1.value,
						mem_addr : mem_addr1.value
				}
				console.log(member);
				const sendData = JSON.stringify(member);
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function(){
					if(this.status === 200){
						alert(this.responseText);
						window.location.href="http://localhost:9991/common99";
					} else{
						alert(this.responseText);
					}
				}
				xhttp.open("POST", "http://localhost:8888/api/join/member");
				xhttp.setRequestHeader("Content-type", "application/json");
				xhttp.send(sendData);
		    }
		    
		}
		
		function companySubmit(event){
			event.preventDefault();
			
			const username1 = document.querySelector("Input[name='username1']");
			const password1 = document.querySelector("Input[name='password1']");
			const role1 = document.querySelector("Input[name='role1']");
			const com_name1 = document.querySelector("Input[name='com_name']");
			const com_type1 = document.querySelector("Input[name='com_type']");
			const com_ceo1 = document.querySelector("Input[name='com_ceo']");
			const com_addr1 = document.querySelector("Input[name='com_addr']");
			const com_companynum1 = document.querySelector("Input[name='com_companynum']");
			const com_tel1 = document.querySelector("Input[name='com_tel']");
			const com_email1 = document.querySelector("Input[name='com_email']");
			
			if(username1.value == ''){
		    	alert("아이디를 입력해 주세요.");
		    	username1.focus();
		    	return ;
		    } else if(password1.value == ''){
		    	alert("비밀번호를 입력해 주세요.");
		    	password1.focus();
		    	return ;
		    } else if(com_name1.value == ''){
		    	alert("회사명을 입력해 주세요.");
		    	com_name1.focus();
		    	return ;
		    } else if(com_type1.value == ''){
		    	alert("기업형태를 입력해 주세요.");
		    	com_type1.focus();
		    	return ;
		    } else if(com_ceo1.value == ''){
		    	alert("대표자 성함을 입력해 주세요.");
		    	com_ceo1.focus();
		    	return ;
		    } else if(com_addr1.value == ''){
		    	alert("사업장 주소를 입력해 주세요.");
		    	com_addr1.focus();
		    	return ;
		    } else if(com_companynum1.value == ''){
		    	alert("사업자등록번호를 입력해 주세요.");
		    	com_companynum1.focus();
		    	return ;
		    } else if(com_companynum1.value.match(/[^0-9]/g)){
		    	alert("사업자등록번호는 숫자만 입력해 주세요.");
		    	com_companynum1.focus();
		    	return ;
		    } else if(com_tel1.value.match(/[^0-9]/g)){
		    	alert("담당자 전화번호는 숫자만 입력해 주세요.");
		    	com_tel1.focus();
		    	return ;
		    } else if(com_tel1.value == ''){
		    	alert("담당자 전화번호를 입력해 주세요.");
		    	com_tel1.focus();
		    	return ;
		    } else if(com_email1.value == ''){
		    	alert("담당자 이메일을 입력해 주세요.");
		    	com_email1.focus();
		    	return ;
		    } else{
		    	const company = {
						username : username1.value,
						password : password1.value,
						role : role1.value,
						com_name : com_name1.value,
						com_type : com_type1.value,
						com_ceo : com_ceo1.value,
						com_addr : com_addr1.value,
						com_companynum : com_companynum1.value,
						com_tel : com_tel1.value,
						com_email : com_email1.value
				}
				
				console.log(company);
				const sendData = JSON.stringify(company);
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function(){
					if(this.status === 200){
						alert(this.responseText);
						window.location.href="http://localhost:9991/common99";
					} else{
						alert("다시 가입을 시도해주시기 바랍니다.");
					}
				}
				xhttp.open("POST", "http://localhost:8888/api/join/company");
				xhttp.setRequestHeader("Content-type", "application/json");
				xhttp.send(sendData);
		    }
		}
		
		
	</script>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>