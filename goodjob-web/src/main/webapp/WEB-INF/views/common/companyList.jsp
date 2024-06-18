<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyList page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	margin-top: 10px;
	min-height: 700px;
}
.search-container {
	margin-top: 50px;
	margin-left: 115px;
	text-align: row;
}

.search-box {
	padding: 10px;
	font-size: 16px;
	width: 200px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-button {
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

.company-info {
    border: 1px solid #eee;
    width: 1100px;
    height: auto;
    padding: 10px;
    box-sizing: border-box;
    margin: 15px auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.company-img {
    border: 1px solid #eee;
    width: 280px;
    height: 130px;
    padding: 15px;
    box-sizing: border-box;
}

.company-details {
    flex-grow: 1;
    padding-left: 40px;
}

.company-name {
    font-size: 30px;
    text-align: left;
}

.company-info p {
    margin: 0;
    padding-top: 10px;
    font-size: 16px;
    color: #666;
}

.interest-button {
    padding: 10px 10px;
    font-size: 16px;
    background-color: #FF9900;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 20px; /* 추가: 버튼을 왼쪽으로 이동 */
}

.interest-button:hover {
    background-color: #CC7A00;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	
	<div class="search-container">
		<input type="text" id="search-box" class="search-box" placeholder="채용 공고 검색...">
		<button id="search-button" class="search-button">검색</button>
	</div>
	
	<main id="main-content">
		<!-- 기업 정보가 여기에 동적으로 추가됩니다. -->
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

<script>
$(document).ready(function() {
	// 기업정보리스트 
	$.ajax({
		url: "http://localhost:8888/api/company/companyList",
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log("company list:", data);
			let mainContent = $("#main-content");
			mainContent.empty(); // 기존 내용 삭제
			
			// 반복문을 통해 데이터 삽입
			data.forEach(function(company) {
				mainContent.append(
						"<div class='company-info'>" +
						"<div class='company-img'>" +  
	            			"<a href='/companyDetail?com_no=" + company.com_no + "'>" +
	            				"<img src='" + company.img_url + "' alt='기업사진'>" + 
	            			"</a>" +
	        			"</div>" + 
	        			"<div class='company-details'>" + 
	        				"<div class='company-name'>" + 
	        					"<a href='/company94/companyDetail?com_no=" + company.com_no + "'>" +
	            					company.com_name +
	        					"</a>" +
	        				"</div>" +
	        				"<p>" + 
	        					company.sectors + " | " +
	        					company.com_type +
							"</p>" +
						"</div>" +
						"<button class='interest-button' data-company-id='" + company.com_no + "'>관심기업 등록</button>" +
	        		"</div>"
				);
			});

			// 관심기업 등록 버튼 클릭 이벤트 핸들러
			$(".interest-button").on("click", function() {
				const companyId = $(this).data("company-id");
				$.ajax({
					url: "http://localhost:8888/api/company/addInterest",
					method: "POST",
					data: JSON.stringify({ companyId: companyId }),
					contentType: "application/json",
					success: function(response) {
						alert("관심기업으로 등록되었습니다.");
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