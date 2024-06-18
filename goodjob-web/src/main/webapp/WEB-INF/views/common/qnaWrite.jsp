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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}
#blue {
	color:blue;
}
main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #eee;
	border-radius: 5px;
	box-sizing: border-box;
	background: #fff;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
	<div class="sidebar-container">
		<%@ include file="../front/common-sidebar-all.jsp"%>
	</div>
	<div id="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link active" id="home-tab" onclick="show()" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">문의·신고</button>
	 	</li>
	 	<li class="nav-item" role="presentation">
	   		<button class="nav-link" id="profile-tab" onclick="getQnaList()" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">문의·신고 내역</button>
	 	</li>
	</ul>
	<div id="qnaWrite" style="display: block;">
       <form name="frm-qnaForm">
           <div class="form-group">
               <label for="category">문의종류 <span id="blue">(필수)</span></label>
               <select class="form-control" id="category" name="category" required>
                   <option value="" disabled selected>선택</option>
                   <option value="서비스 이용문의">서비스 이용문의</option>
                   <option value="불량정보·오류신고">불량정보·오류신고</option>
                   <option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
               </select>
           </div>
           <div class="mb-3">
		  <label for="title" class="form-label">제목 <span id="blue">(필수)</span></label>
		  <input type="text" id="title" class="form-control" name="title" placeholder="제목을 입력해주세요">
		</div>
		<div class="mb-3">
		  <label for="content" class="form-label">내용 <span id="blue">(필수)</span></label>
		  <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력해주세요"></textarea>
		</div>
           <div id="writeSubmit" style="display:block;"><button type="submit" id="submit" class="btn btn-primary btn-lg" onclick="submitQuestion(event)">문의하기</button></div>
           <div id="modifySubmit" style="display:none;"><button type="submit" id="submit" class="btn btn-primary btn-lg" onclick="submitUpdate(event)">수정하기</button></div>
           <button type="reset" class="btn btn-primary btn-lg">취소</button>
       </form>
	</div>
	<!-- 작성폼 끝 -->
	<div class="tab-content" id="qnaListContainer" style="display: none;">
	
	 <!-- 반복구간 -->
	 <div id="qnaList"></div>
		 
	</div>
    </div><!-- 컨테이너 종료 -->
	
	
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let cs_no = urlParams.get('cs_no');
		var writeForm = document.getElementById('writeSubmit');
		var modifyForm = document.getElementById('modifySubmit');
		
		if(cs_no){
			modifyContent(cs_no);
			$('#writeForm').hide();
			$('#modifyForm').show();
		}
		
	});
	
	function modifyContent(cs_no){
		$.ajax({
			url: "http://localhost:8888/api/qna-99/detail",
			type: "GET",
			data: {
				cs_no : cs_no
			},
			success: function(data){
				$('#title').val(data.title);
				$('#content').html(data.content);
				$('#category').val(data.category);
				$('#submit').text('수정하기');
			},
			error: function(error){
				console.log("불러오는데 실패했습니다. 다시 시도해주세요.",error);
			}
		});
	}
	
	function submitUpdate(event){
		alert("수정!");
		event.preventDefault();
		const category1 = document.querySelector("select[name='category']");
		const title1 = document.querySelector("Input[name='title']");
		const content1 = document.querySelector("textarea[name='content']");
		
		const qna = {
				category : category1.value,
				title : title1.value,
				content : content1.value
		}
		console.log("qna: "+qna);
		
		const sendData = JSON.stringify(qna);
		console.log("sendData"+sendData);
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.status === 200){
				alert(this.responseText);
				//getQnaList();
			} else{
				alert("다시 입력해주세요.");
			}
		};
		xhttp.open("POST", "http://localhost:8888/api/qna-99/modify");
		xhttp.setRequestHeader("Content-type", "application/json");
		
		const username = localStorage.getItem("username");
    	xhttp.setRequestHeader("username", username);
		
		xhttp.send(sendData);
		
	}
	
	function show(){
		var writeForm = document.getElementById('qnaWrite');
		var qnaList = document.getElementById('qnaListContainer');
		var homeTab = document.getElementById('home-tab');
		var profileTab = document.getElementById('profile-tab');
		
		writeForm.style.display = 'block';
		qnaList.style.display = 'none';
		homeTab.classList.add("active");
		profileTab.classList.remove("active");
		homeTab.setAttribute('aria-selected', 'true');
		profileTab.setAttribute('aria-selected', 'false');
		
	}
	
	function submitQuestion(event){
		event.preventDefault();
		const category1 = document.querySelector("select[name='category']");
		const title1 = document.querySelector("Input[name='title']");
		const content1 = document.querySelector("textarea[name='content']");
		
		const qna = {
				category : category1.value,
				title : title1.value,
				content : content1.value
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
		xhttp.open("POST", "http://localhost:8888/api/qna-99/insert");
		xhttp.setRequestHeader("Content-type", "application/json");
		
		const username = localStorage.getItem("username");
    	const role = localStorage.getItem("role");

    	xhttp.setRequestHeader("username", username);
		xhttp.setRequestHeader("role", role);
		
		xhttp.send(sendData);
		
	}
	
	function getQnaList(){
		const xhttp = new XMLHttpRequest();
		
		var writeForm = document.getElementById('qnaWrite');
		var qnaList = document.getElementById('qnaListContainer');
		var homeTab = document.getElementById('home-tab');
		var profileTab = document.getElementById('profile-tab');
		
		writeForm.style.display = 'none';
		qnaList.style.display = 'block';
		homeTab.classList.remove("active");
		profileTab.classList.add("active");
		homeTab.setAttribute('aria-selected', 'false');
		profileTab.setAttribute('aria-selected', 'true');
		
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				
				let table = '<table class="table"><tr><th scope="col">번호</th><th scope="col">카테고리</th><th scope="col">제목</th><th scope="col">작성일자</th></tr><tbody class="table-group-divider">';
				
				for(let i = 0 ; i < data.length ; i++){
					table += '<tr>';
					table += '<td>' + (i+1) + '</td>';
					table += '<td>' + data[i].category + '</td>';
					table += '<td><a href="/qna99/qnaDetail?cs_no='+data[i].cs_no + '">' + data[i].title + '</a></td>';
					table += '<td>' + data[i].reg_date + '</td>';
					table += '</tr>';
				}
				table += '</tbody></table>';
				
				document.getElementById("qnaList").innerHTML = table;
			} else if (this.readyState == 4 && this.status != 200){
				alert("목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		
		const username = localStorage.getItem("username");
    	const role = localStorage.getItem("role");

    	xhttp.open("GET", "http://localhost:8888/api/qna-99/list");
		xhttp.setRequestHeader("username", username);
		xhttp.setRequestHeader("role", role);
		xhttp.send();
		
	}
	
	function loadDetail(cs_no){
		window.location.href="/qna99/qnaDetail?cs_no="+cs_no;
	}

	</script>
</body>
</html>