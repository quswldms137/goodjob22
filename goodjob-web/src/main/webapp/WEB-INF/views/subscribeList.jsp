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
	border: 1px solid #e0e0e0;
	padding: 20px;
	width: 90%;
	margin: 0 auto;
	border-radius: 3px;
}

#company_box:hover {
	background: #e0e0e0;
}
.com_name{
	font-weight: bold;
}
.info {
	display: flex;
	flex-direction: column;
}
.info p{
	margin-bottom: 5px;
}
.starImg {
	width: 30px;
	height: 30px;
}
#pages{
	text-align: center;
	margin: 10px;
}
#pages input[type=button]{
	padding: 5px 7px;
	margin: 0 3px;
}
.pension{
	margin: 5px 0;
}
.sidebar-box5 p:nth-child(3) a{
	color:#FB8500 !important;
}
.interest{
	height: fit-content;
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
			<h1>관심 기업</h1>
			<div id="company_container"></div>
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
						url : "http://localhost:8888/api/subscrap/subscribe/1/"
								+ username,
						dataType : "json",
						method : "GET",
						success : function(response) {
							let str = "";
							
							const totalItem = response[0].total;
							let pages = 0;
							
							if(totalItem % 5 > 0){
								pages = Math.ceil(totalItem / 5);
							}
							if(totalItem % 5 === 0){
								pages = totalItem / 5;
							}
							response.forEach(item => {
								str += '<div id="company_box"> ' + 
									   '<a href="/company94/companyDetail?com_no=' + item.com_no + '" class="info"> ' + 
									   '<p class="com_name">' + item.com_name + '</p> ' +
									   '<div> ' + 
									   '<span>' + item.sectors + '</span><span> &#183; </span><span>' + item.com_addr + '</span><span> &#183; </span> ' + 
									   '<span>' + item.foundation + '</span> ' +
									   '</div> ' +
									   '<p class="pension">' + item.pension + '</p>' + 
									   '</a> ' +
									   '<a href="#" class="interest" onclick="changeInterest(event)"> <img alt="관심 기업" id="interest' + item.com_no + '" src="/resource/img/yesinterest.png" class="starImg"></a> ' +
						 			   '</div> ';
							});
							
							if(pages > 1){
								
							str += '<div id="pages">';
							for(let i = 0; i < pages; i++){
								str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="subscribeBtn">';
							}
							str += '</div>';
							}
							
							$("#company_container").html(str);
							
						},
						error : function(xhr, status, error) {
							console.log(error);
						}
				});
					
				
		});
		
		
		
		function changeInterest(event){
			const id = event;
			const childElement = id.srcElement;
			
			const username = localStorage.getItem("username");
			const com_no = event.target.id.substring(8);
		
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				if(childElement.src === "http://localhost:9991/resource/img/yesinterest.png"){
					childElement.src = "http://localhost:9991/resource/img/nointerest.png";
				}else {
					childElement.src = "http://localhost:9991/resource/img/yesinterest.png";
				}
				
				alert(this.responseText);
		
			}
			
			xhr.open("POST", "http://localhost:8888/api/subscrap/subscribe", true);
			xhr.setRequestHeader("Content-type", "application/json");
			const data = JSON.stringify({
				username : username,
				com_no : com_no
			});
			xhr.send(data);
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
						   '<a href="/company94/companyDetail?com_no=' + item.com_no + '" class="info"> ' + 
						   '<p class="com_name">' + item.com_name + '</p> ' + 
						   '<div> ' + 
						   '<span>' + item.sectors + '</span><span> &#183; </span><span>' + item.com_addr + '</span><span> &#183; </span> ' + 
						   '<span>' + item.foundation + '</span> ' +
						   '</div> ' +
						   '</a> ' +
						   '<a href="#" class="interest" onclick="changeInterest(event)"> <img alt="관심 기업" id="interest' + item.com_no + '" src="/resource/img/yesinterest.png" class="starImg"></a> ' +
			 			   '</div> ';
				});
				
				if(pages > 1){
					
					str += '<div id="pages">';
					for(let i = 0; i < pages; i++){
						str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="subscribeBtn">';
					}
					str += '</div>';
					}
				
				$("#company_container").html(str);
				
			}
			xhr.open("GET", "http://localhost:8888/api/subscrap/subscribe/"+ page + "/" + username, true);
			xhr.send();
		}
		
		
	</script>
</body>
</html>