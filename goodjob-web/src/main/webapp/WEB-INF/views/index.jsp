<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
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
main {
	width: 1100px;
	margin: 80px auto;
	border: 1px solid #eee;
}

.slide {
	display: flex;
}

#vip {
	margin: 20px 0;
	width: 1100px;
	height: 300px;
	overflow: hidden;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
}

#skillRecommendation {
	margin: 20px 0;
	height: 330px;
	overflow: hidden;
	transition: all 1s ease-out;
	display: flex;
}

#vip {
	width: 300vw;
	margin: 20px 0;
	height: 330px;
	overflow: hidden;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
}

#all {
	width: 100%;
	margin: 20px 0;
	overflow: hidden;
	display: flex;
	flex-wrap: wrap;
	position: relative;
}

label:hover {
	cursor: pointer;
}

.skill, .all {
	width: 275px;
	height: 330px;
	border: 1px solid black;
	box-sizing: border-box;
}

.vip {
	width: 275px;
	height: 300px;
	border: 1px solid black;
	box-sizing: border-box;
}

.skill p, .vip p, .all p {
	margin: 5px 0;
}

.skill img, .vip img, .all img {
	max-width: 100%;
}

.scrapImg {
	max-width: 100%;
	width: 20px;
}

.scrapImg:hover {
	cursor: pointer;
}

.applyBtn {
	border: 1px solid orange;
	padding: 2px;
	color: orange;
}

.last {
	display: flex;
	justify-content: space-between;
	padding: 5px;
}

.applyBtn:hover {
	cursor: pointer;
}

#prev {
	left: 150px;
	top: 100px;
	font-size: 50px;
	cursor: pointer;
}

#next {
	left: 1400px;
	top: 100px;
	font-size: 50px;
	cursor: pointer;
}

.page {
	width: 1100px;
	margin: 20px;
}

body::-webkit-scrollbar {
	display: none;
}
#everyRecruit{
	width: 1100px;
	height: fit-content;
	display: flex;
	flex-wrap: wrap;
	row-gap: 20px;
	position: relative;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<%@ include file="./front/header.jsp"%>
	</header>


	<main>
		<h3 class="skillMatchingH3">스킬 매칭</h3>
		<div id="skillRecommendation"></div>
		<h3>VIP 채용공고</h3>
		<div id="vip"></div>

		<h3>채용공고</h3>
		<div id="everyRecruit"></div>


	</main>

	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			const username = localStorage.getItem("username");
			$.ajax({
				url : "http://localhost:8888/api/recruit/skill/" + username,
				method : "GET",
				dataType : "json",
				success : function(response) {
					
					let str = '';
					if(response.length > 0){
						
					
						for(let i = 0; i < 4; i++){
							
						const location = response[i].location;
						
						const oldDate = new Date(response[i].deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						str += '<div class="skill"> ' + 
						'<a href="/employ/detail/' + response[i].recruit_no + '/' + response[i].com_no + '/' + response[i].com_detail_no + '" ><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + response[i].com_name + '</p> ' +
						'<p><b>' + response[i].title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn apply' + response[i].recruit_no + '" onclick="applyRecruit(event)">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img onclick="changeScrap(event)" alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg scrap' + response[i].recruit_no + '"></span></p> ' +
						'</div> ';
						
						}						
					
					$("#skillRecommendation").html(str);
					}else{
						$("#skillRecommendation").css("display", "none");
						$(".skillMatchingH3").css("display", "none");
					}
					
				},
				error : function(xhr, status, error) {
				}
			});
			
			$.ajax({
				url : "http://localhost:8888/api/recruit/vip",
				method : "GET",
				dataType : "json",
				success : function(response){

					let str = '';
					console.log(response);
					
					response.forEach(item => {
						
						const location = item.location;
						
						const oldDate = new Date(item.deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						
						str += '<div class="vip"> ' + 
						'<a href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '" ><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn apply' + item.recruit_no + '" onclick="applyRecruit(event)" >즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img onclick="changeScrap(event)" alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg scrap' + item.recruit_no + '"></span></span></p> ' +
						'</div> ';
					});
					
					$("#vip").html(str);
				},
				error : function(xhr, status, error){
				}
			});
			
			$.ajax({
				url : "http://localhost:8888/api/recruit/all",
				method : "GET",
				dataType : "json",
				success : function(response){
					let str = '';

					const totalPage = (response.length)
					response.forEach(item =>{
						
						const array = item.location.split(" ");
						const location = array[0] + " " + array[1];
						const oldDate = new Date(item.deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						str += '<div class="all"> ' + 
						'<a href="/employ/detail/' + item.recruit_no + '/' + item.com_no + '/' + item.com_detail_no + '" ><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn apply' + item.recruit_no + '" onclick="applyRecruit(event)" >즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img onclick="changeScrap(event)" alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg scrap' + item.recruit_no + '"></span></span></p> ' +
						'</div> ';
					});
					
					$("#everyRecruit").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
				
			});
			
		});
		

		function changeScrap(event){
			const img = event.target;
			const username = localStorage.getItem("username");
			
			recruit_no = event.target.className.split(" ")[1].substring(5);
			
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				
				if(this.responseText === "공고 스크랩이 등록되었습니다." || this.responseText === "공고 스크랩이 취소되었습니다."){
					
					if(img.src === "http://localhost:9991/resource/img/yesscrap.png"){
						img.src = "http://localhost:9991/resource/img/noscrap.png";
					}else {
						img.src = "http://localhost:9991/resource/img/yesscrap.png";
					}
				
					alert(this.responseText);
				}else{
					alert("로그인 되어있어야 사용 가능한 기능입니다.");
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
		
		/*
		let currentPage = 0;
		let startPage = 0;
		let totalPage = document.querySelectorAll(".skill");
		console.log(totalPage);
		$('#prevSkill').on('click', function() {
			currentPage++;
			  $('#vip').css('transform', 'translateX(' + (-100) + 'vw)');
			  $('#vip').css('transition', 'transform 0.5s ease');
			});
		
		$('#nextSkill').on('click', function() {
			currentPage--;
			  $('#vip').css('transform', 'translateX(' + (+100) + 'vw)');
			  $('#vip').css('transition', 'transform 0.5s ease');
			});
		*/
		
		function applyRecruit(event){
		       event.preventDefault(); // 폼 기본 제출 방지	
		       const username = localStorage.getItem("username");
		       const recruit_no = event.target.className.split(" ")[1].substring(5);
		       //const role = localStorage.getItem("role");

		       console.log(recruit_no);
		       
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
		
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>