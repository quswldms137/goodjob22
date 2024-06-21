<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 메인페이지</title>
<style>
.company-nav ul li:nth-child(1) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

.recruit-area {
	width: 950px;
	margin: 10px auto;
	display: flex;
	padding: 25px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.recruit-left {
	border-right: 1px solid #eee;
	padding-right: 30px;
	margin-right: 30px;
}

.recruit-mid {
	width: 700px;
	padding-right: 50px;
}

.recruit-right-top {
	padding-bottom: 20px;
}

.recruit_title:hover{
	color: #FB8500;
}

.recruit-right-bot {
	display: flex;
}

.recruit-right-bot p {
	padding-right: 15px;
}

.recruit-right-right {
	width: 130px;
	height: 60px;
	margin-left: 20px;
	margin-right: 10px;
}

.updateBtn,
.deleteBtn {
	color: white;
	background-color: #FB8500;
	width: 60px;
	height: 40px;
	text-align: center;
	padding: auto;
	transition: background-color 0.2s ease;
	border-radius: 10px;
	/*border-color: white;*/
	border: none;
}

.updateBtn:hover,
.deleteBtn:hover {
	background-color: skyblue;
}

#h1 {
	margin: 30px;
	text-align: center;
}

#h2 {
	margin: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<script>
		const username = localStorage.getItem("username");
		const role = localStorage.getItem("role");
		
		function recruit() {
			//const username = 1;
			const xhttp = new XMLHttpRequest();
			//const careers = document.querySelectorAll(".recruit_career");
			
			//xhttp.onload = function() {
				//console.log(this.responseText);
				//document.getElementById("demo").innerHTML = this.responseText;
				//careers.forEach()
			//}
			xhttp.open("GET", "http://localhost:8888/api/company/index?username=" + username, true);
			xhttp.onreadystatechange = function(){
				const data = JSON.parse(xhttp.responseText);
				console.log(data);
				inputdata(data);
			}
			//xhttp.setRequestHeader("Content-type", "application/json")
			xhttp.send();
		}
		
		function inputdata(data){
			const main = document.querySelector("#main");
			let number = 1;
			let str = "";
			data.forEach(item =>{
					str += '<div class="recruit-area"> '
								+ '<div class="recruit-left"> '
									+ '<h2>' + number + '</h2> '
								+ '</div> '
								+ '<div class="recruit-mid"> '
									+ '<div class="recruit-right-top"> '
										+ '<h2><a class="recruit_title" href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '">공고 제목이 들어가는 부분 입니다.</a></h2> '
									+ '</div> '
									+ '<div class="recruit-right-bot"> '
										+ '<p class="recruit_career">요구 경력</p> '
										+ '<p class="recruit_education">요구 학력</p> '
										+ '<p class="recruit_location">근무 위치</p> '
										+ '<p class="recruit_field">고용 형태</p>'
										+ '<p class="recruit_rank">직급</p> '
										+ '<p class="recruit_pay">연봉</p> '
										+ '<p class="recruit_deadline_date">마감기한</p> '
									+ '</div> '
								+ '</div> '
								+ '<div class="recruit-right-right"> '
									+ '<button type="button" class="updateBtn" onclick="update(event)">수정</button> ' + '<button type="button" class="deleteBtn" onclick="deleteBtn(event)">삭제</button> '
									+ '<input type="hidden" class="recruit_no" name="recruit_no"> '
								+ '</div> '
						+ '</div> '; 
						number++;
				// forEach 문안에 str 에 누적할때 바로 값을 넣어도 된다. 예시) + '<div class="recruit_career">'+ item.career + '</div> '
			})
			
			main.innerHTML = str;
			
			//const numbers = document.querySelectorAll(".recruit_number");
			const recruit_nos = document.querySelectorAll(".recruit_no");
			const titles = document.querySelectorAll(".recruit_title");
			const careers = document.querySelectorAll(".recruit_career");
			const educations = document.querySelectorAll(".recruit_education");
			const locations = document.querySelectorAll(".recruit_location");
			const fields = document.querySelectorAll(".recruit_field");
			const ranks = document.querySelectorAll(".recruit_rank");
			const pays = document.querySelectorAll(".recruit_pay");
			const deadline_dates = document.querySelectorAll(".recruit_deadline_date");
			
			data.forEach((item, index)=>{
				//numbers[index].textContent = item.recruit_number;
				recruit_nos[index].textContent = item.recruit_no;
				recruit_nos[index].value = item.recruit_no;
				titles[index].textContent = item.title;
				careers[index].textContent = item.career;
				educations[index].textContent = item.education;
				locations[index].textContent = item.location;
				fields[index].textContent = item.field;
				ranks[index].textContent = item.rank;
				pays[index].textContent = item.pay + " 만원";
				deadline_dates[index].textContent = item.deadline_date;
			});
		}
		
		function inputdata2(data){
			const main = document.querySelector("#main");
			let number = 1;
			let str = "";
			data.forEach(item =>{
					str += '<div class="recruit-area"> '
								+ '<div class="recruit-left"> '
									+ '<h2>' + number + '</h2> '
								+ '</div> '
								+ '<div class="recruit-mid"> '
									+ '<div class="recruit-right-top"> '
										+ '<h2><a class="recruit_title" href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '">공고 제목이 들어가는 부분 입니다.</a></h2> '
									+ '</div> '
									+ '<div class="recruit-right-bot"> '
										+ '<p class="recruit_career">요구 경력</p> '
										+ '<p class="recruit_education">요구 학력</p> '
										+ '<p class="recruit_location">근무 위치</p> '
										+ '<p class="recruit_field">고용 형태</p>'
										+ '<p class="recruit_rank">직급</p> '
										+ '<p class="recruit_pay">연봉</p> '
										+ '<p class="recruit_deadline_date">마감기한</p> '
									+ '</div> '
								+ '</div> '
								+ '<div class="recruit-right-right"> '
								+ '<input type="hidden" class="recruit_no" name="recruit_no"> '
							+ '</div> '
						+ '</div> '; 
						number++;
				// forEach 문안에 str 에 누적할때 바로 값을 넣어도 된다. 예시) + '<div class="recruit_career">'+ item.career + '</div> '
			})
			
			main.innerHTML = str;
			
			//const numbers = document.querySelectorAll(".recruit_number");
			const recruit_nos = document.querySelectorAll(".recruit_no");
			const titles = document.querySelectorAll(".recruit_title");
			const careers = document.querySelectorAll(".recruit_career");
			const educations = document.querySelectorAll(".recruit_education");
			const locations = document.querySelectorAll(".recruit_location");
			const fields = document.querySelectorAll(".recruit_field");
			const ranks = document.querySelectorAll(".recruit_rank");
			const pays = document.querySelectorAll(".recruit_pay");
			const deadline_dates = document.querySelectorAll(".recruit_deadline_date");
			
			data.forEach((item, index)=>{
				//numbers[index].textContent = item.recruit_number;
				recruit_nos[index].textContent = item.recruit_no;
				recruit_nos[index].value = item.recruit_no;
				titles[index].textContent = item.title;
				careers[index].textContent = item.career;
				educations[index].textContent = item.education;
				locations[index].textContent = item.location;
				fields[index].textContent = item.field;
				ranks[index].textContent = item.rank;
				pays[index].textContent = item.pay + " 만원";
				deadline_dates[index].textContent = item.deadline_date;
			});
		}
		
		function recruitAll(){
			
			const xhttp = new XMLHttpRequest();
			
			xhttp.open("GET", "http://localhost:8888/api/company/index2", true);
			xhttp.onreadystatechange = function(){
				const data = JSON.parse(xhttp.responseText);
				console.log(data);
				inputdata2(data);
			}
			
			xhttp.send();
		}
		
		if(role == "ROLE_COMPANY"){
			recruit();
		}else{
			recruitAll();
		}
		
		function update(event){
			const recruit_no = event.target.closest(".recruit-area").querySelector("input[name='recruit_no']");
			console.log(recruit_no);
			console.log(recruit_no.value);
			location.href = "/company/employUpdate?recruit_no=" + recruit_no.value;
			/*const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				const Obj = JSON.parse(responseText);
				location.href = "/company/employUpdate?recruit_no=" + recruit_no.value;
			}
			xhttp.open("PUT", "http://localhost:8888/company/employUpdate?recruit_no=" + recruit_no.value);
			xhttp.send();*/
		}
		
		function deleteBtn(event){
			const recruit_no = event.target.closest(".recruit-area").querySelector("input[name='recruit_no']");
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				alert(this.responseText);
				location.href = "/company/index";
			}
			xhttp.open("DELETE", "http://localhost:8888/api/company/deleteRecruit?recruit_no=" + recruit_no.value);
			xhttp.send();
		}
		
		
	</script>
	<header>
		<%@ include file="../front/company-header.jsp"%>
	</header>
	<h1 id="h1">기업회원 메인페이지</h1>
	<hr>
	<c:if test="">
		<h2 id="h2">내가 쓴 채용공고 목록</h2>
	</c:if>
	<main id="main">
		
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>