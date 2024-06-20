
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
#memberDetail{
	width:600px;
	display: flex;
	align-items:center;
	flex-direction: column;
	margin: 10px auto;
}
#memberDetail h2{
	margin-bottom:15px;
}
#memberDetail p{
	width:600px;
	border-bottom: 1px solid #e8e8e8;
	border-right:1px solid #e8e8e8;
	border-left:1px solid #e8e8e8;
}
#memberDetail p:nth-child(2){
	border-top:1px solid #e8e8e8;
}
#memberDetail p b{
	display:inline-block;
	width:100px;
	text-align:center;
	background:#f9f9f9;
	padding:20px;
	margin-right:20px;
}
#memberDetail input[type=button]{
	display:inline-block;
	width: 100px;
	padding: 10px 15px;
	margin: 30px auto;
	border:1px solid #ccc;
	background:#fff;
	cursor:pointer;
}
#memberDetail input[type=button]:nth-child(1){
	background:#eee;
	border:1px solid #ccc;
	color:#333;
}

.btn-box{
	display:flex;
	gap:30px;
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
			<div id="memberDetail">
		
			</div>	
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	$(document).ready(function(){
		const mem_no = "${memberNo}";
		
		$.ajax({
			url : "http://localhost:8888/api/member/detail/" + mem_no,
			method : "GET",
			dataType: "json",
			success : function(response){
				
				let str ='<h2>개인 회원</h2>';
				str += '<p><b>회원번호</b>' + response.mem_no + '</p> ' + 
					   '<p><b>이름</b>' + response.mem_name + '</p> ' + 
					   '<p><b>아이디</b>' + response.username + '</p> ' + 
					   '<p><b>연락처</b>' + response.mem_tel + '</p> ' + 
					   '<p><b>이메일</b>' + response.mem_email + '</p> ' +
					   '<p><b>주소</b>' + response.mem_addr + '</p> ' + 
					   '<p><b>성별</b>' + response.mem_gender + '</p>' + 
					   '<p><b>생년월일</b>' + response.mem_birth + '</p>' + 
					   '<p><b>가입날짜</b>' + response.make_date + '</p>' + 
					   '<div class="btn-box">' +
					   '<input type="button" value="회원삭제" onclick="deleteMember(event)" class="' + response.username + ' mem_no' + response.mem_no + '">' +
					   '<input type="button" value="목록보기" onclick="backList(event)">'
					   '</div>';
					   
				$("#memberDetail").html(str);	   
					   
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
		
		
	});
	
	function deleteMember(event){
		
		const array = event.target.className.split(" ");
		const mem_no = array[1].substring(6);
		const username = array[0];
		
		const xhr = new XMLHttpRequest();
		xhr.onload = function(){
			alert(this.responseText);
			location.href="/admin/user/list";
		}
		xhr.open("DELETE", "http://localhost:8888/api/member/info/" + mem_no + "/" + username, true);
		xhr.send();
		
	}
	
	function backList(){
		window.location.href="/admin/user/list";
	}
</script>
</body>
</html>