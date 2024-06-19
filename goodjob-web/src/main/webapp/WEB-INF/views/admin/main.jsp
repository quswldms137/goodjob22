<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #ccc;
	box-sizing:border-box;
}
.logo a img{
	width: 300px;
}
.logo{
	text-align: center;
}
.userList-area{
	width:800px;
	height:460px;
	margin:0 auto;
	border:1px solid #eee;
	padding-top:60px;
	padding-left:60px;
	padding-right:60px;
}
.listTitle1,
.listTitle2{
	font-size:20px;
	text-align:center;
}

#memberUser,
#companyUser {
	margin: 50px 0;
}

.userList-title{
	display:flex;
	justify-content:space-between;
	background:#fff;
	border-top:2px solid #000;
	padding:20px 0;
	border-bottom:1px solid #ccc;
}
.userList-title li{
	flex:1;
	text-align:center;
	font-weight:bold;
	font-size:18px;
}

.userList-cont{
	display:flex;
	justify-content:space-between;
}
.userList-cont:hover{
	background:rgb(251, 133, 0, 0.1);
}
.userList-cont li{
	flex:1;
	text-align:center;
	border-bottom:1px solid #eee;
	padding:15px 0;
}

#pages{
	width:800px;
	margin:0 auto;
	text-align:center;
}
#pages input[type="button"]{
	width:30px;
	height:30px;
	background:#fff;
	border:1px solid #333;
	cursor:pointer;
	margin:0 5px;
	margin-top:40px;
}
#pages input[type="button"]:hover{
	background:rgb(251, 133, 0, 0.1);
}
.sidebar-box2 p:nth-child(2) a{
	color: #FB8500 !important;
}


</style>
		<%@ include file="../front/admin-header.jsp"%>
</head>
<body>
	<header>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/admin-sidebar-all.jsp"%>
		</div>
		 <div class="container">
        <h1>Monthly Dashboard</h1>
        <canvas id="userChart"></canvas>
        <canvas id="sponsorshipChart"></canvas>
    </div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	const userChart = document.getElementById('userChart').getContext('2d');
	const sponsorshipChart = document.getElementById('sponsorshipChart').getContext('2d');

	const userData = {
	    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	    datasets: [
	        {
	            label: 'Individual Users',
	            data: [120, 150, 180, 200, 230, 250, 300, 320, 310, 400, 420, 500],
	            backgroundColor: 'rgba(75, 192, 192, 0.2)',
	            borderColor: 'rgba(75, 192, 192, 1)',
	            borderWidth: 1
	        },
	        {
	            label: 'Corporate Users',
	            data: [30, 50, 70, 80, 90, 100, 120, 140, 150, 160, 180, 200],
	            backgroundColor: 'rgba(153, 102, 255, 0.2)',
	            borderColor: 'rgba(153, 102, 255, 1)',
	            borderWidth: 1
	        }
	    ]
	};

	const sponsorshipData = {
	    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	    datasets: [
	        {
	            label: 'Corporate Sponsorship',
	            data: [1000, 2000, 1500, 2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500],
	            backgroundColor: 'rgba(255, 159, 64, 0.2)',
	            borderColor: 'rgba(255, 159, 64, 1)',
	            borderWidth: 1
	        }
	    ]
	};

	const userChartConfig = {
	    type: 'line',
	    data: userData,
	    options: {
	        responsive: true,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	};

	const sponsorshipChartConfig = {
	    type: 'bar',
	    data: sponsorshipData,
	    options: {
	        responsive: true,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	};

	Chart chart = new Chart(userChart, userChartConfig);
	Chart chart2 = new Chart(sponsorshipChart, sponsorshipChartConfig);
	</script>
</body>
</html>




