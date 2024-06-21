<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>관심 구직자 목록</title>
<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

#sidebar{
	background:#fff;
}

<<<<<<< HEAD
.sidebar-box3 a:nth-child(1) {
	color: #FB8500 !important;
=======
.sidebar-box2 p:nth-child(2) {
	font-weight: bold;
>>>>>>> eafa3a3 (사이드바 효과변경)
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
	background-color: #fff;
	border-radius: 10px;
	box-sizing: border-box;
	padding: 20px;
}

.company-nav ul li:nth-child(4) a{
	border-bottom:5px solid #FB8500;
	padding-bottom:10px;
}

.sidebar-box3 p:nth-child(3) {
	font-weight: bold;
}

.list-area {
	width: 90%;
	margin: 10px auto;
	display: flex;
	padding: 25px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.list-left {
	border-right: 1px solid #eee;
	padding-top: 20px;
	padding-right: 25px;
	margin-right: 25px;
}

.list-mid {
	width: 520px;
	padding-right: 10px;
	
}

.list-mid-top {
	padding-bottom: 20px;
}

.list-title a:hover {
	color: #FB8500;
}

.list-mid-bot {
	display: flex;
}

.list-mid-bot p {
	padding-right: 15px;
}

.list-right {
	width: 130px;
	height: 60px;
	margin-left: 0;
	margin-right: 0px;
	align-content: center;
}

.interestBtn, .propositionBtn {
	background-color: #FB8500;
	width: 100px;
	height: 30px;
	color: white;
	text-align: center;
	padding: 5px;
	transition: background-color 0.2s ease;
	border-radius: 10px;
	/*border-color: white;*/
	border: none;
	margin: 2px 0;
}

.interestBtn:hover, .propositionBtn:hover {
	background-color: skyblue;
}

.h2 {
	margin: 30px;
	text-align: center;
}
</style>
</head>
<body>
<header>
	<%@ include file="../front/company-header.jsp" %>
</header>
<main>
	<div class="sidebar-container">
		<%@ include file="../front/company-sidebar-all.jsp"%>
	</div>
	<div id="container">
		<h2 class="h2">관심 구직자 목록</h2>
		<div class="list-area">
			<div class="list-left">
				<h3 class="member_name">관심 구직자 이름</h3>
			</div>
			<div class="list-mid">
				<div class="list-mid-top">
					<h3 class="list-">대표 이력서 제목</h3>
				</div>
				<div class="list-mid-bot">
					<p class="hope_job">희망직무</p>
					<p class="hope_city">희망근무지역</p>
					<p class="hope_pay">희망연봉</p>
					<p class="sk_name">보유스킬</p>
				</div>
			</div>
			<div class="list-right">
				<button class="interestBtn" onclick="interest()">관심</button> <button class="propositionBtn" onclick="proposition()">포지션 제안</button>
			</div>
		</div>
	</div>
</main>
<footer>
	<%@ include file="../front/footer.jsp" %>
</footer>
<script type="text/javascript">
	function comInterestList(){
		const username = localStorage.getItem("username");
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function(){
			const interestMemList = JSON.parse(this.responseText);
			console.log(interestMemList);
			inputdata(interestMemList);
		}
		
		xhttp.open("GET", "http://localhost:8888/api/company/interestMemberList?username=" + username);
		xhttp.send();
	}
	
	function inputdata(data){
		const container = document.querySelector("#container");
		let str = '<h2 class="h2">관심 구직자 목록</h2>';
		data.forEach(resume =>{
			str += '<div class="list-area">'
					+	'<div class="list-left">'
						+	'<h3 class="mem_name">' + resume.mem_name + '</h3>'
					+	'</div>'
					+	'<div class="list-mid">'
						+	'<div class="list-mid-top">'
							+	'<h3 class="list-title">' + '<a href=/resume/resumeDetail?resume_no=' + resume.resume_no +'&mem_no=' + resume.mem_no + '>' + resume.title + '</a>' + '</h3>'
							+	'<input type="hidden" name="mem_no" value="' + resume.mem_no + '">'	
							+	'<input type="hidden" name="com_no" value="' + resume.com_no + '">'	
						+	'</div>'
						+	'<div class="list-mid-bot">'
							+	'<p class="hope_job">' + resume.hope_job + '</p>'
							+	'<p class="hope_city">' + resume.hope_city + '</p>'
							+	'<p class="hope_pay">' + resume.hope_pay + '</p>'
							+	'<p class="sk_name">' + resume.sk_name.map(sk => sk).join(', ') + '</p>'
						+	'</div>'
					+	'</div>'
					+	'<div class="list-right">'
						+	'<button class="interestBtn" onclick="interest(event)">관심</button> <button class="propositionBtn" onclick="proposition(event)">포지션 제안</button>'
					+	'</div>'
				+	'</div>';
		})
		
		container.innerHTML = str;
	}
	
	comInterestList();
	
	function interest(event){
		const mem_no1 = event.target.closest(".list-area").querySelector("input[name='mem_no']");
		const com_no1 = event.target.closest(".list-area").querySelector("input[name='com_no']");
		
		let sendData = {
				mem_no : mem_no1.value,
				com_no : com_no1.value
		}
		
		$.ajax({
			url: "http://localhost:8888/api/company/interestMember",
			type: "PUT",
			data: JSON.stringify(sendData),
			contentType: "application/json",
			success: function(data){
				console.log(data);
				alert(data);
			},
			error: function(){
				console.log("Error : ", error);
			}
		})
		
	}
	
	function proposition(event){
		/*const mem_no1 = event.target.closest(".list-area").querySelector("input[name='mem_no']");
		const com_no1 = event.target.closest(".list-area").querySelector("input[name='com_no']");
		
		let sendData = {
				mem_no : mem_no1.value,
				com_no : com_no1.value
		}
		
		$.ajax({
			url: "http://localhost:8888/api/company/interestMember",
			type: "PUT",
			data: JSON.stringify(sendData),
			contentType: "application/json",
			success: function(data){
				console.log(data);
				alert(data);
			},
			error: function(){
				console.log("Error : ", error);
			}
		})
		*/
	}
</script>
</body>
</html>