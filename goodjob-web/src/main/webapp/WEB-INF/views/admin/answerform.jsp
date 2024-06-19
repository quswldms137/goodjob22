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
#detailForm{
	width:800px;
	margin:0 auto;
	border-top:2px solid #333;
}

#detail{
	border:1px solid #eee;
	padding:20px;
	padding-bottom:50px;
	box-sizing:border-box;
}
#detail .category{
	display:inline-block;
	font-size:10px;
	padding:5px 10px;
	border:1px solid #FB8500;
	color:#FB8500;
	margin-bottom:10px;
}
#detail h1{
	font-size:24px;
}
#detail .answer-writer-info{
	padding:15px 0;
	border-bottom:1px solid #eee;
	margin-bottom:20px;
}
#detail .answer-writer-info span{
	font-size:14px;
	margin-right:20px;
}
#detail .answer-writer-info span:nth-child(2){
	color:#999;
}

hr{
	margin:40px 0 15px;
}

#inputs{
	width:800px;
	text-align:center;
}
#inputs textarea{
	width:100%;
	height:100px;
	border:1px solid #ccc;
	padding:5px;
	resize: none;
	box-sizing:border-box;
}
#inputs input[type="button"]{
	color:#fff;
	background:#FB8500;
	border:1px solid #FB8500;
	padding:15px 30px;
	font-family: "Pretendard Variable", Pretendard;
	font-size:16px;
	margin-top:20px;
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
			<div id="detailForm"></div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			const cs_no = "${cs_no}";
			
			$.ajax({
				url : "http://localhost:8888/api/qna/noanswer/detail/" + cs_no,
				method : "GET",
				dataType : "json",
				success : function(response){
					
					
					let str = '';
						str += '<div id="detail"> ' + 
							   '<p class="category">' + response.category + '</p>' +
							   '<h1 class="answer-title">' + response.title + '</h1> ' +
							   '<div class="answer-writer-info">' +
							   '<span>' + response.username + '</span>' +
							   '<span>' + response.reg_date + '</span>' + 
							   '</div>' +
							   '<div class="answer-content">' + response.content + '</div>' + 
							   '</div> ' + 
							   '<hr>' +
							   '<div id="inputs"><textarea placeholder="답변을 입력하세요.">' + response.answer + '</textarea> ';
							   if(response.answer === null){
									str +=	'<input type="button" value="답변작성" onclick="registAnswer(event)" id="answer' + response.cs_no + '"></div>';
							   }else {
								   str += '<input type="button" value="답변수정" onclick="updateAnswer(event)" id="answer' + response.cs_no + '"></div>';
							   }
							   
						$("#detailForm").html(str);   
					
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			
			});
		});
		
		function registAnswer(event){
			const data = JSON.stringify({
				cs_no : event.target.id.substring(6),
				answer : $("textarea").val()
			});
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				alert(this.responseText);
				location.href="/admin/noanswer/list";
			}
			xhr.open("POST", "http://localhost:8888/api/qna/answer", true);
			xhr.setRequestHeader("Content-type", "application/json");
			xhr.send(data);
		}
		
		function updateAnswer(event){
			const data = JSON.stringify({
				cs_no : event.target.id.substring(6),
				answer : $("textarea").val()
			});
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				alert(this.responseText);
				location.href="/admin/yesanswer/list";
			}
			xhr.open("PUT", "http://localhost:8888/api/qna/answer", true);
			xhr.setRequestHeader("Content-type", "application/json");
			xhr.send(data);
		}
	</script>
</body>
</html>