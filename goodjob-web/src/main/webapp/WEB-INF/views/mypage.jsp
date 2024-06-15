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
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #ccc;
	box-sizing:border-box;
}
#myinfo{
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
#container h1{
	margin-top: 20px;
	margin-bottom: 50px;
	margin-left: 20px;
	font-size: 1.5rem;
}

#mymainresume{
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	border: 1px solid #e0e0e0;
	padding: 20px;
	width: 90%;
	margin: 30px auto;
	border-radius: 3px;
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
		<h1>마이 페이지</h1>
		<div id="myinfo">
			<div>
			<p>이름</p>
			<p>전화번호</p>
			<p>이메일</p>				
			</div>
		</div>
		<div id="mymainresume">
			<div>
				<h2>대표 이력서</h2>
				
			</div>
			
		</div>
		</div>
	</main>
	<footer>
		<%@ include file="./front/footer.jsp"%>
	</footer>
<script type="text/javascript">
	$(document).ready(function(){
		
		const username = "hgd";
		
		
		
		$.ajax({
			url : "http://localhost:8888/api/member/info/" + username,
			dataType : "json",
			method : "GET",
			success : function(response) {
				
				console.log(response);
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
		
		$.ajax({
			url : "http://localhost:8888/api/resume/main/" + username,
			dataType : "json",
			method : "GET",
			success : function(response){

				console.log(response);
				
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
		
	});
	
</script>	
</body>
</html>