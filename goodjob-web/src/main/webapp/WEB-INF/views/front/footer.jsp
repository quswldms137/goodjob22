<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer{
		width:100%;
		margin:0 auto;
		background:#fff;
		border-top:1px solid #eee;
	}
	#foot{
		width:1100px;
		margin:0 auto;
		padding:25px 0;
	}
	
	.foot-in1,
	.foot-in2,
	.foot-in3{
		display:flex;
		justify-content:center;
		gap:25px;
	}
	.foot-in1 li a,
	.foot-in2 li,
	.foot-in3 li{
		display:inline-block;
		color:#878787;
		font-size:14px;
		padding:20px 0;
	}
	.foot-in2 li span{
		color:#333;
	}
</style>
</head>
<body>
	<footer>
		<div id="foot">
			<ul class="foot-in1">
				<li><a href="#">고객센터</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">광고문의</a></li>
				<li><a href="#">기업소개</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
			<ul class="foot-in2">
				<li><span>고객센터 : </span>1588-9350</li>
				<li><span>FAX : </span>051-565-9351</li>
				<li><span>Email : </span>goodjob@gmail.com</li>
			</ul>
			<ul class="foot-in3">
				<li>ⓒ GoodJob. All rights reserved.</li>
			</ul>
		</div>
	</footer>
</body>
</html>