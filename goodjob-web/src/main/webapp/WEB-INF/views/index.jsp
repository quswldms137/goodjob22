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

#skillRecommendation, #vip, #everyRecruit{
	margin: 20px 0;
	width: 1100px;
	height: 300px;
	overflow: hidden;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
}

#vip{
	width: 300vw;
	margin: 20px 0;
	height: 300px;
	overflow: hidden;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
}

#all{
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
	height: 300px;
	border: 1px solid black;
	box-sizing: border-box;
}

.vip {
	width: 275px;
	height: 300px;
	border: 1px solid black;
	box-sizing: border-box;
}

.skill p, .vip p, .all p{
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

#prev{
	left:150px;
	top:100px;
	font-size:50px;
	cursor:pointer;
}

#next{
	left:1400px;
	top:100px;
	font-size:50px;
	cursor:pointer;
}
.page{
	width: 1100px;
	margin: 20px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<header>
		<%@ include file="./front/header.jsp"%>
	</header>


	<main>
		<p id="prev">&#60;</p>
		<p id="next">&#62;</p>
		<div id="skillRecommendation">
		
		</div>

		<div id="vip"></div>
		<div id="everyRecruit"></div>


	</main>

	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			const username = "${memberDto.username}";
			
			$.ajax({
				url : "http://localhost:8888/api/recruit/skill/" + username,
				method : "GET",
				dataType : "json",
				success : function(response) {

					console.log(response);
					let str = '<div id="slide1">';
					
					response.forEach(item =>{
						const array = item.location.split(" ");
						const location = array[0] + " " + array[1];
						
						const oldDate = new Date(item.deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						str += '<div class="skill"> ' + 
						'<a href=#><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg"></span></p> ' +
						'</div> ';
					});
					str += '</div>';
					$("#skillRecommendation").html(str);
					
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
					response.forEach(item =>{
						const array = item.location.split(" ");
						const location = array[0] + " " + array[1];
						
						const oldDate = new Date(item.deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						str += '<div class="vip"> ' + 
						'<a href=#><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg"></span></p> ' +
						'</div> ';
						str += '<div class="vip"> ' + 
						'<a href=#><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg"></span></p> ' +
						'</div> ';
						str += '<div class="vip"> ' + 
						'<a href=#><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg"></span></p> ' +
						'</div> ';
					});
					$("#vip").css("width",  300 + "vw");
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
					let index = 0;
					let count = 0;
					response.forEach(item =>{
						
						index++;
						count++;
						
						if(index = 0) {
							str += '<div class="page" id="page' + index + '">';
						}
						const array = item.location.split(" ");
						const location = array[0] + " " + array[1];
						const oldDate = new Date(item.deadline_date);
						const newDate = new Date();
						let diff = Math.abs(newDate.getTime() - oldDate.getTime());
						diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
						str += '<div class="all"> ' + 
						'<a href=#><div> ' +
						'<img alt="채용공고 사진" src="/resource/img/coupang.jpg"> ' +
						'</div> ' + 
						'<p>' + item.com_name + '</p> ' +
						'<p><b>' + item.title + '</b></p> ' +
						'<p><span>' + location + '</span></p></a>' +
						'<p class="last"><span class="applyBtn">즉시지원</span><span>D-' + diff + '</span> ' + 
						'<span><img alt="스크랩한 공고" src="/resource/img/noscrap.png" class="scrapImg"></span></p> ' +
						'</div> ';
						if(count === 4){
							count = 0;
							str += "</div>";
						}
					});
					
					$("#everyRecruit").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
				
			});
			
		});
		
		let currentPage = 0;
		let startPage = 0;
		let totalPage = document.querySelectorAll(".skill");
		console.log(totalPage);
		
		$('#prev').on('click', function() {
			currentPage++;
			  $('#vip').css('transform', 'translateX(' + (-100) + 'vw)');
			  $('#vip').css('transition', 'transform 0.5s ease');
			});
		
		$('#next').on('click', function() {
			currentPage--;
			  $('#vip').css('transform', 'translateX(' + (+100) + 'vw)');
			  $('#vip').css('transition', 'transform 0.5s ease');
			});
		
		
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>