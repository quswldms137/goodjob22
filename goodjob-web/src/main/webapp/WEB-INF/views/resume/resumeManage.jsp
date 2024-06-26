<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
body {
	background: #FAFAFA;
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
	border-radius: 5px;
	box-sizing: border-box;
	background: #fff;
}
#sidebar{
	background:#fff;
}

.sidebar-box2 p:nth-child(2) a{
	color: #FB8500 !important;
}

.mypage-title{
	font-size:20px;
	padding-top:47px;
	padding-left:47px;
	margin-bottom:50px;
}

.resume-area-box{
	width:80%;
	margin:0 auto;
	border:1px solid #eee;
	padding:20px;
	box-sizing:border-box;
	margin-bottom:10px;
}
.resume-area-box a{
	display:flex;
	align-items:center;
}
.main-resume{
	display:inline-block;
	font-size:10px;
	padding:3px 8px;
	border:1px solid #FB8500;
	border-radius:5px;
	color:#FB8500;
	margin-left:15px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/member-sidebar-all.jsp"%>
		</div>
		<div id="container">
		<h2 class="mypage-title">이력서 현황</h2>
		<div class="resume-area">
		
		</div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>



	<script>
	function getResumeList(username) {
		
	    $.ajax({
	        url: "http://localhost:8888/api/resume/list",
	        type: "GET",
	        data: { username: username},
	        success: function(data) {
	            let output = "";
	            
	            for(let i = 0; i < data.length; i++){
	            	output += '<div class="resume-area-box">';
	                output += '<h3><a href="/resume/resumeDetail?resume_no='+ data[i].resume_no +'&mem_no='+ data[i].mem_no +'">' + data[i].title;
	                if(data[i].main == 1){
	                output += '<span class="main-resume">대표</span>';
	                }
	                output += '</a></h3>';
	                output += '</div>';
	            }
	            
	            output += '</div>';
	            
	            $('.resume-area').html(output);
	        },
	        error: function(error) {
	            console.error("Error fetching articles:", error);
	        }
	    });
	}

	$(document).ready(function() {
		const username = localStorage.getItem("username");
		getResumeList(username);
	});
	</script>




</body>
</html>