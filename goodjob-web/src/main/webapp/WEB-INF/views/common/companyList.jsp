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
#jobTypeFilter, #locationFilter, #companyTypeFilter{
	padding: 10px;
	font-size: 16px;
	width: 115px;
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
.company-info {
    border: 1px solid #eee;
    width: 1100px;
    height: auto;
    padding: 10px;
    box-sizing: border-box;
    display: flex;
    margin-top: 12px;
    align-items: center;
    justify-content: flex-start;
}

.company-img {
    border: 2px solid #eee;
    width: 280px;
    height: 130px;
    box-sizing: border-box;
}
.company-info img {
    width: 100%;
    height: 100%;
    object-fit: cover;
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
	
	<main>
		<div class="container">
			<div id="filters">
        	<select id="jobTypeFilter">
            	<option value="">직종</option>
                <option value="개발">개발/프로그래밍</option>
                <option value="디자인">디자인</option>
                <option value="마케팅/광고">마케팅/광고</option>
                <option value="경영/사무">경영/사무</option>
                <option value="영업/판매">영업/판매</option>
                <option value="생산/제조">생산/제조</option>
                <option value="IT/정보통신">IT/정보통신</option>
                <option value="교육/강사">교육/강사</option>
                <option value="의료/보건">의료/보건</option>
                <option value="서비스/관광">서비스/관광</option>
        	</select>
        	<select id="locationFilter">
            	<option value="">지역</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="부산">부산</option>
                <option value="대구">대구</option>
                <option value="광주">광주</option>
                <option value="대전">대전</option>
                <option value="울산">울산</option>
                <option value="강원도">강원도</option>
                <option value="충청북도">충청북도</option>
                <option value="충청남도">충청남도</option>
                <option value="전라북도">전라북도</option>
                <option value="전라남도">전라남도</option>
                <option value="경상북도">경상북도</option>
                <option value="경상남도">경상남도</option>
                <option value="제주도">제주도</option>
        	</select>
        	 <select id="companyTypeFilter">
                <option value="">기업형태</option>
                <option value="대기업">대기업</option>
                <option value="중소기업">중소기업</option>
                <option value="스타트업">스타트업</option>
                <option value="공기업">공기업</option>
                <option value="비영리기관">공기업</option>
                <option value="공공기관">공공기관</option>
            </select>
        	<button id="filterBnt" onclick="applyFilters()">filter</button>
    	</div>
			<div class="search-container">
				<input type="text" id="search-box" class="search-box" placeholder="기업 검색...">
				<button id="search-button" class="search-button">검색</button>
			</div>
    	</div>
	
	<div id="main-content">
		<!-- 기업 정보가 여기에 동적으로 추가됩니다. -->
	</div>
	
	</main>
	
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

<script>
function applyFilters() {
    const sectors = $("#jobTypeFilter").val();
    const location = $("#locationFilter").val();
    const com_type = $("#companyTypeFilter").val();
    console.log(sectors, location, com_type);
    $.ajax({
        url: "http://localhost:8888/api/company/filterList",
        method: "GET",
        dataType: "json",
        data: {
            sectors: sectors,
            location: location,
            com_type: com_type
        },
        success: function(data) {
            renderCompanyList(data);
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });
}

function renderCompanyList(data) {
    let mainContent = $("#main-content");
    mainContent.empty(); // 기존 내용 삭제
    
    data.forEach(function(company) {
        mainContent.append(
            "<div class='company-info'>" +
            "<div class='company-img'>" +  
                "<a href='/company94/companyDetail?com_no=" + company.com_no + "'>" +
                    "<img src='/resource/img/" + company.img_url + "' alt='기업사진'>" + 
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
                    company.location + " | " +
                    company.com_type +
                "</p>" +
            "</div>" +
            "<button class='interest-button' data-com_no='" + company.com_no + "'>관심기업 등록</button>" +
        "</div>"
        );
    });

    $(".interest-button").on("click", function() {
        const com_no = $(this).data("com_no");
        const username = localStorage.getItem("username");
        $.ajax({
            url: "http://localhost:8888/api/interest/add",
            method: "POST",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("username", username);
            },
            data: {
                com_no: com_no
            },
            success: function(response) {
                alert(response);
            },
            error: function(error) {
                alert("등록에 실패했습니다.");
                console.log("Error:", error);
            }
        });
    });
}

$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8888/api/company/companyList",
        method: "GET",
        dataType: "json",
        success: function(data) {
            renderCompanyList(data);
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });

    $("#search-button").on("click", function() {
        const searchQuery = $("#search-box").val();
        $.ajax({
            url: "http://localhost:8888/api/company/searchCompany",
            method: "GET",
            dataType: "json",
            data: {
                query: searchQuery
            },
            success: function(data) {
                renderCompanyList(data);
            },
            error: function(error) {
                console.log("Error:", error);
            }
        });
    });
});
</script>
</body>
</html>