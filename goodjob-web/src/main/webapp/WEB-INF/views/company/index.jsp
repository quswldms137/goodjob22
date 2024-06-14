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
	width: 800px;
	margin: 0 auto;
	display: flex;
	padding: 30px;
	border: 1px solid #ccc;
	border-top: 2px solid #777;
}

.recruit-left {
	border-right: 1px solid #eee;
	padding-right: 30px;
	margin-right: 30px;
}

.recruit-mid {
	padding-right: 150px;
}

.recruit-right-top {
	padding-bottom: 20px;
}

.recruit-right-bot {
	display: flex;
}

.recruit-right-bot p {
	padding-right: 20px;
}

.updateBtn {
	background-color: orange;
	width: 75px;
	height: 50px;
	text-align: center;
	padding: auto;
	transition: background-color 0.2s ease;
	border-radius: 10px;
}

.updateBtn:hover {
	background-color: skyblue;
}
</style>
</head>
<body>
	<script>
		function recruit() {
			const xhttp = new XMLHttpRequest();
			//const careers = document.querySelectorAll(".recruit_career");
			
			//xhttp.onload = function() {
				//console.log(this.responseText);
				//document.getElementById("demo").innerHTML = this.responseText;
				//careers.forEach()
			//}
			xhttp.open("GET", "http://localhost:8888/api/company/index", true);
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
			let str = "";
			data.forEach(item =>{
					str += '<div class="recruit-area"> '
								+ '<div class="recruit-left"> '
									+ '<h2>1</h2> '
								+ '</div> '
								+ '<div class="recruit-mid"> '
									+ '<div class="recruit-right-top"> '
										+ '<h2><a class="recruit_title" href="employDetail">공고 제목이 들어가는 부분 입니다.</a></h2> '
									+ '</div> '
									+ '<div class="recruit-right-bot"> '
										+ '<p class="recruit_career">요구 경력</p> '
										+ '<p class="recruit_education">요구 학력</p> '
										+ '<p class="recruit_location">근무 위치</p> '
										+ '<p class="recruit_rank">직급</p> '
										+ '<p class="recruit_pay">연봉</p> '
									+ '</div> '
								+ '</div> '
								+ '<div class="recruit-right-right"> '
									+ '<button class="updateBtn">수정</button> '
								+ '</div> '
						+ '</div> '; 
				
			})
			
			main.innerHTML = str;
			
			const numbers = document.querySelectorAll(".recruit_number");
			const titles = document.querySelectorAll(".recruit_title");
			const careers = document.querySelectorAll(".recruit_career");
			const educations = document.querySelectorAll(".recruit_education");
			const locations = document.querySelectorAll(".recruit_location");
			const ranks = document.querySelectorAll(".recruit_rank");
			const pays = document.querySelectorAll(".recruit_pay");
			
			data.forEach((item, index)=>{
				//numbers[index].textContent = item.recruit_number;
				titles[index].textContent = item.title;
				careers[index].textContent = item.career;
				educations[index].textContent = item.education;
				locations[index].textContent = item.location;
				ranks[index].textContent = item.rank;
				pays[index].textContent = item.pay + " 만원";
			});
		}
		recruit();
	</script>
	<header>
		<%@ include file="../front/company-header.jsp"%>
	</header>
	<h1>기업회원 메인페이지</h1>
	<hr>
	<main id="main">
		<div class="recruit-area">
			<div class="recruit-left">
				<h2 class="recruit_number">1</h2>
			</div>
			<div class="recruit-mid">
				<div class="recruit-right-top">
					<h2 class="recruit_title">공고 제목이 들어가는 부분 입니다.</h2>
				</div>
				<div class="recruit-right-bot">
					<p class="recruit_career">요구 경력</p>
					<p class="recruit_education">요구 학력</p>
					<p class="recruit_location">근무 위치</p>
					<p class="rank">직급</p>
					<p class="pay">연봉</p>
				</div>
			</div>
			<div class="recruit-right-right">
				<button class="updateBtn">수정</button>
			</div>
		</div>
		<div id="demo"></div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>