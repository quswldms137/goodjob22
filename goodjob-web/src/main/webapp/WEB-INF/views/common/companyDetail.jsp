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
	
	padding: 0 20px; /* 양옆에 20px 간격을 추가 */
	
	display:grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: auto auto;
	gap: 10px; /* 각 div 요소 사이의 간격 */
}
#mainCompanyInfo{
	border: 1px solid #eee;
	width: 1100px;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	margin: 80px auto;
	
	display:flex;
	
	align-items: center; /* 수직 가운데 정렬 */
}
#companyImg_url{
	border: 1px solid #eee;
	width: 300px;
	height: 177px;
	padding: 15px;
	box-sizing: border-box;
}
#companyName{
	font-size:40px;
	text-align: left; /* 텍스트를 왼쪽 정렬 */
	padding-left: 20px; /* 왼쪽 패딩 추가 */
	flex-grow: 1; /* 남은 공간을 차지 */
}
.info{
	border: 1px solid #eee; /* 각 div 요소의 테두리 설정 (디버깅용) */
	padding: 20px;
	box-sizing: border-box;
}
table {
	width: 100%;
	border-collapse: collapse;
	margin-top:15px;
}
th, td {
	padding: 10px;
	text-align: left;
	font-size:14px;
}
th {
	padding-right: 20px; /* th와 td 사이에 공간 추가 */
}
.postingList{
	margin-top:20px;
	padding:20px;
	
	border: 1px solid #eee;
}
#companyName2{
	margin-top:25px;
	font-size:20px;
	padding:20px;
	
	border: 1px solid #eee;
	width:458px;
	height:200px;
	
	position: relative;
}
.money-container {
	display: flex; /* Flexbox 사용하여 가로 정렬 */
	margin-top: 45px; /* 실선 아래에 위치하도록 간격 추가 */
	justify-content: space-around; /* 자식 요소 사이의 간격 설정 */
	width: 100%;
}
.money{
	border: 1px solid #eee;
	padding: 40px;
	font-size:20px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/header.jsp"%>
	</header>
	
	<div id="mainCompanyInfo">
		<div id="companyImg_url">
			<img src="">기업사진
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
                        <!-- 여기에 AJAX를 통해 데이터를 삽입합니다 -->
                    </tbody>
                </table>
			</div>
		</div>
		<div class="info" id="postingInfo">
			채용공고
			<div>
				<div class="postingList">채용공고리스트1</div>
				<div class="postingList">채용공고리스트2</div>
				<div class="postingList">채용공고리스트3</div>
			</div>
		</div>
		<div class="info" id="salaryInfo">
			연봉정보
			<div id="companyName2">삼성전자(주)
				<div class="money-container">
					<div class="money">전체 평균 연봉
						<div> 10,376만원</div>
					</div>
					<div class="money">신입사원 초봉
						<div> 5,035만원</div>
					</div>
				</div>
			</div>
		</div>
		<div class="info" id="letterInfo">
			합격후기
			<div>
				<div class="postingList">합격후기1</div>
				<div class="postingList">합격후기2</div>
				<div class="postingList">합격후기3</div>	
			</div>
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	
<script>
$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8888/api/com-detail/companyInfo",
        method: "GET",
        dataType: "json", // 서버에서 반환되는 데이터 타입을 명시
        success: function(data) {
            let companyDetail = data[0]; // 데이터의 첫 번째 객체를 가져옴
            console.log(companyDetail);
            // 가져온 데이터를 변수에 저장
            let sectors = companyDetail.sectors;
            let amount = companyDetail.amount;
            let comType = companyDetail.com_type;
            let foundation = companyDetail.foundation;
            let comCeo = companyDetail.com_ceo;
            let pension = companyDetail.pension;
            let comAddr = companyDetail.com_addr;
            let url = companyDetail.url;
			
          	console.log("값:",sectors );
            // DOM에 데이터 삽입
            $("#companyInfoDetails").html(
                " <table> " +
                   " <tr><th>산업</th><td>"+sectors+"</td><th>사원수</th><td>"+amount+"</td></tr> " +
                   " <tr><th>기업형태</th><td>"+comType+"</td><th>설립일</th><td>"+foundation+"</td></tr> " + 
                   " <tr><th>대표자</th><td>"+comCeo+"</td><th>연금/보험</th><td>"+pension+"</td></tr> " +
                   " <tr><th>주소</th><td>"+comAddr+"</td><th>기업사이트</th><td>"+url+"</td></tr> " +
               " </table> "
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