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
	margin-top: 100px;
	min-height: 700px;
	border:1px solid #eee;
}
#star-container {
display: flex;
flex-direction: row; /* 기본값으로 생략 가능 */
justify-content: space-evenly; /* 요소들 사이에 공간을 고르게 분배 */
align-items: center; /* 요소들을 세로 중앙 정렬 */
gap: 10px; /* 요소 간의 간격을 줄이기 위해 gap 사용 */

}
.star {
width:150px;
height:150px;
padding: 10px;
border: 1px solid #ccc;
border-radius: 20px;

margin-top: 90px;
margin-left: -100px;
margin-right: -100px; /* 오른쪽 간격을 줄이기 위해 margin-right 사용 */

}
.company-info {
    border: 1px solid #eee;
    width: 1030px;
    height: auto;
    padding: 10px;
    box-sizing: border-box;
    margin: 40px 30px;
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

.interest-button:hover, .doing-button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<div id="star-container">
 		<div class="star">
 		
 		</div>
 		<div class="star">
 	
 		</div>
 		<div class="star">
 	
 		</div>
 		<div class="star">
 	
 		</div>
 		<div class="star">
 		
 		</div>
	</div>
	
	<main id="main-content">
		<div class='company-info'>
			<div class='company-img'>
				<a href="/companyDetail?com_no=recruit.com_no">
	            	<img src="" alt="기업사진">  
	            </a>
	         </div>   
	  	</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

<script>
$(document).ready(function() {
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
						"<button class='interest-button' data-company-id='" + recruit.com_no + "'>관심기업 등록</button>" +
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