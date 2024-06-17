<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<%@ include file="../front/company-header.jsp"%>
</header>
<!-- 메인 내용 -->>
<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<p>이력서 지원받은 페이지</p>
			<table>
				<thead>
					<tr>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="recruit" items="" varStatus="status">
					<tr class="recruits">
						<td>ㅎ${recruit.com_name }</td>
						<td>ㅊ${recruit.title }</td>
						<td><input type="button" value="수정" onclick="updateRecruit()"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</main>

<!-- 여기까지 -->>


<footer>
		<%@ include file="../front/footer.jsp"%>
</footer>
</body>
</html>