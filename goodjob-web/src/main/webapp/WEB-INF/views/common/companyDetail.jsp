<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}
header, footer {
    width: 100%;
}
main {
    width: 1100px;
    margin: 80px auto;
    min-height: 700px;
    padding: 0 20px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: auto auto;
    gap: 10px;
}
#mainCompanyInfo {
    border: 1px solid #ddd;
    width: 1100px;
    height: 215px;
    padding: 10px;
    box-sizing: border-box;
    margin: 80px auto;
    display: flex;
    align-items: center;
}
#companyImg_url {
    border: 2px solid #ddd;
    width: 300px;
    height: 177px;
    box-sizing: border-box;
    margin-left: 10px;
}
#companyImg_url img{
	width: 100%;
	height: 100%;
	object-fit: cover;
    box-sizing: border-box; 
}
#companyName {
    font-size: 43px;
    text-align: left;
    padding-left: 20px;
    margin-left: 8px;
    flex-grow: 1;
}
.info {
	width: 545px;  /* 고정 너비 */
    height: 400px; /* 고정 높이 */
    border: 1px solid #ddd;
    padding: 20px;
    box-sizing: border-box;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    
    border-collapse: separate;
    border-spacing: 2px 2px; /* 수평 간격과 수직 간격 설정 */
}

th, td {
    padding: 10px;
    text-align: left;
    font-size: 14px;
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.postingList {
    margin-top: 20px;
    padding: 20px;
    border: 1px solid #ddd;
}
#companyName2 {
    margin-top: 25px;
    font-size: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    width: 458px;
    height: 200px;
    position: relative;
    
    align-items: center;
}

.money-container {
    display: flex;
    margin-top: 45px;
    justify-content: space-around;
    width: 100%;
    
    flex-direction: row; 
    align-items: center; /* 요소들을 세로 방향으로 가운데 정렬합니다. */
    margin-bottom: 10px;
} 
.pay-containger{
	display: flex;
	flex-direction: row; 
	justify-content: center; /* 가운데 정렬 */
	margin-left: 5px;
}
.money-container, .money-container vertical {
        flex-direction: column; /* vertical 클래스를 사용하여 요소들을 세로로 배열합니다. */
        align-items: flex-start; /* 요소들을 세로 방향으로 시작점에 정렬합니다. */
    }
#averageSalary, #entrySalary {


    font-size: 33px;
}
.pay-containger span, #averageSalary, money-container vertical, #entrySalary {
	margin:0 auto;
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
</head>
<body>
    <header>
        <%@ include file="../front/header.jsp" %>
    </header>
    
    <div id="mainCompanyInfo">
        <div id="companyImg_url">
            <img id="companyImage" src="" alt="기업사진">
        </div>
        <div id="companyName">
            기업이름
        </div>
    </div>
    
    <main>
        <div class="info" id="companyInfo">
            기업정보
            <div id="companyInfoDetails">
                <table>
                    <tbody id="companyDetailsTable">
                        <!-- JavaScript로 데이터를 삽입할 부분 -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="info" id="postingInfo">
            채용공고
            <div id="postingDetail">
                <div class="postingList">채용공고리스트1</div>
                <div class="postingList">채용공고리스트2</div>
                <div class="postingList">채용공고리스트3</div>
            </div>
        </div>
        <div class="info" id="salaryInfo">
            연봉정보
            <div id="companyName2">
            	<span id="com_name">삼성전자(주)</span>
            	<div class="pay-containger">
                	<div class="money-container">
                		<span>전체 평균 연봉</span>
                    	<div id="averageSalary">
                        
                    	</div>
                	</div>
                	<div class="money-container vertical">   
                    	<span>신입사원 초봉</span>
                    	<div id="entrySalary">
                    
                    	</div>
                	</div>
                </div> 
            </div>
        </div>
        <div class="info" id="letterInfo">
            합격 인재상
            <div id="review">
                <div class="postingList">합격후기1</div>
                <div class="postingList">합격후기2</div>
                <div class="postingList">합격후기3</div>    
            </div>
        </div>
    </main>

    <footer>
        <%@ include file="../front/footer.jsp" %>
    </footer>
    
<script>
$(document).ready(function() {
	console.log('${com_no}');
	// URL에서 com_no 파라미터 추출
    const urlParams = new URLSearchParams(window.location.search);
    const com_no = urlParams.get('com_no');
    console.log("com_no===========", com_no);
	// 기업정보
	$.ajax({
		url: "http://localhost:8888/api/com-detail/companyInfo?com_no="+com_no,
		method: "GET",
		dataType: "json",
		success: function(data) {
			// data가 배열 형태인 경우, 첫 번째 객체를 사용
            console.log(data)
			//let detail = data[0];
			//console.log("detail:", detail);
			// DOM에 데이터 삽입
			$("#companyImage").attr("src", "/resource/img/" + data.img_url);
			$("#companyName").text(data.com_name + " 👍");  
			$("#companyDetailsTable").html(
				"<tr><th>산업</th><td>" + data.sectors + "</td><tr>" +
				"<tr><th>사원수</th><td>" + data.amount + "</td></tr>" +
				"<tr><th>기업형태</th><td>" + data.com_type + "</td><tr>" +
				"<tr><th>설립일</th><td>" + data.foundation + "</td></tr>" + 
				"<tr><th>대표자</th><td>" + data.com_ceo + "</td><tr>" +
				"<tr><th>연금/보험</th><td>" + data.pension + "</td></tr>" +
				"<tr><th>주소</th><td>" + data.com_addr + "</td><tr>" +
				"<tr><th>기업사이트</th><td><a href='" + data.url + "'>" + data.url + "</a></td></tr>"
			);
		},
		error: function(error) {
			console.log("Error:", error);
		}
	});

	// 채용공고
	$.ajax({
		url: "http://localhost:8888/api/recruit94/recruitList?com_no="+com_no,
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log("recruit:", data);
			let postingDetail = $("#postingDetail");
			postingDetail.empty(); // 기존 내용 삭제
			
			// 반복문을 통해 데이터 삽입
			data.forEach(function(recruit) {
				postingDetail.append(
					"<a href='/employ/detail/"  + recruit.recruit_no + "/" + recruit.com_no + "/" + recruit.com_detail_no + "'>" +
						"<div class='postingList'>" +
							"<h4>" + recruit.title + "</h4>" +
							"<p>" + 
							recruit.career + " | " +
							recruit.location + " | " +
							recruit.qualification + " | " +
							recruit.deadline_date + 
							"</p>" +
						"</div>" +
					"</a>"
				);
			});
		},
		error: function(error) {
			console.log("Error:", error);
		}
	});
	
	// 연봉정보
	$.ajax({
		url: "http://localhost:8888/api/recruit94/recruitList?com_no="+com_no,
		method: "GET",
		dataType: "json",
		success: function(data) {
			// data가 배열 형태인 경우, 첫 번째 객체를 사용
            let detail2 = data[0];
			console.log("detail2:", detail2);
			
			// 연봉 정보 출력
            let annualSalary = detail2.pay * 12 * 100; // 연간 연봉 계산
            console.log("annualSalary:", annualSalary);
            let entrySalary = detail2.pay * 12; 

            // DOM에 데이터 삽입
            $("#com_name").text(detail2.com_name);
            $("#averageSalary").html("<div>" + annualSalary.toLocaleString() + "원" + "</div>");
            $("#entrySalary").html("<div>" + entrySalary.toLocaleString() + "원" + "</div>");
		},
		error: function(error) {
			console.log("Error:", error);
		}
	});
	// 합격후기 
	$.ajax({
		url: "http://localhost:8888/api/com-detail/companyInfo?com_no=" + com_no,
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log("review:", data); 
			
			$("#review").html(
		    	"<div class='postingList'>" +
		    		"<div>" + data.ideal_talent + "</div>" +
		    	"</div>"
			);
		},
		error: function(error) {
			console.log("Error:", error);
		}
	});

});
</script>
</body>
</html>
