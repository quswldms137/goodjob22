<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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

#detail{
	width:100%;
	margin:0 auto;
}
#detail .category{
	display:inline-block;
	font-size:12px;
	padding:5px 10px;
	border:1px solid #FB8500;
	border-radius:5px;
	color:#FB8500;
}
#detail .title{
	font-size:22px;
	border-bottom:1px solid #eee;
	margin-bottom:10px;
	padding:10px 0;
	display:flex;
	justify-content:space-between;
	align-items:center;
}
#detail .title span{
	font-size:14px;
	color:#aaa;
}
#detail .content{
	min-height:350px;
	border-bottom:1px solid #ccc;
	padding:10px;
	box-sizing:border-box;
}

.doModify{
	text-align:right;
	margin-top:20px;
}
.doModify a{
	padding:10px 20px;
	color:#fff;
	background:#FB8500;
	border:1px solid #FB8500;
	border-radius:5px;
	font-size:14px;
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
			<h2 class="qna-big-title">문의 · 신고</h2>
			<div class="tab-btn">
				<ul class="" id="myTab" role="tablist">
					<li class="" role="presentation">
						<button class="" id="home-tab" onclick="qnaWrite()"
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
			<div id="detail"></div>
			
			<div class="doModify">
				<a href="#">돌아가기</a>
				<a href="/qna99/qnaWrite">수정하기</a>
			</div>
		</div>
		<!-- 문의 상세내용 -->
		<div id="answer" style="display: none;">
			<input type="text" name="answer"><br>
		</div>

	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

	<script>
	
		function qnaWrite(){
			
			window.location = "/qna99/qnaWrite";
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

		$(document).ready(function() {
			const urlParams = new URLSearchParams(window.location.search);
			let cs_no = urlParams.get('cs_no');
			const username = localStorage.getItem("username");
			console.log(username);
			const role = localStorage.getItem("role");
			console.log(role);

			if (cs_no) {
				$('a[href="/qna99/qnaWrite"]').attr('href', function() {
					return '/qna99/qnaWrite?cs_no=' + cs_no;
				});

			}

			function getQnaDetail(cs_no) {
				$.ajax({
					url : "http://localhost:8888/api/qna-99/detail",
					type : "GET",
					data : {
						cs_no : cs_no
					},
					success : function(data) {
						let detail = '<div class="category">' + data.category + '</div>';
						detail += '<div class="title">' + data.title;
						detail += '<span>'+ data.reg_date +'</span>';
						detail += '</div>'
						detail += '<div class="content">' + data.content + '</div>';

						$('#detail').html(detail);

					},
					error : function(error) {
						alert("불러오는데 실패했습니다. 다시 시도해주세요.", error);
						console.log(data);
					}
				});
			}

			if (cs_no) {
				getQnaDetail(cs_no);
				console.log(cs_no);
			} else {
				alert("불러오는데 실패했습니다. 다시 시도해주세요.");
			}
			
			// 초기 상태 설정
	        var homeTab = document.getElementById('home-tab');
	        var profileTab = document.getElementById('profile-tab');
	        
	        homeTab.classList.add("inactive");
	        homeTab.classList.remove("active");
	        profileTab.classList.remove("inactive");
	        profileTab.classList.add("active");
	        homeTab.setAttribute('aria-selected', 'true');
	        profileTab.setAttribute('aria-selected', 'false');
			
		});
	</script>
</body>
</html>