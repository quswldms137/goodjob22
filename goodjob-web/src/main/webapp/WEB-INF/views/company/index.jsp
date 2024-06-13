<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 메인페이지</title>
</head>
<body>
<h1>기업회원 메인페이지</h1>
<hr>
<div>
	<h3>등록한 채용공고 목록</h3>
</div>
<div>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th><th>채용공고 제목</th><th>현재 지원자수</th><th>마감까지 남은 기한</th><th>작성일자</th>
			</tr>
		</thead>
	<c:forEach var="recruit" items="" varStatus="status">
		<tbody>
			<tr>
				<td>${status.count }</td>
				<td>${recruit.title }</td>
				<td>${numberOfApplicants } 명</td>
				<td>D-${Dday }</td>
				<td>${recruit.reg_date }</td>
			</tr>
		</tbody>
	</c:forEach>
		</table>
</div>
</body>
</html>