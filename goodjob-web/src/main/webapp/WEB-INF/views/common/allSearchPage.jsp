<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
}

.company-info {
    border: 1px solid #eee;
    width: 1100px;
    height: auto;
    padding: 10px;
    box-sizing: border-box;
    display: flex;
    margin: 25px auto;
    align-items: center;
    justify-content: flex-start;
}

.company-img {
    border: 2px solid #eee;
    width: 250px;
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

#companySearchList{
	margin-bottom: 50px;
}
#keyword{
	font-size: 25px;
	font-weight: bold;
	margin-bottom:30px;
}
.searchbox{
	border: 1px solid #ddd;
	padding: 20px;
	margin-bottom: 80px;
	
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
		<p id="keyword"></p>
		
		<div class="searchbox">
			<h3>기업 검색 결과</h3>
			<div id="companySearchList">
			<!-- 기업 정보가 여기에 동적으로 추가됩니다. -->
			</div>		
		</div>
		
		
		<div class="searchbox">
			<h3>채용공고 검색 결과</h3>
			<div id="recruitSearchList">
			<!-- 채용공고 정보가 여기에 동적으로 추가됩니다. -->
			</div>
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>

	<script>
		//검색 키워드 파라미터 받아오기
		$(document).ready(function() {

			console.log("${keyword}");
			const keyword = "${keyword}";
			$("#keyword").html("💡 검색한 키워드 : " + keyword);
			
			$.ajax({
				url : "http://localhost:8888/api/company/searchCompany",
				method : "GET",
				dataType : "json",
				data : {
					query : keyword
				},
				success : function(data) {
					renderCompanyList(data);
					console.log("companySearch:",data);
				},
				error : function(error) {
					console.log("Error:", error);
					alert("검색 중 오류가 발생했습니다.");
				}
			});
			searchRecruit(keyword);
			
		});
		
		// 검색 기능 구현
		function searchRecruit(query) {
		    $.ajax({
		        url: "http://localhost:8888/api/recruit94/searchRecruit",
		        method: "GET",
		        dataType: "json",
		        data: { query: query },
		        success: function(data) {
		            renderRecruitList(data);
		            console.log("recruitsearch:",data);
		        },
		        error: function(error) {
		            console.log("Error:", error);
		            alert("검색 중 오류가 발생했습니다.");
		        }
		    });
		}
		//기업
		function renderCompanyList(data) {
		    let companySearchList = $("#companySearchList");
		    companySearchList.empty(); // 기존 내용 삭제
		    
		    data.forEach(function(company) {
		    	companySearchList.append(
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
		    
		  //관심기업등록 버튼
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
		
		//채용공고
		function renderRecruitList(data) {
		    let recruitSearchList = $("#recruitSearchList");
		    recruitSearchList.empty(); // 기존 내용 삭제

		    data.forEach(function(recruit) {
		    	recruitSearchList.append(
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