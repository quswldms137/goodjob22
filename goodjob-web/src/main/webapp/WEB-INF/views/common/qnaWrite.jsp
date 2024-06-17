<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}
#blue {
	color:blue;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
	<div class="container mt-5">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">문의·신고</button>
	 	</li>
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">문의·신고 내역</button>
	 	</li>
	</ul>

<div class="tab-content">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
    <p>문의·신고 관련 내용이 여기에 표시됩니다.</p>
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
    <p>문의·신고 내역 관련 내용이 여기에 표시됩니다.</p>
  </div>
</div>
        <h3>문의·신고</h3>
        <form name="frm-qnaForm">
            <div class="form-group">
                <label for="category">문의종류 <span id="blue">(필수)</span></label>
                <select class="form-control" name="category" required>
                    <option value="" disabled selected>선택</option>
                    <option value="서비스 이용문의">서비스 이용문의</option>
                    <option value="불량정보·오류신고">불량정보·오류신고</option>
                    <option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
                </select>
            </div>
            <div class="mb-3">
			  <label for="title" class="form-label">제목 <span id="blue">(필수)</span></label>
			  <input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요">
			</div>
			<div class="mb-3">
			  <label for="content" class="form-label">내용 <span id="blue">(필수)</span></label>
			  <textarea class="form-control" name="content" rows="3" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<input type="hidden" name="mem_no" value="1">
            <button type="submit" class="btn btn-primary btn-lg" onclick="submitQuestion(event)">문의하기</button>
            <button type="reset" class="btn btn-primary btn-lg">취소</button>
        </form>
    </div>
	
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	<script>
	function submitQuestion(event){
		event.preventDefault();
		alert("실행");
		const category1 = document.querySelector("select[name='category']");
		const title1 = document.querySelector("Input[name='title']");
		const content1 = document.querySelector("textarea[name='content']");
		const mem_no1 = document.querySelector("Input[name='mem_no']");

		
		const qna = {
				category : category1.value,
				title : title1.value,
				content : content1.value,
				mem_no : mem_no1.value
		}
		console.log("qna"+qna);
		
		const sendData = JSON.stringify(qna);
		console.log("sendData"+sendData);
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.status === 200){
				alert(this.responseText);
				window.location.href="http://localhost:9991/common99"
			} else{
				alert("다시 입력해주세요.");
			}
		};
		xhttp.open("POST", "http://localhost:8888/api/qna-99");
		xhttp.setRequestHeader("Content-type", "application/json");
		xhttp.send(sendData);
		
	}
	</script>
</body>
</html>