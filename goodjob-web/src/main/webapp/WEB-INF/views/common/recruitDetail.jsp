<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 상세페이지</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 700px;
}

#recruitDetail-area{
	width:950px;
	margin:0 auto;
	border:1px solid #ddd;
	border-top:2px solid #000;
	padding:20px;
	box-sizing:border-box;
	display:flex;
}

.info-area-left{
	width:72%;
}
.info-area-leftTop{
	border-bottom:1px solid #ddd;
	padding:10px 0;
	margin-bottom:20px;
}
.info-area-leftTop p{
	font-size:18px;
}
.info-area-leftTop p a{
	display:inline-block;
	margin-left:15px;
	font-size:13px;
	color:#aaa;
	padding:5px 12px;
	border:1px solid #aaa;
}
.info-area-leftTop h1{
	font-size:27px;
	font-weight:400;
	padding:10px 0;
}

.info-area-leftBot{
	display:flex;
	gap:100px;
}
.info-area-leftBot1 p{
	font-size:15px;
	padding-top:15px;
	color:#999;
}
.info-area-leftBot1 p span{
	color:#333;
	padding-left:25px;
}

.info-area-leftBot2 p span{
	width:70px;
	display:inline-block;
	color:#333;
	margin-right:20px;
	color:#999;
}
.info-area-leftBot2 p{
	font-size:15px;
	padding-top:15px;
	color:#333;
}

.info-area-right{
	width:28%;
	margin-left:20px;
}
.info-area-right img{
	max-width:100%;
}
.info-area-right h4{
	padding:5px 0 10px;
}
.info-area-right p{
	width:100%;
	font-size:15px;
	color:#333;
	padding:7px 0;
}
.info-area-right p span{
	width:75px;	
	display:inline-block;
	padding-right:10px;
	color:#999;
}
.info-area-right a{
	display:inline-block;
	font-size:12px;
	color:#999;
	padding:5px 10px;
	border:1px solid #999;
	margin-left:15px;
	margin-right:5px;
	margin-top:5px;
}

.output-btn{
	text-align:center;
	margin-top:50px;
}
.output-btn button{
	display:inline-block;
	font-size:20px;
	cursor:pointer;
	font-family: "Pretendard Variable", Pretendard;
}
.output-btn button:nth-child(1){
	background:#FB8500;
	border:1px solid #FB8500;
	padding:15px 45px;
	color:#fff;
}
.output-btn button:nth-child(2){
	background:#fff;
	border:1px solid #FB8500;
	padding:15px 45px;
	color:#FB8500;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
		<div id="recruitDetail-area"></div>
		
		<div class="output-btn">
			<button id="nowApply">즉시지원</button>
			<button id="nowScrap">스크랩</button>
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>


	<script>
		$(document).ready(function() {
			// 페이지 로드 시 URL에서 mem_no와 resume_no 가져오기
			const urlParams = new URLSearchParams(window.location.search);
			let recruit_no = "${recruit_no}";
			let com_no = "${com_no}";
			let com_detail_no = "${com_detail_no}";

			// resume_no를 이용하여 상세 정보 가져오기
			function getRecruitDetail(recruit_no, com_no, com_detail_no) {
				$.ajax({
					url : "http://localhost:8888/api/recruit/detail",
					type : "GET",
					data : {
						recruit_no : recruit_no,
						com_no : com_no,
						com_detail_no : com_detail_no
					},
					success : function(data) {
						console.log(data);
						
						let output = '<div class="info-area-left">';
						output += '<div class="info-area-leftTop">';
						output += '<p>'+ data.company.username +'<a href="#">❤ 관심기업</a></p>';
						output += '<h1>'+ data.recruit.title +'</h1>';
						output += '</div>';
						output += '<div class="info-area-leftBot">';
						output += '<div class="info-area-leftBot1">';
						output += '<h4>지원자격</h4>';
						output += '<p>경력<span>'+ data.recruit.career +'</span></p>';
						output += '<p>학력<span>'+ data.recruit.education +'</span></p>';
						output += '<p>자격<span>'+ data.recruit.qualification +'</span></p>';
						output += '</div>';
						output += '<div class="info-area-leftBot2">';
						output += '<h4>근무조건</h4>';
						output += '<p><span>고용형태</span>'+ data.recruit.field +'</p>';
						output += '<p><span>급여</span>'+ data.recruit.pay +' 만원</p>';
						output += '<p><span>지역</span>'+ data.recruit.location +'</p>';
						output += '<p><span>직급</span>'+ data.recruit.rank +'</p>';
						output += '<p><span>근무시간</span>'+ data.recruit.working_time +'</p>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
						
						output += '<div class="info-area-right">';
						output += '<img src="/resource/img/'+ data.company2.img_url +'">';
						output += '<h4>기업정보</h4>';
						output += '<p><span>산업(업종)</span>'+ data.company2.sectors +'</p>';
						output += '<p><span>사원수</span>'+ data.company2.amount +' 명</p>';
						output += '<p><span>설립년도</span>'+ data.company2.foundation +'</p>';
						output += '<p><span>기업형태</span>'+ data.company.com_type +'</p>';
						output += '<p><span>홈페이지</span>'+ data.company2.url +'</p>';
						output += '<a href="/company94/companyDetail?com_no='+ data.company2.com_no +'">기업정보 > </a>';
						output += '<a href="">진행중인 채용보기 > </a>';
						output += '</div>';

						$('#recruitDetail-area').html(output);
					},
					error : function(error) {
						console.error("Error fetching resume detail:", error);
					}
				});
			}

			// resume_no가 있으면 상세 정보 요청
			if (recruit_no && com_no && com_detail_no) {
				getRecruitDetail(recruit_no, com_no, com_detail_no);
				console.log(recruit_no + ", " + com_no, ", " + com_detail_no);
			} else {
				console.error("recruit number is missing.");
			}
		});
		
		/* 즉시지원 */
		$(document).ready(function () {
	        $('#nowApply').click(function (event) {
	            event.preventDefault(); // 폼 기본 제출 방지
	            
	            const username = localStorage.getItem("username");
	        	//const role = localStorage.getItem("role");

	         	// 필요한 데이터를 객체로 수집
	            var data = {
	                recruit_no: "${recruit_no}"
	            };
	            
	            $.ajax({
	                type: 'POST',
	                beforeSend: function(xhr) {
						// 요청 헤더에 사용자 이름을 설정
						xhr.setRequestHeader("username", username);
					},
	                url: 'http://localhost:8888/api/recruit/nowApply',
	                data: JSON.stringify(data),      	
	                contentType: "application/json",
	                success: function (response) {
	                	console.log("서버 응답:", response);
	                    alert(response);
	                },
	                error: function (error) {
	                    alert('즉시지원에 실패 하셨습니다.ㅜ');
	                    console.error('Error:', error);
	                }
	            });
	        });
	    });
		
		
		/* 스크랩하기 */
		$(document).ready(function () {
	        $('#nowScrap').click(function (event) {
	            event.preventDefault(); // 폼 기본 제출 방지
	            
	            const username = localStorage.getItem("username");
	        	//const role = localStorage.getItem("role");

	         	// 필요한 데이터를 객체로 수집
	            var data = {
	                recruit_no: "${recruit_no}"
	            };
	            
	            $.ajax({
	                type: 'POST',
	                beforeSend: function(xhr) {
						// 요청 헤더에 사용자 이름을 설정
						xhr.setRequestHeader("username", username);
					},
	                url: 'http://localhost:8888/api/recruit/nowScrap',
	                data: JSON.stringify(data),      	
	                contentType: "application/json",
	                success: function (response) {
	                    alert('공고 스크랩 성공!!');
	                },
	                error: function (error) {
	                    alert('공고 스크랩에 실패 하셨습니다.ㅜ');
	                    console.error('Error:', error);
	                }
	            });
	        });
	    });
		
		
		
		/* 공고에 지원했으면 즉시지원버튼 비활성화 */
		$(document).ready(function() {
			// 페이지 로드 시 URL에서 mem_no와 resume_no 가져오기
			const urlParams = new URLSearchParams(window.location.search);
			let recruit_no = "${recruit_no}";

			// resume_no를 이용하여 상세 정보 가져오기
			function getRecruitDetail(recruit_no, com_no, com_detail_no) {
				$.ajax({
					url : "http://localhost:8888/api/recruit/applyChk",
					type : "GET",
					data : {
						recruit_no : recruit_no,
						resume_no : 2
					},
					success : function(data) {
						console.log(data);
						$('#nowApply').prop('disabled', true);
						$("nowApply").css("background", "#eee");
						$('#recruitDetail-area').html(output);
					},
					error : function(error) {
						console.error("Error fetching resume detail:", error);
					}
				});
			}

			// resume_no가 있으면 상세 정보 요청
			if (recruit_no && com_no && com_detail_no) {
				getRecruitDetail(recruit_no, com_no, com_detail_no);
				console.log(recruit_no + ", " + com_no, ", " + com_detail_no);
			} else {
				console.error("recruit number is missing.");
			}
		});
		
		
		
		
		
	</script>

</body>
</html>