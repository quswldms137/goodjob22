<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

#sidebar{
	background:#fff;
}

.company-nav ul li:nth-child(3) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

main #container {
	width: 900px;
	min-height: 700px;
	background-color: #fff;
	border-radius: 10px;
	box-sizing: border-box;
	padding: 20px;
}
#pagename	{
	text-align: center;
    margin: 20px;
	}
	
.recruit-area {
	width: 90%;
	margin: 0 0 10px 0;
	display: flex;
	padding: 25px;
	border: 1px solid #ddd;
	border-top: 2px solid #FB8500;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.recruit-left {
	width: 20%;
	border-right: 1px solid #eee;
	padding-right: 30px;
	margin-right: 30px;
}

.recruit-mid {
	width: 60%;
}

.recruit-right-top {
	padding-bottom: 20px;
}

.recruit-right-bot {
	display: flex;
 
}

.recruit-right-bot p {
	margin-right: 30px;
}

.recruit-right-right {
	width: 20%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.updateBtn, .deleteBtn {
	background-color: orange;
	width: 100px;
	height: 30px;
	text-align: center;
	padding: 5px;
	transition: background-color 0.2s ease;
	border-radius: 5px;
	border: none;
	color: white;
	cursor: pointer;
	margin: 5px 0;
}

.updateBtn:hover, .deleteBtn:hover {
	background-color: skyblue;
}

h1, h2 {
    color: #333;
}

.recruit-labels {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.recruit-labels h2 {
	margin-right: 20px;
    font-size: 18px;
}
</style>
</head>
<body>
<header>
		<%@ include file="../front/company-header.jsp"%>
</header>
<!-- 메인 내용 -->
<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		
		<div id="container">
			
		</div>
</main>
<!-- 여기까지 -->

<footer>
		<%@ include file="../front/footer.jsp"%>
</footer>
<script>
	$(document).ready(function(){
		
		const username = localStorage.getItem("username");
		
		$.ajax({
			url : "http://localhost:8888/api/company/receiveResume/" + 1,
			method : "GET",
			dataType : "json",
			success : function(response){
				console.log(response);
				
				let str = '<h2 id="pagename">지원받은 이력서</h2>';
				response.forEach(item =>{
					str += '<div class="recruit-area"> '; 
					str += '<div class="recruit-left"> ';
					str += '<h2 class="recruit_number">' + item.rectitle + '</h2> ';
					str += '</div> ';
					str += '<div class="recruit-mid"> ';
					str += '<div class="recruit-labels">';
					str += '<h2>'+ item.mem_name +'</h2>';
					str += '<h2>구직중</h2>';
					str += '</div>';
					str += '<div class="recruit-right-top">';
					str += '<h2 class="recruit_title">'+item.title +'</h2>';
					str += '</div>';
					str += '<div class="recruit-right-bot">';
					str += '<p class="recruit_career">희망직무 | ' + item.hope_job + '</p>';
					str += '<p class="recruit_location">희망지역 | ' + item.hope_city + '</p>';
					str += '</div>';
					str += '</div>';
					str += '<div class="recruit-right-right">';
					str += '<button class="updateBtn">관심</button>';
					str += '<button class="deleteBtn">포지션 제안</button>';
					str += '</div>';
					str += '</div>';
					str += '<div id="demo"></div>';
				});
				
				$("#container").html(str);
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
		
		
	});

</script>

</body>
</html>
