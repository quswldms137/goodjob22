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
	<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
}

.page-title{
	text-align:center;
}

#yesAnswer {
	width: 900px;
	margin: 30px auto;
}

.answer-list-title {
	width: 100%;
	display: flex;
	text-align: center;
	border-bottom: 1px solid #ccc;
	border-top:1px solid #ccc;
	padding: 15px 0;
}

.answer-list-title li:nth-child(1) {
	width: 15%;
}

.answer-list-title li:nth-child(2) {
	width: 50%;
}

.answer-list-title li:nth-child(3) {
	width: 15%;
	text-align: center;
}

.answer-list-title li:nth-child(4) {
	width: 10%;
}

.answer-list-title li:nth-child(5) {
	width: 10%;
}

.answer-list-content {
	width: 100%;
	display: flex;
	align-items:center;
	text-align: center;
	border-bottom: 1px solid #eee;
	padding: 20px 0;
}

.answer-list-content li:nth-child(1) {
	width: 15%;
	font-size: 14px;
	color: #aaa;
}

.answer-list-content li:nth-child(2) {
	width: 50%;
	text-align: left;
}

.answer-list-content li:nth-child(3) {
	width: 15%;
	text-align: center;
	font-size: 14px;
	color: #aaa;
}

.answer-list-content li:nth-child(4) {
	width: 10%;
}

.answer-list-content li:nth-child(5) {
	width: 10%;
}

#pages {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

#pages input[type="button"] {
	width: 30px;
	height: 30px;
	background: #fff;
	border: 1px solid #bbb;
	color: #bbb;
	cursor: pointer;
	margin: 0 5px;
	margin-top: 40px;
}

#pages input[type="button"]:hover {
	background: #f9f9f9;
}

.activePage {
	background: #fff !important; /* 원하는 색상으로 변경 */
	border: 1px solid #333 !important;
	color: #333 !important; /* 텍스트 색상 */
}

.answer-list-content input[type="button"]{
	font-family: "Pretendard Variable", Pretendard;
	border:1px solid #eee;
	background:#f7f7f7;
	padding:5px 10px;
	font-size:13px;
	cursor:pointer;
}

.sidebar-box4 p:nth-child(3) a{
	color: #FB8500 !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/admin-header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/admin-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<h3 class="page-title">답변 한 문의내역</h3>
		<div id="yesAnswer"></div>


		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			pageChange({target: {value: 1}});
			
			$.ajax({
				url : "http://localhost:8888/api/qna/answer/list/1",
				method : "GET",
				dataType : "json",
				success : function(response){
					
					const totalItem = response[0].yesAnswerTotal;
					let pages = 0;
					
					if(totalItem % 5 > 0){
						pages = Math.ceil(totalItem / 5);
					}
					if(totalItem % 5 === 0){
						pages = totalItem / 5;
					}
					
					
					let str = '<ul class="noanswer-list-title"><li>카테고리</li><li>제목</li><li>작성일</li><li>답변여부</li><li>답변작성</li></ul>';
				      
					response.forEach(qna => {
						
						str += '<ul class="answer-list-content">';
						str += '<li>' + qna.category + '</li>';
						str += '<li>' + qna.title + '</li>';
						str += '<li>' + qna.reg_date + '</li>';
						if(qna.answer === null){
							str += '<li><div class="answer" style="color:red"><b>답변 : </b>X</div></li>';
						}else{
							str += '<li><div class="answer" style="color:blue"><b>답변 : </b>O</div></li>';
						}
						str += '<li><input type="button" value="답변작성" onclick="answerToQna(event)" id="answer' + qna.cs_no + '"></li>';
						str += '</ul>';
						
					});
					
					if (pages > 1) {
			            str += '<div id="pages">';
			            for (let i = 1; i <= pages; i++) {
			                let activeClass = (i === page) ? 'activePage' : '';
			                str += '<input type="button" id="memberPage' + i + '" value="' + i + '" onclick="pageChange(event)" class="memberListBtn ' + activeClass + '">';
			            }
			            str += '</div>';
			        }
					
					$("#yesAnswer").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
			
		});
		
		function pageChange(event){
			const page = parseInt(event.target.value);
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				const response = JSON.parse(this.responseText);
				
				const totalItem = response[0].yesAnswerTotal;
				let pages = 0;
				 
				if(totalItem % 5 > 0){
					pages = Math.ceil(totalItem / 5);
				}
				if(totalItem % 5 === 0){
					pages = totalItem / 5;
				}

				let str = '<ul class="answer-list-title"><li>카테고리</li><li>제목</li><li>작성일</li><li>답변여부</li><li>답변작성</li></ul>';
		        response.forEach(qna => {
		            str += '<ul class="answer-list-content">';
		            str += '<li>' + qna.category + '</li>';
		            str += '<li>' + qna.title + '</li>';
		            str += '<li>' + qna.reg_date + '</li>';
		            if (qna.answer === null) {
		                str += '<li><div class="answer" style="color:red"><b>답변 : </b>X</div></li>';
		            } else {
		                str += '<li><div class="answer" style="color:blue"><b>답변 : </b>O</div></li>';
		            }
		            str += '<li><input type="button" value="답변작성" onclick="answerToQna(event)" id="answer' + qna.cs_no + '"></li>';
		            str += '</ul>';
		        });

		        if (pages > 1) {
		            str += '<div id="pages">';
		            for (let i = 1; i <= pages; i++) {
		                let activeClass = (i === page) ? 'activePage' : '';
		                str += '<input type="button" id="memberPage' + i + '" value="' + i + '" onclick="pageChange(event)" class="memberListBtn ' + activeClass + '">';
		            }
		            str += '</div>';
		        }
				
				$("#yesAnswer").html(str);
				
			}
			xhr.open("GET", "http://localhost:8888/api/qna/answer/list/"+ page, true);
			xhr.send();
		}
		
		function answerToQna(event){
			const cs_no = event.target.id.substring(6);
			location.href="/admin/noanswer/answer/" + cs_no;
		}
		
		
	</script>
</body>
</html>