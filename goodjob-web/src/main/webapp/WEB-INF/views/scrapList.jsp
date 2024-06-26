<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
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

#company_container {
	display: flex;
	flex-direction: column;
}

#container h1{
	font-size: 1.5rem;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 30px;
}

#company_box {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	border: 1px solid #e0e0e0;
	padding: 20px;
	width: 90%;
	margin: 0 auto;
	border-radius: 3px;
}

#company_box:hover {
	background: #e0e0e0;
}
.title{
	margin: 10px 0;
	font-weight: bold;
}
.info {
	display: flex;
	flex-direction: column;
}
.starImg {
	width: 30px;
	height: 30px;
}
.deadline_date{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
input[type=button]{
	padding: 10px;	
	background: #FB8500;
	color: white;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
}
input[type=button]:hover{
	cursor: pointer;
}
#pages{
	text-align: center;
	margin: 10px;
}
#pages input[type=button]{
	background: #ededed;
	color: black;
	margin: 0 3px;
}
.sidebar-box5 p:nth-child(2) a{
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
			<h1>스크랩한 공고</h1>
			<div id="recruit_container"></div>
		</div>
	</main>
	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(
				function() {
					const username = localStorage.getItem("username");
					
					$.ajax({
						url : "http://localhost:8888/api/subscrap/scrap/1/"
								+ username,
						dataType : "json",
						method : "GET",
						success : function(response) {
							
							console.log(response);
							
							const totalItem = response[0].total;
							let pages = 0;
							
							if(totalItem % 5 > 0){
								pages = Math.ceil(totalItem / 5);
							}
							if(totalItem % 5 === 0){
								pages = totalItem / 5;
							}
							let str = "";
							response.forEach(item => {
								str += '<div id="company_box"> ' + 
									   '<a href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '" class="info"> ' + 
									   '<p class="com_name">' + item.com_name + '</p> ' + 
									   '<p class="title">' + item.title + '</p>' + 
									   '<p class="detail"><span>' + item.career + ', </span><span>' + item.education + ', </span><span>' + 
									   item.location + ', </span><span>' + item.rank + ', </span><span>' + item.pay + '</span></p>' + 
									   '</a> ' + 
									   '<div class="deadline_date"><span>' + item.deadline_date + '</span></div> ' +
									   '<input type="button" value="지원하기" onclick="applyRecruit(event)" id="apply' + item.recruit_no + '">' + 
									   '<a href="#" class="interest" onclick="changeScrap(event)"> <img alt="관심 기업" id="scrap' + item.recruit_no + '" src="/resource/img/yesscrap.png" class="starImg"></a> ' +
						 			   '</div> ';
							});
							
							if(pages > 1){
								
								str += '<div id="pages">';
								for(let i = 0; i < pages; i++){
									str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="scrapBtn">';
								}
								str += '</div>';
								}
							
							$("#recruit_container").html(str);
						},
						error : function(xhr, status, error) {
							console.log(error);
						}
				});
					
				
		});
		
		function changeScrap(event){
			const id = event;
			const childElement = id.srcElement;

			const username = localStorage.getItem("username");
			
			const recruit_no = event.target.id.substring(5);
			console.log(recruit_no);
			
			
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				if(this.responseText !== ""){
					
					if(childElement.src === "http://localhost:9991/resource/img/yesscrap.png"){
						childElement.src = "http://localhost:9991/resource/img/noscrap.png";
					}else {
						childElement.src = "http://localhost:9991/resource/img/yesscrap.png";
					}
				
					alert(this.responseText);
				}else{
					alert("로그인이 필요한 기능입니다.");
				}
		
			}
			
			xhr.open("POST", "http://localhost:8888/api/subscrap/scrap", true);
			xhr.setRequestHeader("Content-type", "application/json");
			const data = JSON.stringify({
				username : username,
				recruit_no : recruit_no
			});
			xhr.send(data);
			
		}
		
		function applyRecruit(event){
	       event.preventDefault(); // 폼 기본 제출 방지	
	       const username = localStorage.getItem("username");
	       const recruit_no = event.target.id.substring(5);
	       //const role = localStorage.getItem("role");

	       // 필요한 데이터를 객체로 수집
	            const data = {
	                recruit_no: recruit_no
	            };
	            
	            $.ajax({
	                type: 'POST',
	                beforeSend: function(xhr) {
						// 요청 헤더에 사용자 이름을 설정
						xhr.setRequestHeader("username", username);
					},
	                url: 'http://localhost:8888/api/recruit/nowApply',
	                data: JSON.stringify(data),      	
	                contentType: "application/json",
	                success: function (response) {
	                    alert('즉시지원 성공!!');
	                },
	                error: function (error) {
	                    alert('즉시지원에 실패 하셨습니다.ㅜ');
	                    console.error('Error:', error);
	                }
	            });
		}
		
		function pageChange(event){
			const page = event.target.value;
			
			const username = localStorage.getItem("username");
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				
				const response = JSON.parse(this.responseText);
				
				const totalItem = response[0].total;
				let pages = 0;
				
				if(totalItem % 5 > 0){
					pages = Math.ceil(totalItem / 5);
				}
				if(totalItem % 5 === 0){
					pages = totalItem / 5;
				}
				let str = "";
				response.forEach(item => {
					str += '<div id="company_box"> ' + 
						   '<a href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '" class="info"> ' + 
						   '<p class="com_name">' + item.com_name + '</p> ' + 
						   '<p class="title">' + item.title + '</p>' + 
						   '<p class="detail"><span>' + item.career + ', </span><span>' + item.education + ', </span><span>' + 
						   item.location + ', </span><span>' + item.rank + ', </span><span>' + item.pay + '</span></p>' + 
						   '</a> ' + 
						   '<div class="deadline_date"><span>' + item.deadline_date + '</span></div> ' +
						   '<input type="button" value="지원하기" onclick="apply()">' + 
						   '<a href="#" class="interest" onclick="changeScrap(event)"> <img alt="관심 기업" id="scrap' + item.recruit_no + '" src="/resource/img/yesscrap.png" class="starImg"></a> ' +
			 			   '</div> ';
				});
				
				if(pages > 1){
					
				str += '<div id="pages">';
				for(let i = 0; i < pages; i++){
					str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="scrapBtn">';
				}
				str += '</div>';
				}
				
				$("#recruit_container").html(str);
				
			}
			xhr.open("GET", "http://localhost:8888/api/subscrap/scrap/"+ page + "/" + username, true);
			xhr.send();
		}
		
	</script>
</body>
</html>