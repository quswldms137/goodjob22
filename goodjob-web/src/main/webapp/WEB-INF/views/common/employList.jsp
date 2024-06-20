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
    border: 2px solid #eee;
    width: 160px;
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

.posting-button {
    padding: 10px 10px;
    font-size: 16px;
    background-color: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 20px; /* 추가: 버튼을 왼쪽으로 이동 */
}
.apply-button{
	padding: 10px 10px;
    font-size: 16px;
    background-color: #FF9900;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 20px; /* 추가: 버튼을 왼쪽으로 이동 */
}

.posting-button:hover {
    background-color: #0056b3;
}
.apply-button:hover {
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
            	<option value="">직종</option>
                <option value="개발/프로그래밍">개발/프로그래밍</option>
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
			<input type="text" id="search-box" class="search-box" placeholder="채용 공고 검색...">
			<button id="search-button" class="search-button">검색</button>
		</div>
	</div>
	
	<div id="main-content">
		<!-- 채용공고리스트 -->
	</div>
	</main>
	
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

<script>
$(document).ready(function() {
    // 페이지 로드 시 전체 채용 공고 리스트를 로드
    loadRecruitList();

    // 검색 버튼 클릭 이벤트 핸들러
    $("#search-button").on("click", function() {
        const searchQuery = $("#search-box").val().trim();
        if (!searchQuery) {
            alert("검색어를 입력하세요");
            return;
        }
        console.log(searchQuery);
        searchRecruit(searchQuery);
    });
});

// 채용공고리스트 필터 적용 함수
function applyFilters() {
    const sectors = $("#jobTypeFilter").val();
    const location = $("#locationFilter").val();
    const com_type = $("#companyTypeFilter").val();
    console.log(sectors, location, com_type);
    $.ajax({
        url: "http://localhost:8888/api/recruit94/filterList",
        method: "GET",
        dataType: "json",
        data: {
            sectors: sectors,
            location: location,
            com_type: com_type
        },
        success: function(data) {
            renderRecruitList(data);
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });
}

// 채용공고리스트 로드 함수
function loadRecruitList() {
    $.ajax({
        url: "http://localhost:8888/api/recruit94/allRecruitList",
        method: "GET",
        dataType: "json",
        success: function(data) {
            renderRecruitList(data);
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });
}

// 검색 기능 구현
function searchRecruit(query) {
    $.ajax({
        url: "http://localhost:8888/api/recruit94/searchRecruit",
        method: "GET",
        dataType: "json",
        data: { query: query },
        success: function(data) {
            renderRecruitList(data);
            console.log(data);
        },
        error: function(error) {
            console.log("Error:", error);
            alert("검색 중 오류가 발생했습니다.");
        }
    });
}

// 채용공고리스트 렌더링 함수
function renderRecruitList(data) {
    let mainContent = $("#main-content");
    mainContent.empty(); // 기존 내용 삭제

    data.forEach(function(recruit) {
        mainContent.append(
            "<div class='company-info'>" +
                "<div class='company-img'>" +
                    "<a href='/employ/detail/" + recruit.recruit_no + "/" + recruit.com_no + "/" + recruit.com_detail_no + "'>" +
                        "<img src='/resource/img/" + recruit.img_url + "' alt='기업사진'>" +
                    "</a>" +
                "</div>" +
                "<div class='company-details'>" +
                    "<a href='/company94/companyDetail?com_no=" + recruit.com_no + "'>" +
                        "<div id='comname'>" + recruit.com_name + "</div>" +
                    "</a>" +
                    "<div class='company-name'>" +
                        "<a href='/employ/detail/" + recruit.recruit_no + "/" + recruit.com_no + "/" + recruit.com_detail_no + "'>" +
                            recruit.title +
                        "</a>" +
                    "</div>" +
                    "<p>" +
                        recruit.sectors + " | " +
                        recruit.location + " | " +
                        recruit.com_type + " | " +
                        recruit.career + " | " +
                        "공고마감일 : " + recruit.deadline_date +
                    "</p>" +
                "</div>" +
                "<button class='apply-button' data-recruit_no='" + recruit.recruit_no + "'>지원하기</button>" +
                "<button class='posting-button' data-recruit_no='" + recruit.recruit_no + "'>스크랩</button>" +
            "</div>"
        );
    });

    // 스크랩 등록 버튼 클릭 이벤트 핸들러
    $(".posting-button").on("click", function() {
        const recruit_no = $(this).data("recruit_no");
        console.log(recruit_no);

        const username = localStorage.getItem("username");
        console.log(username);

        $.ajax({
            url: "http://localhost:8888/api/interest/addScrap",
            method: "POST",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("username", username);
            },
            data: {
                recruit_no: recruit_no
            },
            success: function(response) {
                alert(response);
            },
            error: function(error) {
                alert("스크랩 등록에 실패했습니다.");
                console.log("Error:", error);
            }
        });
    });
  	//지원하기 버튼 
    $('.apply-button').click(function () {
    	const recruit_no = $(this).data("recruit_no");
        console.log(recruit_no);
    	
    	const username = localStorage.getItem("username");
    	console.log(username);

        $.ajax({
            url: 'http://localhost:8888/api/recruit94/nowApply',
            method: "POST",
            beforeSend: function(xhr) {
				// 요청 헤더에 사용자 이름을 설정
				xhr.setRequestHeader("username", username);
			},
            data: {
            	recruit_no: recruit_no      	
            },
            success: function (response) {
                alert("해당 공고에 지원 성공하셨습니다😎");
            },
            error: function (error) {
                alert("지원에 실패 하셨습니다😵");
                console.error('Error:', error);
            }
        });
    });
}


</script>
</body>
</html>