<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.company-nav ul li:nth-child(2) a {
	border-bottom: 5px solid #FB8500;
	padding-bottom: 10px;
}

  table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

</style>
</head>
<body>
<header>
		<%@ include file="../front/company-header.jsp"%>
</header>
<!-- 메인 내용 -->
<main>
		<div class="sidebar-container">
			<%@ include file="../front/company-sidebar-all.jsp"%>
		</div>
		<div id="container">
			<table border=1>
				<thead>
					<tr>
						<th>채용공고</th><th>이름</th><th>이력서요약</th><th>구직상태</th><th>포지션제안</th>
					</tr>
				</thead>
				<tbody>
					<
				</tbody>
			</table>
		</div>
	</main>
<!-- 여기까지 -->


<footer>
		<%@ include file="../front/footer.jsp"%>
</footer>
</body>
</html>