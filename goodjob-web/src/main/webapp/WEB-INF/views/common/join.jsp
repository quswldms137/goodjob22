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
#companyForm{
	width:460px;
	margin:30px auto;
	text-align:right;
}
#memberForm .memberJoinfrom,
#companyForm .companyJoinfrom{
	display:flex;
	justify-content:center;
	
}
.memberJoinform input[type="text"],
.memberJoinform input[type="password"],
.companyJoinform input[type="text"],
.companyJoinform input[type="password"]{
	width:460px;
	height:50px;
	border:1px solid #dadada;
	border-radius:5px;
	padding-left:8px;
	box-sizing:border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size:15px;
}
.id-dupl-chk{
	cursor:pointer;
	border:1px solid #dadada;
	border-radius:5px;
	padding:10px;
	font-size:12px;
	color:#000;
	background:#fafafa;
	font-family: "Pretendard Variable", Pretendard;
	margin:10px 0 20px;
}

.memberJoinform input[type="password"]{
	border-radius:5px 5px 0 0;
	border-bottom:0;
}
.memberJoinform input[name="mem_name"],
.companyJoinform input[name="mem_name"]{
	border-radius:0;
}
.memberJoinform input[name="mem_tel"],
.companyJoinform input[name="mem_tel"]{
	border-radius:0;
	border-top:0;
	border-bottom:0;
}
.memberJoinform input[name="mem_email"],
.companyJoinform input[name="mem_email"]{
	border-top:1px solid #dadada;
	border-bottom:0;
	border-radius:0;
}
.memberJoinform input[name="mem_addr"],
.companyJoinform input[name="mem_addr"]{
	border-radius:0 0 5px 5px;
}
.memberJoinform .birth-gender{
	display:flex;
	justify-content:space-between;
	margin:10px 0;
}
.birth-gender input[type="date"]{
	width:180px;
	height:30px;
	font-size:16px;
	color:#333;
	border:1px solid #dadada;
	border-radius:5px;
	padding:5px;	
	font-family: "Pretendard Variable", Pretendard;
}

.memberJoinform input[type="radio"]{
	display:none;
}
.memberJoinform label input:checked + span{
	color:#FB8500;
	border:1px solid #FB8500;
}
.memberJoinform label{
}
.memberJoinform label span{
	width:100px;
	display:inline-block;
	padding:10px;
	border:1px solid #dadada;
	border-radius:5px;
	text-align:center;
	cursor:pointer;
	box-sizing:border-box;
}

.memberJoinform input[type="submit"],
.companyJoinform input[type="submit"] {
	width: 460px;
	height: 50px;
	border: 1px solid #FB8500;
	border-radius: 5px;
	background: #FB8500;
	color: #fff;
	font-size: 16px;
	font-family: "Pretendard Variable", Pretendard;
	cursor:pointer;
	margin-top:10px;
}
.change-btn button:nth-child(1){
	color:#FB8500;
}

.companyJoinform input[type="number"]{
	width:460px;
	height:50px;
	border:1px solid #dadada;
	border-radius:0;
	padding-left:8px;
	box-sizing:border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size:15px;
	border-top:0;
	border-bottom:0;
}
.companyJoinform input[type="password"]{
	border:1px solid #dadada;
	border-radius:0 0 5px 5px;
	margin-bottom:10px;
}
.companyJoinform input[name="username1"]{
	border-bottom:0;
	border-radius:5px 5px 0 0;
}
.companyJoinform input[name="com_name"]{
	border:1px solid #dadada;
	border-radius:5px 5px 0 0;
}
.companyJoinform input[name="com_type"]{
	border:1px solid #dadada;
	border-top:0;
	border-radius:0;
}
.companyJoinform input[name="com_ceo"]{
	border:1px solid #dadada;
	border-top:0;
	border-radius:0;
}
.companyJoinform input[name="com_addr"]{
	border:1px solid #dadada;
	border-top:0;
	border-radius:0;
}
.companyJoinform input[name="com_companynum"]{
	border-bottom:1px solid #dadada;
	border-radius:0 0 5px 5px;
}
.companyJoinform input[name="com_tel"]{
	border-top:1px solid #dadada;
	border-radius:5px 5px 0 0;
	margin-top:10px;
}
.companyJoinform input[name="com_email"]{
	border-top:1px solid #dadada;
	border-radius:0 0 5px 5px;
}
#idcheckok{
color:green
}
#idcheckno{
color:red
}


</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div class="change-btn">
			<button onclick="showForm('member')">개인회원</button>
			<span>|</span>
			<button onclick="showForm('company')">기업회원</button>
		</div>
		<div id="memberForm" style="display: block;">
			<form name="frm_memJoin">
				<div class="memberJoinform">
					<input type="text" name="username" placeholder="아이디">
					<span id="idcheckok"></span><span id="idcheckno"></span>
					<button onclick="checkUsername(event)" class="id-dupl-chk">ID 중복 확인</button>
					<input type="password" name="password" placeholder="비밀번호">
					<input type="hidden" name="role" value="ROLE_MEMBER">
					<input type="text" name="mem_name" placeholder="이름">
					<input type="text" name="mem_tel" placeholder="전화번호 (숫자만 입력하세요)">
					<input type="text" name="mem_email" placeholder="이메일">
					<input type="text" name="mem_addr" placeholder="주소">
					<div class="birth-gender">
						<input type="date" name="mem_birth" placeholder="생년월일">
						<div>
						<label for="nam">
							<input type="radio" name="mem_gender" id="nam" value="남">
							<span id="nam2">남성</span>
						</label>
						<label for="yu">
							<input type="radio" name="mem_gender" id="yu" value="여">
							<span id="yu2">여성</span>
						</label>
						</div>
					</div>
					<input type="submit" value="가입하기" onclick="memberSubmit(event)">
				</div>
			</form>
		</div>
		<div id="companyForm" style="display: none;">
			<form name="frm_comJoin">
				<div class="companyJoinform">
					<input type="text" name="username1" placeholder="아이디">
					<input type="password" name="password1" placeholder="비밀번호">
					<input type="hidden" name="role1" value="ROLE_COMPANY">
					<input type="text" name="com_name" placeholder="기업명">
					<input type="text" name="com_type" placeholder="기업형태">
					<input type="text" name="com_ceo" placeholder="대표자명">
					<input type="text" name="com_addr" placeholder="기업주소">
					<input type="number" name="com_companynum" placeholder="사업자등록번호 (숫자만 입력하세요)">
					<input type="number" name="com_tel" placeholder="담당자번호 (숫자만 입력하세요)">
					<input type="text" name="com_email" placeholder="담당자 이메일">
					<input type="submit" value="가입하기" onclick="companySubmit(event)">
				</div>
			</form>
		</div>
		<script>
		var isUsernameChecked = false;
		var usernameCheckedNum = 0;
		
		function chkRadio(){
			const nam = document.getElementById("nam");
			const yu = document.getElementById("yu");
			const nam2 = document.getElementById("nam2");
			const yu2 = document.getElementById("yu2");
			
			if(nam.checked){
				nam2.style.color = "red";
			}
		}
		
		function checkUsername(event) {
			event.preventDefault();
			const inputUsername = document.querySelector("Input[name='username']");
			const username = inputUsername.value;
			const url = "http://localhost:8888/api/join/check-username?username="
					+ encodeURIComponent(username);
			console.log(username);
			
			const sendData = JSON.stringify(username);
			const xhttp = new XMLHttpRequest();
			const idcheckok = document.querySelector("#idcheckok");
			const idcheckno = document.querySelector("#idcheckno");
			const inpusername = document.querySelector(".username");
			
			xhttp.onload = function() {
				if (this.status === 200) {
					if(this.responseText == "사용 가능한 아이디입니다."){
						idcheckno.innerHTML="";
						idcheckok.innerHTML=this.responseText;	
						inputUsername.style.border = '1px solid green';
						usernameCheckedNum = 1
					}else{
						idcheckok.innerHTML="";
						idcheckno.innerHTML=this.responseText;
						inputUsername.style.border = '1px solid red';
						usernameCheckedNum = 2;
						return ;
					}		
				} else {
					//alert(this.responseText);
				}
				//inputUsername.focus();
			};
			xhttp.onerror = function() {
				alert("네트워크 오류가 발생했습니다.");
			};
			xhttp.open("GET", url);
			xhttp.send();
		}

		function showForm(type) {
			var memberForm = document.getElementById('memberForm');
			var companyForm = document.getElementById('companyForm');
			var memberBtn = document.querySelector('.change-btn button:nth-child(1)');
		    var companyBtn = document.querySelector('.change-btn button:nth-child(3)');

			if (type === 'member') {
				memberForm.style.display = 'block';
				companyForm.style.display = 'none';
				memberBtn.style.color = '#FB8500'; // 개인회원 버튼 색상 변경
		        companyBtn.style.color = '#000';    // 기업회원 버튼 색상 변경
			} else {
				memberForm.style.display = 'none';
				companyForm.style.display = 'block';
				memberBtn.style.color = '#000';     // 개인회원 버튼 색상 변경
		        companyBtn.style.color = '#FB8500'; // 기업회원 버튼 색상 변경
			}
		}

		function memberSubmit(event) {
			event.preventDefault();
			if(usernameCheckedNum == 0){
				alert("ID 중복 확인을 해주세요.");
				return ;
			} else if(usernameCheckedNum == 2){
				alert("중복된 아이디 입니다. 다른 아이디를 입력해주세요.");
				return ;
			} else if(usernameCheckedNum == 1){
				const username1 = document
				.querySelector("Input[name='username']");
		const password1 = document
				.querySelector("Input[name='password']");
		const role1 = document.querySelector("Input[name='role']");
		const mem_name1 = document
				.querySelector("Input[name='mem_name']");
		const mem_tel1 = document
				.querySelector("Input[name='mem_tel']");
		const mem_email1 = document
				.querySelector("Input[name='mem_email']");
		const mem_gender1 = document
				.querySelector("Input[name='mem_gender']:checked");
		const mem_birth1 = document
				.querySelector("Input[name='mem_birth']");
		const mem_addr1 = document
				.querySelector("Input[name='mem_addr']");

		if (username1.value == '') {
			alert("아이디를 입력해 주세요.");
			username1.focus();
			return;
		} else if (password1.value == '') {
			alert("비밀번호를 입력해 주세요.");
			password1.focus();
			return;
		} else if (mem_name1.value == '') {
			alert("이름을 입력해 주세요.");
			mem_name1.focus();
			return;
		} else if (mem_tel1.value == '') {
			alert("전화번호를 입력해 주세요.");
			mem_tel1.focus();
			return;
		} else if (mem_tel1.value.match(/[^0-9]/g)) {
			alert("전화번호는 숫자만 입력해주세요.");
			return;
		} else if (mem_email1.value == '') {
			alert("이메일을 입력해 주세요.");
			mem_email1.focus();
			return;
		} else if (!mem_gender1) {
			alert("성별을 선택해 주세요.");
			return;
		} else if (mem_birth1.value == '') {
			alert("생년월일을 선택해 주세요.");
			mem_birth1.focus();
			return;
		} else if (mem_addr1.value == '') {
			alert("주소를 입력해주세요.");
			mem_addr1.focus();
			return;
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
			xhttp.onload = function() {
				if (this.status === 200) {
					alert(this.responseText);
					window.location.href = "http://localhost:9991/";
				} else {
					alert("가입실패");
				}
			}
			xhttp.open("POST", "http://localhost:8888/api/join/member");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
		}
				
			}
			

		}

		function companySubmit(event) {
			event.preventDefault();

			const username1 = document
					.querySelector("Input[name='username1']");
			const password1 = document
					.querySelector("Input[name='password1']");
			const role1 = document.querySelector("Input[name='role1']");
			const com_name1 = document
					.querySelector("Input[name='com_name']");
			const com_type1 = document
					.querySelector("Input[name='com_type']");
			const com_ceo1 = document
					.querySelector("Input[name='com_ceo']");
			const com_addr1 = document
					.querySelector("Input[name='com_addr']");
			const com_companynum1 = document
					.querySelector("Input[name='com_companynum']");
			const com_tel1 = document
					.querySelector("Input[name='com_tel']");
			const com_email1 = document
					.querySelector("Input[name='com_email']");

			if (username1.value == '') {
				alert("아이디를 입력해 주세요.");
				username1.focus();
				return;
			} else if (password1.value == '') {
				alert("비밀번호를 입력해 주세요.");
				password1.focus();
				return;
			} else if (com_name1.value == '') {
				alert("회사명을 입력해 주세요.");
				com_name1.focus();
				return;
			} else if (com_type1.value == '') {
				alert("기업형태를 입력해 주세요.");
				com_type1.focus();
				return;
			} else if (com_ceo1.value == '') {
				alert("대표자 성함을 입력해 주세요.");
				com_ceo1.focus();
				return;
			} else if (com_addr1.value == '') {
				alert("사업장 주소를 입력해 주세요.");
				com_addr1.focus();
				return;
			} else if (com_companynum1.value == '') {
				alert("사업자등록번호를 입력해 주세요.");
				com_companynum1.focus();
				return;
			} else if (com_companynum1.value.match(/[^0-9]/g)) {
				alert("사업자등록번호는 숫자만 입력해 주세요.");
				com_companynum1.focus();
				return;
			} else if (com_tel1.value.match(/[^0-9]/g)) {
				alert("담당자 전화번호는 숫자만 입력해 주세요.");
				com_tel1.focus();
				return;
			} else if (com_tel1.value == '') {
				alert("담당자 전화번호를 입력해 주세요.");
				com_tel1.focus();
				return;
			} else if (com_email1.value == '') {
				alert("담당자 이메일을 입력해 주세요.");
				com_email1.focus();
				return;
			} else {
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
				xhttp.onload = function() {
					if (this.status === 200) {
						alert(this.responseText);
						window.location.href = "http://localhost:9991/";
					} else {
						alert("다시 가입을 시도해주시기 바랍니다.");
					}
				}
				xhttp.open("POST","http://localhost:8888/api/join/company");
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