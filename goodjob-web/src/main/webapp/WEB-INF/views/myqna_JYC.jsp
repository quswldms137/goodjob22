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
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

#item_box{
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 90%;
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
	padding: 20px;
}
.category{
	margin-right: 10px;
}
#item_box:hover{
	background: #e0e0e0;
}
#item_box a{
	width: 600px;
}
#item_box input[type=button]{
	margin-left: 80px;
	padding: 3px 10px;
	padding: 10px;	
	background: #FB8500;
	color: white;
	border: 1px solid #e0e0e0;
	border-radius: 3px;
}
#item_box input[type=button]:hover{
	cursor: pointer;
}
#container h1{
	font-size: 1.5rem;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 50px;
}
.content{
	margin: 3px 0;
}
.answer{
	width: 60px;
}
.sidebar-box4 p a{
	color: #FB8500 !important;
}
.qnaBtn{
	padding: 5px 7px;
}
#pages{
	text-align: center;
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
			<h1>문의 내역</h1>
			<div id="myquestion">
				
			
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
				url : "http://localhost:8888/api/qna/1/" + username,
				method : "GET",
				dataType : "json",
				success : function(response){
					
					const totalItem = response[0].total;
					
					let pages = 0;
					
					if(totalItem % 5 > 0){
						pages = Math.ceil(totalItem / 5);
					}
					
					let str = '';
					
					response.forEach(item =>{
						 str += '<div id="item_box" class="item' + item.cs_no + '"> ' + 
								'<a href="#"> ' +
						 		'<p><b>' + item.title + '</b></p> ' + 
								'<p class="content">' + item.content + '</p> ' +
 								'<p><span class="category"><b>카테고리 : </b>' + item.category + '</span><span><b>작성일 : </b>' + item.reg_date + '</span>';
 						if(item.ch_private === 0){
 							str += '<span><b> 비공개</b></span></p></a>';
 						}else{
 							str += '<span><b> 공개</b></span></p></a>';
 						}
						if(item.answer === "미답변"){
							str += '<div class="answer" style="color:red">' + item.answer + '</div> ';
						}else{
							str += '<div class="answer" style="color:blue">' + item.answer + '</div> ';
						}
						str += '<input type="button" value="삭제" onclick="deleteQuestion(event)" id="remove' + item.cs_no + '"> ' +
								'</div> ';
					});
					
					str += '<div id="pages">';
					for(let i = 0; i < pages; i++){
						str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="qnaBtn">';
					}
					str += '</div>';
					
					$("#myquestion").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
		});
		
		function removeQuestion(event){
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				const item_box = document.querySelector(".item" + event.target.id.substring(6)).style.display = "none";
				alert(this.responseText);		
					
			}
			xhr.open("DELETE", "http://localhost:8888/api/qna/" + event.target.id.substring(6), true);
			xhr.send();
		}
		
		function deleteQuestion(event){
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
					const item_box = document.querySelector(".item" + event.target.id.substring(6)).style.display = "none";
					
					alert(this.responseText);
			}
			xhr.open("DELETE", "http://localhost:8888/api/qna/" + event.target.id.substring(6), true);
			xhr.send();
		}
		
		function pageChange(event){
			const page = event.target.value;
			const username = "hgd"; 
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				
				const response = JSON.parse(this.responseText);
				
				const totalItem = response[0].total;
				
				let pages = 0;
				
				if(totalItem % 5 > 0){
					pages = Math.ceil(totalItem / 5);
				}
				
				let str = '';
				
				response.forEach(item =>{
					 str += '<div id="item_box" class="item' + item.cs_no + '"> ' + 
							'<a href="#"> ' +
					 		'<p><b>' + item.title + '</b></p> ' + 
							'<p class="content">' + item.content + '</p> ' +
								'<p><span class="category"><b>카테고리 : </b>' + item.category + '</span><span><b>작성일 : </b>' + item.reg_date + '</span>';
						if(item.ch_private === 0){
							str += '<span><b> 비공개</b></span></p></a>';
						}else{
							str += '<span><b> 공개</b></span></p></a>';
						}
					if(item.answer === "미답변"){
						str += '<div class="answer" style="color:red">' + item.answer + '</div> ';
					}else{
						str += '<div class="answer" style="color:blue">' + item.answer + '</div> ';
					}
					str += '<input type="button" value="삭제" onclick="deleteQuestion(event)" id="remove' + item.cs_no + '"> ' +
							'</div>';
				});
				str += '<div id="pages">';
				for(let i = 0; i < pages; i++){
					str += '<input type="button" value="' + (i + 1) + '" onclick="pageChange(event)" class="qnaBtn">';
					
				}
				str += "</div>";
				$("#myquestion").html(str);
				
			}
			xhr.open("GET", "http://localhost:8888/api/qna/"+ page + "/" + username, true);
			xhr.send();
		}
	</script>
</body>
</html>