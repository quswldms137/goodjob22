<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	padding: 0 20px; /* 양옆에 20px 간격을 추가 */
	
	display:grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: auto auto;
	gap: 10px; /* 각 div 요소 사이의 간격 */
}
#mainCompanyInfo{
	border: 1px solid #eee;
	width:800
}
.info{
	border: 1px solid #eee; /* 각 div 요소의 테두리 설정 (디버깅용) */
	padding: 20px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>

	<main>
		<div id="mainCompanyInfo">
		
		</div>
		<div class="info" id="companyInfo">
		
		</div>
		<div class="info" id="postingInfo">
		
		</div>
		<div class="info" id="salaryInfo">
		
		</div>
		<div class="info" id="letterInfo">
		
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
</body>
</html>