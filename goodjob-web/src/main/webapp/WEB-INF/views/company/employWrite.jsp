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
				<h2 class="h2">채용공고 작성</h2>
			</c:if>
			<form>
				<div>
					<input type="hidden" name="recruit_no" value="${recruit_no }">
					<p>제목</p>
					<input type="text" name="title" placeholder="채용공고의 제목을 입력하세요."><br>
				</div>
				<div>
					<p>상세요강</p>
					<input type="text" name="recruit_intro"
						placeholder="채용공고의 상세요강을 입력하세요.">
				</div>
				<div>
					<p>자격요건</p>
					<input type="text" name="" placeholder="">
				</div>
				<div>
					<p>경력 <button onclick="addCareer()">추가</button></p>

				</div>
				<div>
					<p>학력 <button onclick="addEducation()">추가</button></p>

				</div>
				<div>
					<p>모집인원</p>
					<input type="number" name="p_number" placeholder="모집인원">
				</div>
				<div>
					<p>고용형태</p>
					<select name="field">
						<option name="" value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="인턴">인턴</option>
						<option value="파견직">파견직</option>
						<option value="아르바이트">아르바이트</option>
						<option value="교육생">교육생</option>
					</select>
				</div>
				<div>
					<p>직급</p>
					<input type="text" name="rank" placeholder="직급">
				</div>
				<div>
					<p>급여</p>
					<input type="number" name="pay" placeholder="급여">
				</div>
				<div>
					<p>지역</p>
					<input type="text" name="location" placeholder="근무지역">
				</div>
				<div>
					<p>근무시간</p>
					<input type="text" name="working_time" placeholder="근무시간">
				</div>
				<div>
					<p> 복지 <button onclick="addWelfare()">추가</button></p>

				</div>
				<div>
					<p>전형절차</p>
					<input type="text" name="seprocedure" placeholder="전형절차">
				</div>
				<div>
					<p>유의사항</p>
					<input type="text" name="notice" placeholder="유의사항을 입력하세요.">
				</div>
				<div>
					<p>공고마감일</p>
					<input type="date" name="deadline_date">
				</div>
				<div><button onclick="recrueitWrite()"></button></div>
			</form>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script>
		$(document).ready(function() {
			console.log(`${recruit_no}`);
			const log = document.querySelector("input[name='recruit_no']");
			console.log(log);
		})
	</script>
</body>
</html>