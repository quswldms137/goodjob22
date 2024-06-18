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
#memberUser {
	margin: 50px 0;
}

#memberUser p {
	border: 1px solid black;
	padding: 20px;
	width: 700px;
	text-align: center;
	display: flex;
	justify-content: space-evenly;
	margin: 5px auto;
}

#companyUser {
	margin: 50px 0;
}

#companyUser p {
	border: 1px solid black;
	padding: 20px;
	width: 700px;
	text-align: center;
	display: flex;
	justify-content: space-evenly;
	margin: 5px auto;
}

p:hover {
	background: gray;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
		<h2>개인 회원 리스트</h2>
		<hr>
		<div id="memberUser"></div>
		<h2>기업 회원 리스트</h2>
		<hr>
		<div id="companyUser"></div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$.ajax({
			url : "http://localhost:8888/api/member/list/1",
			method : "GET",
			dataType : "json",
			success : function(response){
				
				const totalItem = response[0].total;
				let pages = 0;
				
				if(totalItem % 4 > 0){
					pages = Math.ceil(totalItem / 4);
				}
				if(totalItem % 4 === 0){
					pages = totalItem / 4;
				}
				let str = '';
				
				response.forEach(member => {
					str += '<p><a href="/admin/member/detail/' + member.mem_no + '"><span><b>' + member.mem_name + '구직자님</b></span></a><span><b>가입일 : </b>' + member.make_date + '</span><span><b>아이디 : ' + 
						'</b>' + member.username + '</span><span><b>연락처 : </b>' + member.mem_tel + '</span></p>';
				});
				
				if(pages > 1){
					
				str += '<div id="pages">';
				for(let i = 0; i < pages; i++){
					str += '<input type="button" value="' + (i + 1) + '" onclick="pageMemberList(event)" class="memberListBtn">';
				}
				str += '</div>';
				
				}
				
				$("#memberUser").html(str);
				
			},
			error : function(xhr, status, error){
				
			}
		});
		
		$.ajax({
			url : "http://localhost:8888/api/company/list/1",
			method : "GET",
			dataType : "json",
			success : function(response){
				
				let str = '';
				
				const totalItem = response[0].total;
				let pages = 0;
				
				if(totalItem % 4 > 0){
					pages = Math.ceil(totalItem / 4);
				}
				if(totalItem % 4 === 0){
					pages = totalItem / 4;
				}
				response.forEach(company => {
					str += '<p><a href="/admin/company/detail/' + company.com_no + '"><span><b>' + company.com_name + '</b></span></a><span><b>가입일 : </b>' + company.make_date + '</span><span><b>아이디 : ' + 
						'</b>' + company.username + '</span><span><b>연락처 : </b>' + company.com_tel + '</span></p>';
				});
				
				if(pages > 1){
				str += '<div id="pages">';
					
				for(let i = 0; i < pages; i++){
					str += '<input type="button" value="' + (i + 1) + '" onclick="pageCompanyList(event)" class="companyListBtn">';
				}
				str += '</div>';
				}
				
				$("#companyUser").html(str);
				
			},
			error : function(xhr, status, error){
				
			}
		});
		
	});
	
	function pageMemberList(event){
		const page = event.target.value;
		
		const xhr = new XMLHttpRequest();
		xhr.onload = function(){
			
			const response = JSON.parse(this.responseText);
			
			const totalItem = response[0].total;
			let pages = 0;
			
			if(totalItem % 4 > 0){
				pages = Math.ceil(totalItem / 4);
			}
			if(totalItem % 4 === 0){
				pages = totalItem / 4;
			}
			
			let str = "";

			response.forEach(member => {
				str += '<p><a href="/admin/member/detail/' + member.mem_no + '"><span><b>' + member.mem_name + '구직자님</b></span></a><span><b>가입일 : </b>' + member.make_date + '</span><span><b>아이디 : ' + 
					'</b>' + member.username + '</span><span><b>연락처 : </b>' + member.mem_tel + '</span></p>';
			});
			
			if(pages > 1){
				
			str += '<div id="pages">';
			for(let i = 0; i < pages; i++){
				str += '<input type="button" value="' + (i + 1) + '" onclick="pageMemberList(event)" class="memberListBtn">';
			}
			str += '</div>';
			}
			
			$("#memberUser").html(str);
			
		}
		xhr.open("GET", "http://localhost:8888/api/member/list/"+ page, true);
		xhr.send();
	}
	
	function pageCompanyList(event){
		const page = event.target.value;
		
		const xhr = new XMLHttpRequest();
		xhr.onload = function(){
			
			const response = JSON.parse(this.responseText);
			
			const totalItem = response[0].total;
			let pages = 0;
			
			if(totalItem % 4 > 0){
				pages = Math.ceil(totalItem / 4);
			}
			if(totalItem % 4 === 0){
				pages = totalItem / 4;
			}
			let str = "";

			response.forEach(company => {
				str += '<p><a href="/admin/company/detail/' + company.com_no + '"><span><b>' + company.com_name + '</b></span></a><span><b>가입일 : </b>' + company.make_date + '</span><span><b>아이디 : ' + 
					'</b>' + company.username + '</span><span><b>연락처 : </b>' + company.com_tel + '</span></p>';
			});
			
			if(pages > 1){
				
			str += '<div id="pages">';
			for(let i = 0; i < pages; i++){
				str += '<input type="button" value="' + (i + 1) + '" onclick="pageCompanyList(event)" class="companyListBtn">';
			}
			str += '</div>';
			}
			
			$("#companyUser").html(str);
			
		}
		xhr.open("GET", "http://localhost:8888/api/company/list/"+ page, true);
		xhr.send();
	}
</script>
</body>
</html>
