<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사지원 현황</title>
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

#sidebar {
	background: #fff;
}

.mypage-title {
	font-size: 20px;
	padding-top: 47px;
	padding-left: 47px;
	margin-bottom: 50px;
}

.resume-area-box {
	width: 80%;
	margin: 0 auto;
	border: 1px solid #eee;
	padding: 20px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.sidebar-box3 p:nth-child(2) a {
	color: #FB8500 !important;
}

table, tr, th, td {
	border-collapse: collapse;
	border: 1px solid eee;
	padding: 20px;
	text-align: center;
}

table {
	margin: 0 auto;
	border-top: 2px solid #333;
	border-right: 0;
	border-left: 0;
}

tr {
	border-bottom: 1px solid #eee;
}
tr:last-child{
	border-bottom:0;
}

td:nth-child(1) {
	font-size: 14px;
}

td:nth-child(3) {
	font-size: 14px;
	color: #aaa;
	font-weight: 400 !important;
}

td:nth-child(4) {
	font-size: 14px;
	color: #aaa;
	font-weight: 400 !important;
}

td:nth-child(5) {
	font-size: 14px;
	color: #aaa;
	font-weight: 400 !important;
}

td:nth-child(6) {
	font-size: 14px;
	color: #aaa;
	font-weight: 400 !important;
}

span {
	border: 1px solid #ccc;
	background: #f7f7f7;
	color: #666;
	font-size: 14px;
	padding: 8px;
}

.cancelBtn {
	cursor: pointer;
}

.cancelBtn:hover {
	background: #eee;
}

#resumelist td:nth-child(3) {
	font-weight: bold;
}

#resumelist td:nth-child(2):hover {
	text-decoration: underline;
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
			<h2 class="mypage-title">입사지원 현황</h2>
			<div class="resume-area">
				<table>
					<thead>
						<tr>
							<th>회사명</th>
							<th>채용공고 제목</th>
							<th>마감일</th>
							<th>면접 결과</th>
							<th>서류 결과</th>
							<th>열람/미열람</th>
							<th>지원취소</th>
						</tr>
					</thead>
					<tbody id="resumelist">

					</tbody>
				</table>
			</div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>


	<script>
	function getResumeList(username) {
	    $.ajax({
	        url: "http://localhost:8888/api/resume/mylist/" + username,
	        type: "GET",
			dataType : "json",
	        success: function(response) {
	        	
	        	console.log(response);
	        	
	            let output = "";
				response.forEach(memrecruit => {
					
	            	const deadline_date = " ~ " + memrecruit.recruitDto.deadline_date.split("-")[1] + "." + memrecruit.recruitDto.deadline_date.split("-")[2];
	            	
	            	
	            	let interview = "";
	            	if(memrecruit.interview_pass === 0){
	            		interview = "심사중";
	            	}else if(memrecruit.interview_pass === 1){
	            		interview = "합격";
	            	}else{
	            		interview = "불합격";
	            	}
	            	
	            	
	            	let resume = "";
	            	if(memrecruit.resume_pass === 0){
	            		resume = "심사중";
	            	}else if(memrecruit.resume_pass === 1){
	            		resume = "합격";
	            	}else{
	            		resume = "불합격";
	            	}
					
	            	
	            	let view = "";
	            	if(memrecruit.view === false){
	            		view = "미열람";
	            	}else{
	            		view = "열람";
	            	}
	            	
	            	output += '<tr id="row' + memrecruit.mem_recruit_no + '"><td>' + memrecruit.recruitDto.com_name + '</td> ' + 
	            	 '<td><a href="/employ/detail/' + memrecruit.recruitDto.recruit_no + '/' + memrecruit.recruitDto.com_no + '/' + memrecruit.recruitDto.com_detail_no + '">' + memrecruit.recruitDto.title + '</a></td> ' + 
	            	'<td>' + deadline_date + '</td> ';
	            	
	            	if(interview === '심사중'){
	            	output += '<td style="color:green">' + interview + '</td> ';
	            	}else if(interview === '합격'){
	            	output += '<td style="color:blue">' + interview + '</td> ';
	            	}else if(interview === '불합격'){
	            	output += '<td style="color:red">' + interview + '</td> ';
	            	};
	            	
	            	if(resume === '심사중'){
	            		output += '<td style="color:green">' + resume + '</td>';
		            	}else if(resume === '합격'){
		            		output += '<td style="color:blue">' + resume + '</td>';
		            	}else if(resume === '불합격'){
		            		output += '<td style="color:red">' + resume + '</td>';
		            	};
		            	
	            	if(view === '열람'){
	            		output += '<td style="color:blue">' + view + '</td>';
	            	}else if(view === '미열람'){
	            		output += '<td style="color:red">' + view + '</td>';
	            	};
	            	
	            	output += '<td><span onclick="return cancelRecruit(event)" id="cancel' + memrecruit.mem_recruit_no + '" class="cancelBtn">지원 취소</span></td> ' +
	           		'</tr>';
				});
	            
	            
	            $('#resumelist').html(output);
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
	
	function cancelRecruit(event){
		const mem_recruit_no = event.target.id.substring(6);
		
		if(!confirm("지원 취소하시겠습니까?")){
			return false;
		}
		
		$.ajax({
			url : "http://localhost:8888/api/resume/mylist",
			method : "DELETE",
			data : {
				mem_recruit_no : mem_recruit_no
			},
			dataType : "text",
			success : function(response){
				alert(response);	
				if(response === "지원 취소 성공했습니다."){
					document.getElementById("row" + mem_recruit_no).style.display = "none";
				}
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		
		});
	}
	
	</script>
</body>
</html>