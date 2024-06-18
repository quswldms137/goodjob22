<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상세정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/static/css/resumeWrite.css">
<style>
body{
	background:#f4f4f9;
}

#sidebar{
	background:#fff;
}

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	margin:0 auto;
	background:#fff;
	box-sizing: border-box;
	border-radius:5px;
	padding-top:50px;
}

.company-nav ul li:nth-child(2) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}


.companyInfoForm {
	width:600px;
	margin:0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	box-sizing:border-box;
}

.companyInfoForm label {
	display: block;
	margin-top: 15px;
	font-weight: bold;
}

.companyInfoForm input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.companyInfoForm input[type="text"]:focus {
	border-color: #007bff;
	outline: none;
}

.companyphoto {
	text-align: center;
	border: 1px solid #eee;
	border-top: 0;
	padding: 8.9px 0;
	font-size: 14px;
	background: #f7f7f7;
}

.photolabel .photoFrame-box {
	width: 100%;
	height: 200px;
	border: 1px solid #eee;
	box-sizing:border-box;
}

<!--버튼style -->
.submit_btn {
	text-align: center;
	margin: 80px 0;
}

input[type="submit"] {
	width: 160px;
	color: #fff;
	background: #323743;
	padding: 15px 0;
	border: 0;
	font-size: 18px;
	cursor: pointer;
}

input[type="button"] {
	width: 160px;
	color: #323743;
	background: #fff;
	border: 1px solid #323743;
	padding: 15px 0;
	font-size: 18px;
	cursor: pointer;
}
</style>


</head>
<body>

	<header>
		<%@ include file="../front/company-header.jsp"%>
	</header>
	<!-- 메인 내용 -->
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<form name="frm" id="companyinfo" enctype="multipart/form-data">

				<!-- 기업 정보 -->
				<div class="companyInfoForm">
					<!-- 기업사진 -->
					<div class="personal_info_photo">
						<label for="photo" class="photolabel">
							<div class="photoFrame-box">
								<img id="photoFrame" title="photo" width="800" height="200"
									src="" alt="Photo Preview" style="visibility: hidden;">
							</div> <input type="file" class="file" id="photo" name="img_url"
							accept="image/*" onchange="previewImage(event)">
							<p class="companyphoto">기업사진 추가 +</p>
						</label>
					</div>

					<label>기업소개</label>
					<input type="text" name="introduction"placeholder="기업소개..">
					
					<label>연금/보험</label> <input type="text"name="pension" placeholder="연금/보험..">
					<label>업종</label>
					<input type="text" name="sectors" placeholder="업종..">
					<label>연혁</label>
					<input type="text" name="history" placeholder="연혁..">
					<label>인재상</label>
					<input type="text" name="ideal_talent" placeholder="인재상..">
					<label>설립연도</label>
					<div style="width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;">
					<input type="date" name="foundation">
					</div>
					<label>사원수</label>
					<input type="text" name="amount"placeholder="사원수..">
					<label>사이트주소입력</label>
					<input type="text" name="url" placeholder="주소입력..">
				</div>

				<div class="submit_btn">
					<input type="submit" value="저장" onclick="submitForm(event)">
					<input type="button" value="취소" class="cancel-btn">
				</div>

			</form>
		</div>
	</main>
	<!-- 여기까지 -->


	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>


	<script>
		//취소버튼 클릭시 페이지 리셋
		$('.cancel-btn').on('click', function(){
			alert("취소하였습니다!!");
			window.location = "/company/info";
		});
		
		
		//기업정보 등록
		$(document).ready(function() {
			
			const username = localStorage.getItem("username");
			
			$.ajax({
				
				url : 'http://localhost:8888/api/company/info/detail/' + username,
				method : "GET",
				dataType : "text",
				success : function(response){
					if(response === "이미 기정정보가 존재합니다 수정페이지로 이동합니다!!"){
						alert(response);
						location.href="/company/infoModify";
					}
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
			$("#companyinfo").submit(function(event) {
				event.preventDefault();

				var formData = new FormData(this);
				const username = localStorage.getItem("username");
				//const com_no = localStorage.getItem("com_no");
				console.log(formData);

				$.ajax({

					type : 'POST',
					beforeSend: function(xhr) {
				        xhr.setRequestHeader('username', username);
				        
				    },
					url : 'http://localhost:8888/api/company/info',
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						alert('기업정보가 등록되었습니다!!');
						window.location = "/company";//어디로보낼지 고민좀 해보자잉
					},
					error : function(error) {
						alert('기업정보 등록에 실패하였습니다!!!');
						console.error('Error');
					}

				});
			});
		});

		function previewImage(event) {
			var input = event.target;
			var file = input.files[0];
			var reader = new FileReader();

			reader.onload = function() {
				var dataURL = reader.result;
				var photoFrame = document.getElementById('photoFrame');
				photoFrame.src = dataURL;
				photoFrame.style.visibility = 'visible'; // 미리보기 이미지 표시
			};

			if (file) {
				reader.readAsDataURL(file);
			}
		}

		/*
		function submitForm(event){
			
			var input = event.target;
			var file = input.files[0];
			
			console.log(file);
			return false;
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				
			}
			xhr.open("POST", "http://localhost:8888/api/company/info", true);
			xhr.setRequestHeader("Content-type", "application/json");
			xhr.send(data);
		}
		 */
 
		 
		 
		 
	</script>

</body>
</html>