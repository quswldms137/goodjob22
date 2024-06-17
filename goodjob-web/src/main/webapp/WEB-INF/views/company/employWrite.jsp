<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
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
			<c:if test="${recruit.recruit_no == null}">
				<h2 class="h2">채용공고 작성</h2>
			</c:if>
			<c:if test="${recruit.recruit_no != null}">
				<h2 class="h2">채용공고 수정</h2>
			</c:if>
			<form name="frm">
				<div class="title">
					<input type="hidden" name="recruit_no" value="${recruit_no }">
					<p>제목</p>
					<input type="text" name="title" placeholder="채용공고의 제목을 입력하세요."><br>
				</div>
				<div class="recruit_intro">
					<p>상세요강</p>
					<input type="text" name="recruit_intro"
						placeholder="채용공고의 상세요강을 입력하세요.">
				</div>
				<div class="qualification">
					<p>자격요건</p>
					<input type="text" name="qualification" placeholder="자격요건">
				</div>
				<div class="career">
					<p>경력</p>
					<input type="text" name="career" placeholder="경력">
				</div>
				<div class="education">
					<p>학력</p>
					<input type="text" name="education" placeholder="학력">
				</div>
				<div class="sk_name">
					<p>우대사항(보유스킬)</p>
				    <input type="text" id="skillSearch" placeholder="Search for a skill..." oninput="searchSkills()">
				    <ul id="searchResults"></ul>
				    <div class="skill-container" id="addedSkills"></div>
				</div>
				<div class="p_number">
					<p>모집인원</p>
					<input type="number" name="p_number" placeholder="모집인원">
				</div>
				<div class="field">
					<p>고용형태</p>
					<select id="field" onchange="changeField()">
						<option>고용형태를 선택해주세요.</option>
						<option value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="인턴">인턴</option>
						<option value="파견직">파견직</option>
						<option value="아르바이트">아르바이트</option>
						<option value="교육생">교육생</option>
					</select>
					<input type="hidden" name="field">
				</div>
				<div class="rank">
					<p>직급</p>
					<input type="text" name="rank" placeholder="직급">
				</div>
				<div class="pay">
					<p>급여</p>
					<input type="number" name="pay" placeholder="급여">
				</div>
				<div class="location">
					<p>지역</p>
					<input type="text" name="location" placeholder="근무지역">
				</div>
				<div class="working_time">
					<p>근무시간</p>
					<input type="text" name="working_time" placeholder="근무시간">
				</div>
				<div class="welfares">
					<p> 복지</p>
					<input type="text" name="welfare" placeholder="복지">
				</div>
				<div class="seprocedure">
					<p>전형절차</p>
					<input type="text" name="seprocedure" placeholder="전형절차">
				</div>
				<div class="notice">
					<p>유의사항</p>
					<input type="text" name="notice" placeholder="유의사항을 입력하세요.">
				</div>
				<div class="deadline_date">
					<p>공고마감일</p>
					<input type="date" name="deadline_date">
				</div>
				<div><button type="button" onclick="return recruitWrite()">등록</button> <button type="button" onclick="cancel()">취소</button></div>
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
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
		$(document).ready(function() {
			console.log(`${recruit_no}`);
			const log = document.querySelector("input[name='recruit_no']");
			console.log(log);
		})
		
		function changeField(){
			const selectElement = document.querySelector("#field");
			const fieldElement = document.querySelector("input[name='field']");
			fieldElement.value = selectElement.value;
		}
		
		function cancel(){
			window.location.href = "/company/employManage";
		}
		
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
				com_no : "1",
				username : "samsung",
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
			}
			xhttp.open("POST", "http://localhost:8888/api/company/employWrite");
			xhttp.setRequestHeader("Content-type", "application/json")
			xhttp.send(data);
			console.log(data);
		}
		
		function recruitUpdate(){
			
		}
	</script>
</body>
</html>