<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employList page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	margin-top: 10px;
	min-height: 700px;
}

.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 50px;
}

.filters {
    display: flex;
    align-items: center;
}
#jobTypeFilter, #locationFilter{
	padding: 10px;
	font-size: 16px;
	width: 100px;
	border: 1px solid #ccc;
	border-radius: 5px
}
.search-container {
	display: flex;
	align-items: center;
}

.search-box {
	margin: 5px;
	padding: 10px;
	font-size: 16px;
	width: 200px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-button, #filterBnt {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #FF9900;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.search-button:hover {
	background-color: #CC7A00;
}
#filterBnt:hover {
	background-color: #CC7A00;
}
#main-content{
	border: 1px solid #eee;
	margin-top: 10px;
}
.company-info {
    border: 1px solid #eee;
    width: 1030px;
    height: auto;
    padding: 10px;
    box-sizing: border-box;
    margin: 30px 30px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.company-img {
    border: 1px solid #eee;
    width: 150px;
    height: 130px;
    padding: 15px;
    box-sizing: border-box;
}

.company-details {
    flex-grow: 1;
    padding-left: 40px;
}

.company-name {
    font-size: 25px;
    text-align: left;
}

.company-info p {
    margin: 0;
    padding-top: 10px;
    font-size: 16px;
    color: #666;

}
#comname{
	font-size: 18px;
	margin-bottom:8px;
}

.interest-button {
    padding: 10px 10px;
    font-size: 16px;
    background-color: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 20px; /* 추가: 버튼을 왼쪽으로 이동 */
}
.doing-button{
	padding: 10px 10px;
    font-size: 16px;
    background-color: #FF9900;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 20px; /* 추가: 버튼을 왼쪽으로 이동 */
}

.interest-button:hover {
    background-color: #0056b3;
}
.doing-button:hover {
	background-color: #CC7A00;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	
	<main>
	<div class="container">
		<div id="filters">
        	<select id="jobTypeFilter">
            	<option value="">지역</option>
            	<option value="서울">서울</option>
            	<option value="경기">경기</option>
            	<option value="부산">부산</option>
        	</select>
        	<select id="locationFilter">
            	<option value="">직무</option>
            	<option value="개발">개발</option>
            	<option value="경영">경영</option>
            	<option value="회계">회계</option>
            	<option value="건축">건축</option>
            	<option value="제조·생산">제조·생산</option>
        	</select>
        	<button id="filterBnt" onclick="applyFilters()">filter</button>
    	</div>
		<div class="search-container">
			<input type="text" id="search-box" class="search-box" placeholder="채용 공고 검색...">
			<button id="search-button" class="search-button">검색</button>
		</div>
	</div>
	
	<div id="main-content">
		<div class='company-info'>
			<div class='company-img'>
				<a href="/companyDetail?com_no=recruit.com_no">
	            	<img src="" alt="기업사진">  
	            </a>
	         </div>   
	  	</div>
	</div>
	</main>
	
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

<script>
$(document).ready(function() {
	// 검색 버튼 클릭 이벤트 핸들러
	$("#search-button").on("click", function() {
		const query = $("#search-box").val();
		if (query.trim() !== "") {
			searchRecruit(query);
		} else {
			alert("검색어를 입력하세요.");
		}
	});
	
	// 채용공고리스트 
	$.ajax({
		url: "http://localhost:8888/api/recruit94/allRecruitList",
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log(data);
			let mainContent = $("#main-content");
			mainContent.empty(); // 기존 내용 삭제
			
			// 반복문을 통해 데이터 삽입
			data.forEach(function(recruit) {
				mainContent.append(
						"<div class='company-info'>" +
						"<div class='company-img'>" +  
	            			"<a href='/companyDetail?com_no=" + recruit.com_no + "'>" +
	            				"<img src='" + recruit.img_url + "' alt='기업사진'>" + 
	            			"</a>" +
	        			"</div>" + 
	        			"<div class='company-details'>" + 
	        				"<div id='comname'>"+ recruit.com_name + "</div>" +
	        				"<div class='company-name'>" + 
	        					"<a href='/company94/companyDetail?com_no=" + recruit.com_no + "'>" +
	        					recruit.title +
	        					"</a>" +
	        				"</div>" +
	        				"<p>" + 
	        				recruit.sectors + " | " +
	        				recruit.com_type +
	        				recruit.career + " | " +
							recruit.qualification + " | " +
							recruit.deadline_date + 
							"</p>" +
						"</div>" +
						"<button class='doing-button' data-company-id='" + recruit.com_no + "'>지원하기</button>" +
						"<button class='interest-button' data-company-id='" + recruit.com_no + "'>스크랩</button>" +
	        		"</div>"
				);
			});

			// 스크랩 등록 버튼 클릭 이벤트 핸들러
			$(".interest-button").on("click", function() {
				const companyId = $(this).data("company-id");
				$.ajax({
					url: "http://localhost:8888/api/company/addInterest",
					method: "POST",
					data: JSON.stringify({ companyId: companyId }),
					contentType: "application/json",
					success: function(response) {
						alert("스크랩 되었습니다.");
					},
					error: function(error) {
						alert("등록에 실패했습니다.");
						console.log("Error:", error);
					}
				});
			});
			
			// 지원하기 버튼 클릭 이벤트 핸들러
			$(".interest-button").on("click", function() {
				const companyId = $(this).data("company-id");
				$.ajax({
					url: "http://localhost:8888/api/company/addInterest",
					method: "POST",
					data: JSON.stringify({ companyId: companyId }),
					contentType: "application/json",
					success: function(response) {
						alert("지원 등록 되었습니다.");
					},
					error: function(error) {
						alert("등록에 실패했습니다.");
						console.log("Error:", error);
					}
				});
			});
		},
		error: function(error) {
			console.log("Error:", error);
		}
	});
});
</script>
</body>
</html>