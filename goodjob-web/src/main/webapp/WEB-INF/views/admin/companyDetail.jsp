

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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}
#companyDetail{
	display: flex;
	flex-direction: column;
	width: 30%;
	margin: 10px auto;
}
#companyDetail p{
	border: 1px solid #e8e8e8;
	padding: 10px;
	text-align: center;
}
#companyDetail input[type=button]{
	width: 100px;
	padding: 5px 10px;
	margin: 10px auto;
	
}
#companyDetail p:hover{
	background:#cfcaca;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
		<div id="companyDetail">
		
		</div>		
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	$(document).ready(function(){
		const com_no = "${companyNo}";
		
		$.ajax({
			url : "http://localhost:8888/api/company/detail/" + com_no,
			method : "GET",
			dataType: "json",
			success : function(response){

				let money = response.money;
				
				if(response.money === null || response.money === undefined){
					money = 0;
				}
				
				let str ='';
				str += '<p><b>회원번호 : </b>' + response.com_no + '</p> ' + 
					   '<p><b>대표이름 : </b>' + response.com_ceo + '</p> ' + 
					   '<p><b>아이디 : </b>' + response.username + '</p> ' + 
					   '<p><b>연락처 : </b>' + response.com_tel + '</p> ' + 
					   '<p><b>이메일 : </b>' + response.com_email + '</p> ' +
					   '<p><b>주소 : </b>' + response.com_addr + '</p> ' + 
					   '<p><b>사업자번호 : </b>' + response.com_companynum + '</p>' + 
					   '<p><b>후원금 : </b>' + money + '만원</p>' + 
					   '<p><b>설립연도 : </b>' + response.foundation + '</p>' + 
					   '<input type="button" value="회원삭제" onclick="deleteCompany(event)" class="' + response.username + ' com_no' + response.com_no + '">';
					   
				$("#companyDetail").html(str);	   
					   
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
		
		
	});
	
	function deleteCompany(event){
		
		const array = event.target.className.split(" ");
		const com_no = array[1].substring(6);
		const username = array[0];
			
		const xhr = new XMLHttpRequest();
		xhr.onload = function(){
			alert(this.responseText);
			location.href="/admin/user/list";
		}
		xhr.open("DELETE", "http://localhost:8888/api/company/info/" + com_no + "/" + username, true);
		xhr.send();
		
	}
</script>
</body>
</html>