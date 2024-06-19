<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<title>채용공고 작성</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	padding: 20px;
}

.company-nav ul li:nth-child(2) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

.skill-container {
	margin-top: 5px;
}
.skill {
	display: inline-block;
	margin: 5px;
	padding: 5px 10px;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 5px;
}
.remove-skill {
	margin-left: 10px;
	color: red;
	cursor: pointer;
}
#searchResults {
	list-style-type: none;
	padding: 0;
	margin: 0;
	position: absolute;
	background-color: white;
	border: 1px solid #ccc;
	width: 200px; /* Adjust based on your needs */
}
#searchResults li {
	padding: 5px;
	cursor: pointer;
}
#searchResults li:hover {
	background-color: #f0f0f0;
}
.h1 {
	text-align: center;
	margin: 50px 0 60px;
}
.title input[type="text"] {
	align-content: center;
	width: 95%;
	height: 45px;
	font-size: 19px;
	padding-left: 10px;
}
.section-title {
	font-size: 20px;
	margin-top: 20px;
	font-weight: bold;
}
.form-group {
	margin-bottom: 15px;
}
.form-group p {
	margin: 5px 0;
}
.form-group input[type="text"],
.form-group input[type="number"],
.form-group input[type="date"],
.form-group select {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}
.btn {
	background-color: orange;
	border-color: white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	transition: background-color 0.2s ease;
	padding: auto;
	margin-left: 30px;
}
.btn:hover {
	background-color: skyblue;
}
#btn-group {
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/company-header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<h1 class="h1">채용공고 작성</h1>
			<form name="frm">
				<div class="title form-group">
					<input type="hidden" name="recruit_no" value="${recruit_no }">
					<p>제목</p>
					<input type="text" name="title" placeholder="채용공고의 제목을 입력하세요."><br>
				</div>
				
				<div class="section-title">지원자격</div>
				<div class="qualification form-group">
					<p>자격요건</p>
					<input type="text" name="qualification" placeholder="자격요건">
				</div>
				<div class="career form-group">
					<p>경력</p>
					<input type="text" name="career" placeholder="경력">
				</div>
				<div class="education form-group">
					<p>학력</p>
					<input type="text" name="education" placeholder="학력">
				</div>
				<div class="sk_name form-group">
					<p>우대사항(보유스킬)</p>
				    <input type="text" id="skillSearch" placeholder="Search for a skill..." oninput="searchSkills()">
				    <ul id="searchResults"></ul>
				    <div class="skill-container" id="addedSkills"></div>
				</div>

				<div class="section-title">근무조건</div>
				<div class="p_number form-group">
					<p>모집인원</p>
					<input type="number" name="p_number" placeholder="모집인원">
				</div>
				<div class="field form-group">
					<p>고용형태</p>
					<select id="field" onchange="changeField()">
						<option>고용형태를 선택해주세요.</option>
						<option id="field1" value="정규직">정규직</option>
						<option id="field2" value="계약직">계약직</option>
						<option id="field3" value="인턴">인턴</option>
						<option id="field4" value="파견직">파견직</option>
						<option id="field5" value="아르바이트">아르바이트</option>
						<option id="field6" value="교육생">교육생</option>
					</select>
					<input type="hidden" name="field">
				</div>
				<div class="rank form-group">
					<p>직급</p>
					<input type="text" name="rank" placeholder="직급">
				</div>
				<div class="pay form-group">
					<p>급여</p>
					<input type="number" name="pay" placeholder="급여">
				</div>
				<div class="location form-group">
					<p>지역</p>
					<input type="text" name="location" placeholder="근무지역">
				</div>
				<div class="working_time form-group">
					<p>근무시간</p>
					<input type="text" name="working_time" placeholder="근무시간">
				</div>
				<div class="welfares form-group">
					<p>복지</p>
					<input type="text" name="welfare" placeholder="복지">
				</div>

				<div class="section-title">기타</div>
				<div class="recruit_intro form-group">
					<p>상세요강</p>
					<input type="text" name="recruit_intro" placeholder="채용공고의 상세요강을 입력하세요.">
				</div>
				<div class="seprocedure form-group">
					<p>전형절차</p>
					<input type="text" name="seprocedure" placeholder="전형절차">
				</div>
				<div class="notice form-group">
					<p>유의사항</p>
					<input type="text" name="notice" placeholder="유의사항을 입력하세요.">
				</div>
				<div class="deadline_date form-group">
					<p>공고마감일</p>
					<input type="date" name="deadline_date">
				</div>
				
				<div class="form-group" id="btn-group">
					<button type="button" class="btn" onclick="return recruitWrite()">등록</button> 
					<button type="button" class="btn" onclick="cancel()">취소</button>
				</div>
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
		
		// 미리 변수 생성후 페이지 로드후 ajax 통신해서 com_no를 변수에 저장
		let com_no1;
		
		$(document).ready(function(){
			
			const username = localStorage.getItem("username");
			console.log(`${recruit_no}`);
			const log = document.querySelector("input[name='recruit_no']");
			console.log(log);
			
			$.ajax({
				url : "http://localhost:8888/api/company/employWrite?username=" + username,
				method : "GET",
				dataType : "text",
				success : function(response){
					com_no1 = response;
					console.log(com_no1);
				},
				error : function(xhr, status, error){
					
				}
				
			});
			
		})
		
		// ChatGPT 사용 ---------------------------
		const skills = ['JavaScript', 'Java', 'Python', 'C++', 'Ruby', 'PHP', 'Swift', 'Kotlin', 'Go', 'Rust'];
		
		function searchSkills() {
            const query = document.getElementById('skillSearch').value.toLowerCase();
            const results = skills.filter(skill => skill.toLowerCase().includes(query));
            const searchResults = document.getElementById('searchResults');
            searchResults.innerHTML = '';
            results.forEach(skill => {
                const li = document.createElement('li');
                li.textContent = skill;
                li.onclick = () => addSkill(skill);
                searchResults.appendChild(li);
            });
        }
		
		function addSkill(skill) {
            const addedSkills = document.getElementById('addedSkills');
            const skillDiv = document.createElement('div');
            skillDiv.className = 'skill';
            skillDiv.textContent = skill;

            const removeBtn = document.createElement('span');
            removeBtn.className = 'remove-skill';
            removeBtn.textContent = 'x';
            removeBtn.onclick = () => removeSkill(skillDiv);

            skillDiv.appendChild(removeBtn);
            addedSkills.appendChild(skillDiv);

            document.getElementById('searchResults').innerHTML = '';
            document.getElementById('skillSearch').value = '';
        }
		
		function removeSkill(skillDiv) {
            const addedSkills = document.getElementById('addedSkills');
            addedSkills.removeChild(skillDiv);
        }
		// -----------------------------------
		// select 에서 값이 바뀌면 값을 바꿔주는 용도
		function changeField(){
			const selectElement = document.querySelector("#field");
			const fieldElement = document.querySelector("input[name='field']");
			fieldElement.value = selectElement.value;
		}
		// 취소 버튼 (전체 채용공고 관리 페이지로 이동)
		function cancel(){
			window.location.href = "/company/employManage";
		}
		// 채용공고 작성 버튼 클릭 - 채용공고를 등록
		function recruitWrite(){
			const xhttp = new XMLHttpRequest();
			const skills = document.querySelectorAll(".skill");
			const skill = new Array();
			console.log(skills);
			skills.forEach(item =>{
				skill.push(item.innerText.substring(0, item.innerText.length-1));
			})
			
			console.log(skill);
			const data = JSON.stringify({
				com_no : com_no1,
				career : document.querySelector("input[name='career']").value,
				education : document.querySelector("input[name='education']").value,
				field : document.querySelector("input[name='field']").value,
				pay : document.querySelector("input[name='pay']").value,
				location : document.querySelector("input[name=location]").value,
				working_time : document.querySelector("input[name='working_time']").value,
				rank : document.querySelector("input[name='rank']").value,
				title : document.querySelector("input[name='title']").value,
				qualification : document.querySelector("input[name='qualification']").value,
				welfare : document.querySelector("input[name='welfare']").value,
				seprocedure : document.querySelector("input[name='seprocedure']").value,
				notice : document.querySelector("input[name='notice']").value,
				deadline_date : document.querySelector("input[name='deadline_date']").value,
				p_number : document.querySelector("input[name='p_number']").value,
				recruit_intro : document.querySelector("input[name='recruit_intro']").value,
				skill : skill
			});
			//const data2 = JSON
			xhttp.onload = function(){
				alert(this.responseText);
				location.href = "/company/employManage";
			}
			xhttp.open("POST", "http://localhost:8888/api/company/employWrite");
			xhttp.setRequestHeader("Content-type", "application/json")
			xhttp.send(data);
			console.log(data);
		}
		
		
	</script>
</body>
</html>
