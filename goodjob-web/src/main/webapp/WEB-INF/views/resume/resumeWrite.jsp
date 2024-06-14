<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이력서 등록</title>
<link rel="stylesheet" href="/static/css/resumeWrite.css">
<style>

</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<section>
		<h1>이력서 등록</h1>
		<div class="container">
			<!--------------------이력서 등록--------------------->

			<form name="frm" id="resumeForm" enctype="multipart/form-data">
				<div class="title">
					<input type="text" name="title" placeholder="이력서 제목, 한줄소개">
				</div>

				<!-- 인적사항 -->
				<p class="personal_info_title">인적사항</p>
				<div class="personal_info">
					<div class="personal_info_content">
						<input type="text" name="username" placeholder="이름">
						<input type="text" name="mem_birth" placeholder="ex) 1994-01-03">
						<select name="mem_gender">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select> 
						<input type="text" name="mem_email" placeholder="이메일">
						<input type="text" name="mem_tel" placeholder="휴대폰번호">
						<select	name="military">
							<option value="1">군필</option>
							<option value="2">미필</option>
							<option value="3">면제</option>
							<option value="4">해당없음</option>
						</select> 
						<input type="text" name="mem_addr" placeholder="주소">
					</div>
					<div class="personal_info_photo">
						<label for="photo" class="photolabel">
							<div class="photoFrame-box">
								<img id="photoFrame" title="photo" width="110" height="132" src="" alt="Photo Preview" style="visibility: hidden;">
							</div>
							<input type="file" class="file" id="photo" name="imgFile" accept="image/*" onchange="previewImage(event)">
							<p class="photoadd">사진 추가 + </p>
						</label>
					</div>
				</div>

				<!-- 학력 -->
				<p class="personal_info_title">학력</p>
				<div class="education">
					<input type="text" name="school" placeholder="학교이름">
					<input type="text" name="major" placeholder="전공">
					<span class="admissiondate-text">입학일</span>
					<input type="date" name="edu_join_date">
					<span class="graduatedate-text">졸업일</span>
					<input type="date" name="edu_gra_date">
					<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
					<select name="graduation">
						<option value="재학중">재학중</option>
						<option value="휴학">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="졸업/졸업예정">졸업/졸업예정</option>
						<option value="수료">수료</option>
					</select>
					<input type="text" name="grades" placeholder="학점">
				</div>

				<!-- 희망근무지역 -->
				<p class="personal_info_title">희망 근무 지역</p>
				<div class="desiredArea">
					<input type="text" name="hope_city" placeholder="희망 지역">
				</div>

				<!-- 희망 직무 -->
				<p class="personal_info_title">희망 직무</p>
				<div class="desiredIndustry">
					<input type="text" name="hope_job" placeholder="희망 직무">
				</div>

				<!-- 희망 연봉 -->
				<p class="personal_info_title">희망 연봉</p>
				<div class="desiredpay">
					<input type="text" name="hope_pay" placeholder="희망연봉 (만원)">
				</div>

				<!-- 경력 -->
				<p class="personal_info_title">경력</p>
				<div class="career">
					<div class="career_in">
						<input type="text" name="company" placeholder="회사명">
						<span class="cardate_text">입사일</span>
						<input type="date" name="car_join_date">
						<span class="enddate_text">퇴사일</span>
						<input type="date" name="quit_date">
					</div>
					<div class="career_in">
						<textarea name="main_part" cols="80" placeholder="담당업무"></textarea>
					</div>
				</div>

				<!-- 기술 스택 -->
				<p class="personal_info_title">기술 스택</p>
				<div class="resumeSkill">
					<div class="skillContainer">
						<input type="text" name="sk_name" placeholder="ex) java">
					</div>
					<button type="button" class="addResumeSkill" onclick="addSkill()">+</button>
				</div>

				<!-- 자격증 -->
				<p class="personal_info_title">자격증</p>
				<div class="certificate">
					<div>
						<input type="text" name="licence_name" placeholder="자격증 명">
						<input type="text" name="agency" placeholder="발급처">
						<span class="certificate-text">취득일</span>
						<input type="date" name="get_date">
					</div>
				</div>

				<!-- 포트폴리오 주소 -->
				<p class="personal_info_title">포트폴리오 주소</p>
				<div class="portfolio-link">
					<div>
						<input type="text" name="port_url">
					</div>
				</div>


				<!-- 기타 첨부자료 -->
				<p class="personal_info_title">기타 첨부자료</p>
				<div class="other-data">
					<div class="other-data-container">
						<input type="file" name="etc_name">
					</div>
					<button type="button" class="addOther-data" onclick="addData()">+</button>
				</div>


				<!-- 자기 소개서 -->
				<p class="personal_info_title">자기 소개서</p>
				<div class="coverLetter" id="resumeForm">
					<div>
						<p class="personal_info_title">성장 과정</p>
						<textarea name="growth" placeholder="항목 내용을 입력해주세요."></textarea>
						<p class="personal_info_title">지원 동기</p>
						<textarea name="motive" placeholder="항목 내용을 입력해주세요."></textarea>
						<p class="personal_info_title">성격의 장단점</p>
						<textarea name="personality" placeholder="항목 내용을 입력해주세요."></textarea>
					</div>
				</div>

				<div class="submit_btn">
					<input type="submit" value="등록">
					<input type="button" value="취소">
				</div>
			</form>
		</div>
		<div id="demo"></div>

	</section>
	<footer> </footer>
	<script>
	
	document.getElementById('resumeForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form from submitting the traditional way
        
        // Create a FormData object from the form
        const formData = new FormData(this);
        
        // Convert FormData to a plain object
        const formObject = {};
        formData.forEach((value, key) => {
            formObject[key] = value;
        });

        // Convert formObject to JSON
        const jsonData = JSON.stringify(formObject);

        // Send the JSON data using fetch
        fetch('http://localhost:8888/api/resume/write', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            alert("등록 완료!");
            //window.location.href = "resume/resumeManage";
            document.getElementById("demo").innerHTML = jsonData;
        })
        .catch((error) => {
            console.error('Error:', error);
        });
    });
	
	
	
	/* 스킬 추가 버튼 */
		addbtn = document.querySelector(".addResumeSkill");
		function addSkill() {
			// Create a new input element
			const newInput = document.createElement("input");
			// Set the attributes for the new input
			newInput.setAttribute("type", "text");
			newInput.setAttribute("name", "resumeSkill");
			newInput.setAttribute("placeholder", "ex) java");
			// Append the new input to the skill container
			const skillContainer = document.querySelector(".skillContainer");
			skillContainer.appendChild(newInput);
		}
		
		/* 기타첨부자료 추가 버튼 */
		addbtn = document.querySelector(".addOther-data");
		function addData() {
			// Create a new input element
			const newInput = document.createElement("input");
			// Set the attributes for the new input
			newInput.setAttribute("type", "file");
			newInput.setAttribute("name", "resumeSkill");
			newInput.setAttribute("placeholder", "ex) java");
			// Append the new input to the skill container
			const skillContainer = document.querySelector(".other-data-container");
			skillContainer.appendChild(newInput);
		}
		
		   
		   
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
		
	</script>
</body>
</html>