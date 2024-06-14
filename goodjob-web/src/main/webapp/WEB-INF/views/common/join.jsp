<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

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
	<div id="memberForm" style="display:none;">
		<form name="frm_memJoin">
			<input type="text" name="username" placeholder="아이디"><br>
			<input type="password" name="password" placeholder="비밀번호"><br>
			<input type="hidden" name="role" value="ROLE_MEMBER"><br>
			<input type="text" name="mem_name" placeholder="이름"><br>
			<input type="text" name="mem_tel"  placeholder="전화번호"><br>
			<input type="text" name="mem_email"  placeholder="이메일"><br>
			<input type="radio" name="mem_gender" value="남">남성
			<input type="radio" name="mem_gender" value="여">여성<br>
			<input type="date" name="mem_birth"  placeholder="생년월일"><br>
			<input type="text" name="mem_addr"  placeholder="주소"><br>
			<input type="submit" value="가입하기" onclick="memberSubmit(event)">
		</form>
	</div>
	<div id="companyForm" style="display:none;">
		<form name="frm_comJoin">
			<input type="text" name="username1" placeholder="아이디1"><br>
			<input type="password" name="password1" placeholder="비밀번호1"><br>
			<input type="text" name="role1" value="ROLE_COMPANY"><br>
			<input type="text" name="com_name" placeholder="기업명"><br>
			<input type="text" name="com_type"  placeholder="기업형태"><br>
			<input type="text" name="com_ceo"  placeholder="대표자명"><br>
			<input type="text" name="com_addr" placeholder="기업주소"><br>
			<input type="number" name="com_companynum" placeholder="사업자번호"><br>
			<input type="number" name="com_tel"  placeholder="전화번호"><br>
			<input type="text" name="com_email"  placeholder="담당자이메일"><br>
			<input type="submit" value="가입하기" onclick="companySubmit(event)">
		</form>
	</div>
	<div id="response">response</div>
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
				document.getElementById("response").innerHTML = this.responseText;
			}
			xhttp.open("POST", "http://localhost:8888/api/join/member");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
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
				document.getElementById("response").innerHTML = this.responseText;
			}
			xhttp.open("POST", "http://localhost:8888/api/join/company");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
		}
	</script>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>