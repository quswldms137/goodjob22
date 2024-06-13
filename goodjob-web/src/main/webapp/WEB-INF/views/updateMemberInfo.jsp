<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내 정보 관리 페이지</h1>
<form name="frm">
	<input type="text" name="username" placeholder="아이디">
	<input type="text" name="mem_name" placeholder="이름">
	<input type="tel" name="mem_tel" placeholder="010-1234-5678">
	<input type="email" name="mem_email" placeholder="이메일">
	<input type="text" name="mem_gender" placeholder="성별">
	<input type="text" name="mem_birth" placeholder="생년월일">
	<input type="text" name="mem_addr" placeholder="주소">
	<input type="submit" value="저장" onclick="saveInfo(event)">
	<input type="submit" value="회원탈퇴" onclick="deleteInfo()">
	<div id="demo"></div>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		const username = "${memberDto.username}";
		console.log(username);
		$.ajax({
			url : "http://localhost:8888/api/member/info/" + username,
			dataType : "json",
			method : "GET",
			success : function(response){
				const obj = JSON.parse(response);
				console.log(obj);
				$("input[name=username]").val(obj.username);
				$("input[name=mem_name]").val(obj.mem_name);
				$("input[name=mem_tel]").val(obj.mem_tel);
				$("input[name=mem_email]").val(obj.mem_email);
				$("input[name=mem_gender]").val(obj.mem_gender);
				$("input[name=mem_birth]").val(obj.mem_birth);
				$("input[name=mem_addr]").val(obj.mem_addr);
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
	});
	
	function saveInfo(event){
		event.preventdefault;
		
		const form = document.forms['frm'];
		var formData = new FormData(form);
		
		console.log(formData);
		
		$.ajax({
			url : "http://localhost:8888/api/member/info",
			dataType : "text",
			method = "POST",
			data : formData,
			success : function(response){
				alert(response)
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	
	
	}

</script>
</body>
</html>