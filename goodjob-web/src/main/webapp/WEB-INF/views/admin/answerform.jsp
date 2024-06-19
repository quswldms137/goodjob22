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
	min-height: 700px;
	border:1px solid #eee;
}
#detailForm{
	border: 1px solid #eee;
	
}
#detailForm p{
	margin: 20px;
	text-align: center;
}
textarea{
	margin: 0 auto;
}
#inputs{
	display: flex;
	align-items: center;
	width: fit-content;
	margin: 0 auto;
}
#inputs input[type=button]{
	padding: 3px 7px;
	margin: 0 10px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
		<div id="detailForm">
		
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
							   '<p><b>작성자 : </b>' + response.username + ' <span></p> ' +
							   '<p><b>작성날짜 : </b>' + response.reg_date + '</span></p> ' + 
							   '<p><b>제목 : </b>' + response.title + '<span></p> ' +
							   '<p><b>카테고리 : </b>' + response.category + '</span></p> ' + 
							   '<p><b>내용 : </b>' + response.content + '</p> ' + 
							   '<p></p> ' + 
							   '</div> ' + 
							   '<div id="inputs"><textarea rows="20" cols="50" placeholder="답변을 입력하세요.">' + response.answer + '</textarea> ';
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