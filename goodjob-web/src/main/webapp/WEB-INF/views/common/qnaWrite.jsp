<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 740px;
	margin: 0 auto;
	min-height: 700px;
	background: #fff;
}

.qna-big-title {
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

.tab-btn {
	width: 100%;
	margin-bottom: 50px;
}

.tab-btn ul {
	display: flex;
	justify-content: center;
}

.tab-btn ul button {
	width: 370px;
	height: 45px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
}

#home-tab.active {
    background: #fff;
    color: #333;
    border: 1px solid #333;
    border-bottom: 0;
}

#profile-tab.active {
    background: #fff;
    color: #333;
    border: 1px solid #333;
    border-bottom: 0;
}

#home-tab.inactive {
    color: #999;
    border: 1px solid #ccc;
    background: #fafafa;
    border-bottom: 1px solid #333;
}

#profile-tab.inactive {
    color: #999;
    border: 1px solid #ccc;
    background: #fafafa;
    border-bottom: 1px solid #333;
}

.choice-qna select {
	width: 150px;
	height: 35px;
	border: 1px solid #ccc;
	color: #666;
	font-family: "Pretendard Variable", Pretendard;
}

#qnaWrite {
	padding-left: 20px;
}

#qnaWrite label b {
	display: inline-block;
	width: 160px;
	font-weight: 500;
}

#qnaWrite label b span {
	color: blue;
	font-weight: 400;
	padding-left: 8px;
	font-size: 14px;
}

.title-qna {
	margin: 40px 0;
}

.title-qna input[type="text"] {
	width: 350px;
	height: 40px;
	border: 1px solid #ccc;
	padding-left: 5px;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
}

.content-qna{
	display:flex;
}
.content-qna div:nth-child(1){
	padding-right:5px;
}
.content-qna textarea {
	width: 500px;
	height: 300px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	resize: none;
	padding: 5px;
	font-family: "Pretendard Variable", Pretendard;
}

.write-btn-area{
	text-align:center;
	margin-top:100px;
}
.write-btn-area button{
	padding:15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size:15px;
	cursor:pointer;
	margin:0 10px;
}
.write-btn-area #submitWrite,
.write-btn-area #submitUpdate{
	background:#FB8500;
	border:1px solid #FB8500;
	color:#fff;
}
.write-btn-area .cancel-btn{
	background:#f1f1f1;
	border:1px solid #ccc;
	color:#333;
}

table, tr, th, td{
	border-collapse:collapse;
	border:1px solid #eee;
	border-right:0;
	border-left:0;
	padding:20px;
	text-align:center;
}

#qnaList{
	width:100%;
}
#qnaList .table{
	width:100%;
	margin:0 auto;
	
}
#qnaList .table .listNum{
	width:40px;
	color:#777;
}
#qnaList .table .category{
	width:90px;
	font-size:13px;
	color:#666;
}
#qnaList .table .listRegdate{
	width:85px;
	font-size:13px;
	color:#aaa;
}

.tab-btn ul button.active {
    background: #fff;
    color: #333;
    border: 1px solid #333;
    border-bottom: 0;
}

.tab-btn ul button.inactive {
    color: #999;
    border: 1px solid #ccc;
    background: #fafafa;
    border-bottom: 1px solid #333;
}
.table
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
			<h2 class="qna-big-title">문의 · 신고</h2>
			<div class="tab-btn">
				<ul class="" id="myTab" role="tablist">
					<li class="" role="presentation">
						<button class="" id="home-tab" onclick="show()"
							data-bs-toggle="tab" data-bs-target="#home" type="button"
							role="tab" aria-controls="home" aria-selected="true">문의·신고</button>
					</li>
					<li class="" role="presentation">
						<button class="" id="profile-tab" onclick="getQnaList()"
							data-bs-toggle="tab" data-bs-target="#profile" type="button"
							role="tab" aria-controls="profile" aria-selected="false">문의·신고
							내역</button>
					</li>
				</ul>
			</div>
			<div id="qnaWrite" style="display: block;">
				<form name="frm-qnaForm">
					<div class="choice-qna">
						<label for="category"><b>문의종류<span>(필수)</span></b></label>
						<select id="category" name="category" required>
							<option value="" disabled selected>선택</option>
							<option value="서비스 이용문의">서비스 이용문의</option>
							<option value="불량정보·오류신고">불량정보·오류신고</option>
							<option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
						</select>
					</div>
					<div class="title-qna">
						<label for="title"><b>제목<span>(필수)</span></b></label>
						<input type="text" id="title" class="form-control" name="title" placeholder="제목을 입력해주세요">
					</div>
					<div class="content-qna">
						<div>
							<label for="content"><b>내용<span>(필수)</span></b></label>
						</div>
						<div>
							<textarea id="content" name="content" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
					<div class="write-btn-area">
						<button type="button" id="submitWrite" class=""
							onclick="submitQuestion(event)">문의하기</button>
						<button type="button" id="submitUpdate" class=""
							onclick="submitUpdate(event)">수정하기</button>
						<button type="reset" class="cancel-btn">취소</button>
						<button type="button" id="deleteQna" onclick="deleteQna(event)">삭제하기</button>
					</div>
				</form>
			</div>
			<div id="qnaListContainer" style="display: none;">
				<div id="qnaList"></div>
			</div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

	<script>
		$(document).ready(function() {
			const urlParams = new URLSearchParams(window.location.search);
			let cs_no = urlParams.get('cs_no');
			let test = urlParams.get('test');
			
			var writeForm = $('#submitWrite');
			var modifyForm = $('#submitUpdate');
			var cancelBtn = $(".cancel-btn");
			var deleteQna = $("#deleteQna");
			
			console.log(cs_no);
			if(test){
				getQnaList();
			}
			if (cs_no) {
				modifyContent(cs_no);
				writeForm.hide();
				modifyForm.show();
				cancelBtn.hide();
				deleteQna.show();
			} else {
				writeForm.show();
				modifyForm.hide();
				deleteQna.hide();
				cancelBtn.show();
			}

			// 이벤트 리스너 설정
			$('#submitWrite').on('click', submitQuestion);
			$('#submitUpdate').on('click', submitUpdate);
			$('#deleteQna').on('click', deleteQna);
			// 초기 상태 설정
	        var homeTab = document.getElementById('home-tab');
	        var profileTab = document.getElementById('profile-tab');
	        
	        homeTab.classList.add("active");
	        homeTab.classList.remove("inactive");
	        profileTab.classList.remove("active");
	        profileTab.classList.add("inactive");
	        homeTab.setAttribute('aria-selected', 'true');
	        profileTab.setAttribute('aria-selected', 'false');

		});

		function deleteQna(event){
			alert("삭제");
			const urlParams = new URLSearchParams(window.location.search);
			let cs_no = urlParams.get('cs_no');
			console.log(cs_no);
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				if (this.status === 200) {
					alert(this.responseText);
					window.location.href = "/qna99/qnaWrite?test=1";
				} else {
					alert(this.responseText);
				}
			};
			xhttp.open("DELETE", "http://localhost:8888/api/qna-99?cs_no="+cs_no);
// 			const username = localStorage.getItem("username");
// 			const role = localStorage.getItem("role");
// 			xhttp.setRequestHeader("username", username);
// 			xhttp.setRequestHeader("role", role);
			xhttp.send();
		}
		
		function show() {
			var writeForm = document.getElementById('qnaWrite');
			var qnaList = document.getElementById('qnaListContainer');
			var homeTab = document.getElementById('home-tab');
			var profileTab = document.getElementById('profile-tab');

			writeForm.style.display = 'block';
		    qnaList.style.display = 'none';
		    homeTab.classList.add("active");
		    homeTab.classList.remove("inactive");
		    profileTab.classList.remove("active");
		    profileTab.classList.add("inactive");
		    homeTab.setAttribute('aria-selected', 'true');
		    profileTab.setAttribute('aria-selected', 'false');
		}

		function submitQuestion(event) {
			event.preventDefault();
			const category1 = document.querySelector("select[name='category']");
			const title1 = document.querySelector("Input[name='title']");
			const content1 = document.querySelector("textarea[name='content']");

			if (category1.value === "") {
				alert("카테고리를 선택해주세요.");
				return;
			} else if (title1.value === "") {
				alert("문의 제목을 입력해주세요.");
				title1.focus();
				return;
			} else if (content1.value === "") {
				alert("문의 내용을 입력해주세요.");
				content1.focus();
				return;
			} else {
				const qna = {
					category : category1.value,
					title : title1.value,
					content : content1.value
				}
				console.log("qna", qna);

				const sendData = JSON.stringify(qna);
				console.log("sendData: " + sendData);

				const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
					if (this.status === 200) {
						alert(this.responseText);
						window.location.href = "http://localhost:9991/common99"
					} else {
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
		}

		function getQnaList() {
			const xhttp = new XMLHttpRequest();

			var writeForm = document.getElementById('qnaWrite');
			var qnaList = document.getElementById('qnaListContainer');
			var homeTab = document.getElementById('home-tab');
			var profileTab = document.getElementById('profile-tab');

			writeForm.style.display = 'none';
		    qnaList.style.display = 'block';
		    homeTab.classList.remove("active");
		    homeTab.classList.add("inactive");
		    profileTab.classList.add("active");
		    profileTab.classList.remove("inactive");
		    homeTab.setAttribute('aria-selected', 'false');
		    profileTab.setAttribute('aria-selected', 'true');

			xhttp.onload = function() {
				if (this.readyState == 4 && this.status == 200) {
					const data = JSON.parse(this.responseText);

					let table = '<table class="table"><tr><th scope="col">번호</th><th scope="col">카테고리</th><th scope="col">제목</th><th scope="col">작성일자</th></tr><tbody class="table-group-divider">';

					for (let i = 0; i < data.length; i++) {
						table += '<div class="qna-list-area">';
						table += '<tr>';
						table += '<td class="listNum">' + (i + 1) + '</td>';
						table += '<td class="category">' + data[i].category + '</td>';
						table += '<td><a href="/qna99/qnaDetail?cs_no='
								+ data[i].cs_no + '">' + data[i].title
								+ '</a></td>';
						table += '<td class="listRegdate">' + data[i].reg_date + '</td>';
						table += '</tr>';
						table += '</div>';
					}
					table += '</tbody></table>';

					document.getElementById("qnaList").innerHTML = table;
				} else if (this.readyState == 4 && this.status != 200) {
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

		function loadDetail(cs_no) {
			window.location.href = "/qna99/qnaDetail?cs_no=" + cs_no;
		}

		function modifyContent(cs_no) {
			$.ajax({
				url : "http://localhost:8888/api/qna-99/detail",
				type : "GET",
				data : {
					cs_no : cs_no
				},
				success : function(data) {
					$('#title').val(data.title);
					$('#content').val(data.content);
					$('#category').val(data.category);
				},
				error : function(error) {
					console.log("불러오는데 실패했습니다. 다시 시도해주세요.", error);
				}
			});
		}

		function submitUpdate(event) {
			event.preventDefault();
			const title1 = document.querySelector("input[name='title']");
			const content1 = document.querySelector("textarea[name='content']");
			const category1 = document.querySelector("select[name='category']");

			if (title1.value === "") {
				alert("문의 제목을 입력해주세요.");
				title1.focus();
				return;
			} else if (content1.value === "") {
				alert("문의 내용을 입력해주세요.");
				content1.focus();
				return;
			} else if (category1 === "") {
				alert("카테고리를 선택해주세요");
				category1.focus();
				return;
			} else {
				const urlParams = new URLSearchParams(window.location.search);
				let cs_no = urlParams.get('cs_no');
				const qna = {
					cs_no : cs_no,
					title : title1.value,
					content : content1.value,
					category : category1.value
				}
				const sendData = JSON.stringify(qna);
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
					if (this.status === 200) {
						alert(this.responseText);
						window.location.href = "/qna99/qnaDetail";
						// getQnaList(); // 필요한 경우 이 줄의 주석을 제거합니다.
					} else {
						alert("다시 입력해주세요.");
					}
				};
				xhttp.open("PUT", "http://localhost:8888/api/qna-99/modify");
				xhttp.setRequestHeader("Content-type", "application/json");
				const username = localStorage.getItem("username");
				xhttp.setRequestHeader("username", username);
				xhttp.send(sendData);
			}
		}
	</script>
</body>
</html>
