<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
body {
	background: #fafafa;
}

main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 1100px;
	margin:0 auto;
	min-height: 700px;
}


.resume-detail-area-box{
	width:900px;
	margin:0 auto;
}
.resume-detail-area-box .resume-title{
	font-size:26px;
	margin-bottom:70px;
}

.resume-info-title{
	font-size:20px;
	font-weight:500;
	margin-top:60px;
	margin-bottom:25px;
}

.resume-info-box1{
	width:900px;
	margin:0 auto;
	border-top:1px solid #333;
	padding:20px;
	background:#fff;
	color:#666;
}
.member-name{
	color:#333;
	font-size:20px;
}
.member-name span{
	color:#666;
	font-size:16px;
	padding-left:20px;
}
.info-box2{
	padding:15px 0;
}
.info-box2 span{
	padding-right:40px;
}
.info-line{
	padding:0 10px;
	font-weight:100;
}

.edu-box span{
	padding:0 20px;
}
.edu-box .graduation{
	color:#D44958;
}
.edu-box .school{
	font-size:20px;
	color:#333;
}

.career span{
	padding:0 20px;
}
.career .quit-date{
	padding-left:0px;
}
.career .company{
	font-size:18px;
	color:#333;
}

.license span{
	padding:0 20px;
}
.license .license-name{
	font-size:18px;
	color:#333;
}

.intro-box{
	padding-top:50px;
	padding-bottom:20px;
}
.intro-box:first-child{
	padding-top:10px;
}
.introduce-title{
	color:#333;
	font-weight:400;
	padding-bottom:20px;
	font-weight:bold;
}
.intro-box p{
	line-height:26px;
}

.port-addr{
	display:flex;
}
.port-addr img{
	display:inline-block;
	padding-right:10px;
}

.hope{
	display:flex;
	flex-direction:column;
}
.hope .hope-content{
	padding:10px 0;
}
.hope .hope-content b{
	color:#333;
	padding-right:25px;
}

.back-list{
	text-align:center;
	margin-top:50px;
}
.back-list a{
	display:inline-block;
	color:#fff;
	padding:15px 25px;
	background:#FB8500;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div id="container">
			<div class="resume-detail-area">
			
			</div>
			<div class="resume-detail-area-info">
			
			</div>
			<div class="back-list">
				<a href="/resume/resumeManage">돌아가기</a>
			</div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	
	
	<script>
	
	
	$(document).ready(function () {
	    // 페이지 로드 시 URL에서 mem_no와 resume_no 가져오기
	    const urlParams = new URLSearchParams(window.location.search);
	    const username = localStorage.getItem("username");
	    const mem_no = urlParams.get('mem_no');
	    const resume_no = urlParams.get('resume_no');

	    // resume_no를 이용하여 상세 정보 가져오기
	    function getResumeDetail(resume_no, mem_no) {
	        $.ajax({
	            url: "http://localhost:8888/api/resume/detail",
	            type: "GET",
	            data: { resume_no: resume_no,
	            		mem_no: mem_no },
	            success: function(data) {
	            	/* 인적사항 */
	                let output = '<div class="resume-detail-area-box">';
	                output += '<h3 class="resume-title">' + data.resume.title + '</h3>';
	                output += '<div class="resume-info-title">인적사항</div>';
	                output += '<div class="resume-info-box1"><div class="member-name">' + data.member.mem_name;
	                output += '<span>' + data.member.mem_birth + '</span></div>';
	                output += '<div class="info-box2"><span>휴대폰 <b class="info-line">|</b> ' + data.member.mem_tel + '</span>';
	                output += '<span>Email <b class="info-line">|</b> '+ data.member.mem_email +'</span></div>'
	                output += '<div>주소 <b class="info-line">|</b> ' + data.member.mem_addr + '</div>';
	                output += '</div>';
	                output += '</div>';
	                
	                /* 학력 */
	                if(data.education && data.education.edu_gra_date && data.education.graduation && data.education.school && data.education.major){
	                output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">학력</div>';
	                output += '<div class="resume-info-box1"><div class="edu-box">' + data.education.edu_gra_date;
	                output += '<span class="graduation">' + data.education.graduation + '</span><span class="school">'+ data.education.school +'</span>';
	                output += '<span>' + data.education.major + '</span></div>';
	                output += '</div>';
	                output += '</div>';
	                }
	                
	                /* 경력 */
	                if(data.career && data.career.car_join_date && data.career.quit_date && data.career.company && data.career.main_part){
	                output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">경력</div>';
	                output += '<div class="resume-info-box1"><div class="career">' + data.career.car_join_date + ' ~ ';
	                output += '<span class="quit-date">' + data.career.quit_date + '</span><span class="company">'+ data.career.company +'</span>';
	                output += '<span>담당 업무 : ' + data.career.main_part + '</span></div>';
	                output += '</div>';
	                output += '</div>';
	                }
	                
					/* 자격증 */
					if(data.license && data.license.get_date && data.license.license_name && data.license.agency){
					output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">자격증</div>';
	                output += '<div class="resume-info-box1"><div class="license">' + data.license.get_date;
	                output += '<span class="license-name">' + data.license.license_name + '</span>';
	                output += '<span>' + data.license.agency + '</span></div>';
	                output += '</div>';
	                output += '</div>';
					}
	                
	                /* 자기소개서 */
					output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">자기소개서</div>';
	                output += '<div class="resume-info-box1"><div class="license">';
	                output += '<div class="intro-box"><h3 class="introduce-title">성장과정</h3>';
	                output += '<p>' + data.resume.growth + '</p>';
	                output += '</div>'
	                output += '<div class="intro-box"><h3 class="introduce-title">지원동기</h3>';
	                output += '<p>' + data.resume.motive + '</p>';
	                output += '</div>'
	                output += '<div class="intro-box"><h3 class="introduce-title">성격의 장단점</h3>';
	                output += '<p>' + data.resume.personality + '</p>';
	                output += '</div>'
	                output += '</div>';
	                output += '</div>';
	                
	                /* 포트폴리오 주소 */
	                if(data.resume && data.resume.port_url){
					output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">포트폴리오 주소</div>';
	                output += '<div class="resume-info-box1"><div class="portfolio">';
	                output += '<span class="port-addr"><img src="/resource/img/port-img.png">';
	                output += '<a href="'+ data.resume.port_url +'" target="_blank">' + data.resume.port_url + '</a>'
	                output += '</span>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                }
	                
	                /* 기타첨부파일 */
	                if(data.etc && data.etc.etc_name1 && data.etc.etc_name2 && data.etc.etc_name3){
					output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">기타 첨부파일</div>';
	                output += '<div class="resume-info-box1"><div class="etc">';
	                output += '<span class="etc-name">' + data.etc.etc_name1 + '</span>';
	                output += '<span class="etc-name">' + data.etc.etc_name2 + '</span>';
	                output += '<span class="etc-name">' + data.etc.etc_name3 + '</span>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                }
	                
	                /* 희망근무조건 */
	                if(data.resume && data.resume.hope_city && data.resume.hope_job && data.resume.hope_pay){
					output += '<div class="resume-detail-area-box">';
	                output += '<div class="resume-info-title">희망근무조건</div>';
	                output += '<div class="resume-info-box1"><div class="hope">';
	                output += '<span class="hope-content"><b>희망 지역</b>' + data.resume.hope_city + '</span>';
	                output += '<span class="hope-content"><b>희망 직무</b>' + data.resume.hope_job + '</span>';
	                output += '<span class="hope-content"><b>희망 연봉</b>' + data.resume.hope_pay + '</span>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                output += '</div>';
	                }
	                
	                
	                $('.resume-detail-area').html(output);
	            },
	            error: function(error) {
	                console.error("Error fetching resume detail:", error);
	            }
	        });
	    }

	    // resume_no가 있으면 상세 정보 요청
	    if (resume_no) {
	        getResumeDetail(resume_no, mem_no);
	    } else {
	        console.error("Resume number is missing.");
	    }
	});
	
	</script>
</body>
</html>