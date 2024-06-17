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
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	<main>
		<div id="container">
			<div class="resume-detail-area"></div>
		</div>
	</main>
	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
	
	
	<script>
	
	function getResumeDetail(resume_no) {
	    $.ajax({
	        url: "http://localhost:8888/api/resume/detail",
	        type: "GET",
	        contentType: "application/json",
	        data: { resume_no: resume_no },  // 서버에 전송할 데이터 설정
	        success: function(data) {  // 성공적으로 데이터를 받아왔을 때의 처리
	            // 받아온 데이터를 UI에 반영
	            let output = '<div class="resume-detail-area-box">';
	            output += '<h3 class="resume-title">' + data.title + '</h3>';
	            output += '<div>' + data.title + '</div>';
	            output += '</div>';
	            
	            $('.resume-detail-area').html(output);
	        },
	        error: function(error) {
	            console.error("Error fetching articles:", error);
	        }
	    });
	}

	$(document).ready(function() {
		let resume_no = 1;
		getResumeDetail(resume_no);
	});
	
	
	</script>
</body>
</html>