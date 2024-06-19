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
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #ccc;
	box-sizing:border-box;
}
.item{
	display: flex;
	width: 500px;
	border: 1px solid black;
	margin: 0 auto;
	padding: 10px;
	align-items: center;
	justify-content: space-between;
}
.item:hover{
	background : #d9d9d9;
}
.item p, .item div{
	margin: 5px;
}
.item input[type=button]{
	padding: 3px 7px;
}
#pages input[type=button]{
	padding: 5px;
	margin: 0 5px;
}
#pages{
	text-align: center;
	margin: 10px;
}
#changePageInputs{
	text-align: center;
	margin: 10px;
}
#changePageInputs input[type=button]{
	padding: 5px 7px;
}

#changePageInputs input[type=button]:nth-child(1){
	background: #FB8500 !important;
	border: 1px solid black;
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
			<div id="noAnswer">
			</div>
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			
			
			$.ajax({
				url : "http://localhost:8888/api/qna/noanswer/list/1",
				method : "GET",
				dataType : "json",
				success : function(response){
					
					const totalItem = response[0].noAnswerTotal;
					let pages = 0;
					
					
					
					if(totalItem % 5 > 0){
						pages = Math.ceil(totalItem / 5);
					}
					if(totalItem % 5 === 0){
						pages = totalItem / 5;
					}

					let str = '';
					
					response.forEach(qna => {
						 str += '<div class="item" id="item' + qna.cs_no + '"> ' + 
							'<a href="#"> ' +
					 		'<p><b>제목 : </b>' + qna.title + '</p> ' + 
							'<p class="content"><b>내용 : </b>' + qna.content + '</p> ' +
								'<p><span class="category"><b>카테고리 : </b>' + qna.category + ' </span><span><b>작성일 : </b>' + qna.reg_date + '</span>';
					if(qna.answer === null){
						str += '<div class="answer" style="color:red"><b>답변 : </b>X</div></a> ';
					}else{
						str += '<div class="answer" style="color:blue"><b>답변 : </b>O</div></a> ';
					}
					str += '<input type="button" value="답변작성" onclick="answerToQna(event)" id="answer' + qna.cs_no + '"> ' +
							'</div>';
					});
					
					if(pages > 1){
						
						str += '<div id="pages">';
						for(let i = 0; i < pages; i++){
							str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="qnaChangeBtn">';
						}
						str += '</div>';
						
					}
					
					$("#noAnswer").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
			
		});
		
		function pageChange(event){
			const page = event.target.value;
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				
				const response = JSON.parse(this.responseText);
				
				console.log(response);
				
				const totalItem = response[0].noAnswerTotal;
				let pages = 0;

				if(totalItem % 5 > 0){
					pages = Math.ceil(totalItem / 5);
				}
				if(totalItem % 5 === 0){
					pages = totalItem / 5;
				}


				let str = '';
					      
				response.forEach(qna => {
					 str += '<div class="item" id="item' + qna.cs_no + '"> ' + 
						'<a href="#"> ' +
				 		'<p><b>제목 : </b>' + qna.title + '</p> ' + 
						'<p class="content"><b>내용 : </b>' + qna.content + '</p> ' +
							'<p><span class="category"><b>카테고리 : </b>' + qna.category + ' </span><span><b>작성일 : </b>' + qna.reg_date + '</span>';
				if(qna.answer === null){
					str += '<div class="answer" style="color:red"><b>답변 : </b>X</div></a> ';
				}else{
					str += '<div class="answer" style="color:blue"><b>답변 : </b>O</div></a> ';
				}
				str += '<input type="button" value="답변작성" onclick="answerToQna(event)" id="answer' + qna.cs_no + '"> ' +
						'</div>';
				});
				
				if(pages > 1){
					
					str += '<div id="pages">';
					for(let i = 0; i < pages; i++){
						str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="qnaChangeBtn">';
					}
					str += '</div>';
					
				}
				
				$("#noAnswer").html(str);
				
			}
			xhr.open("GET", "http://localhost:8888/api/qna/noanswer/list/"+ page, true);
			xhr.send();
		}
		
		function answerToQna(event){
			const cs_no = event.target.id.substring(6);
			location.href="/admin/noanswer/answer/" + cs_no;
		}
		
	</script>
</body>
</html>