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
	border: 1px solid #eee;
	border-radius:5px;
	box-sizing:border-box;
	padding-top:30px;
}

.userList-area {
	width: 800px;
	height: 460px;
	margin: 0 auto;
	padding-top: 60px;
	padding-left: 60px;
	padding-right: 60px;
}

.listTitle1{
	font-size: 20px;
	text-align: center;
}
.listTitle2 {
font-size: 20px;
	text-align: center;
	margin-top:100px;
}

#memberUser, #companyUser {
	margin: 50px 0;
}

.userList-title {
	display: flex;
	justify-content: space-between;
	background: #fff;
	border-top: 2px solid #000;
	padding: 20px 0;
	border-bottom: 1px solid #ccc;
}

.userList-title li {
	flex: 1;
	text-align: center;
	font-weight: bold;
	font-size: 18px;
}

.userList-cont {
	display: flex;
	justify-content: space-between;
}

.userList-cont:hover {
	background:#f7f7f7;
}

.userList-cont li {
	flex: 1;
	text-align: center;
	border-bottom: 1px solid #eee;
	padding: 15px 0;
}

#pages {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

#pages input[type="button"] {
	width: 30px;
	height: 30px;
	background: #fff;
	border: 1px solid #bbb;
	color:#bbb;
	cursor: pointer;
	margin: 0 5px;
	margin-top: 40px;
}

#pages input[type="button"]:hover {
	background:#f9f9f9;
}

.activePage {
	background:#fff !important; /* 원하는 색상으로 변경 */
	border:1px solid #333 !important;
	color: #333 !important; /* 텍스트 색상 */
}
.sidebar-box3 p:nth-child(2) a{
	color: #FB8500 !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../front/admin-header.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../front/admin-sidebar-all.jsp"%>
		</div>
		<div id="container">
		<h2 class="listTitle1">개인 회원 리스트</h2>
		<div id="memberUser"></div>
		<h2 class="listTitle2">기업 회원 리스트</h2>
		<div id="companyUser"></div>
		</div>
	</main>

	<footer>
		<%@ include file="../front/footer.jsp"%>
	</footer>
	<script type="text/javascript">
	$(document).ready(function(){
		
		/* 개인회원 리스트 기본 */
		$.ajax({
			url : "http://localhost:8888/api/member/list/1",
			method : "GET",
			dataType : "json",
			success : function(response){
				
				const totalItem = response[0].total;
				let pages = 0;
				
				if(totalItem % 5 > 0){
					pages = Math.ceil(totalItem / 5);
				}
				if(totalItem % 5 === 0){
					pages = totalItem / 5;
				}
				
				let str = '<div class="userList-area"><ul class="userList-title"><li>이름</li><li>가입일</li><li>아이디</li><li>연락처</li></ul>';
				
				response.forEach(member => {
					str += '<a href="/admin/member/detail/' + member.mem_no + '">';
					str += '<ul class="userList-cont">';
					str += '<li>'+ member.mem_name +'</li>';
					str += '<li>'+ member.make_date +'</li>';
					str += '<li>'+ member.username +'</li>';
					str += '<li>'+ member.mem_tel +'</li>';
					str += '</ul>';
					str += '</a>';
				});
				
				if(pages > 1){
					
					str += '<div id="pages">';
					for(let i = 0; i < pages; i++){
						str += '<input type="button" id="memberPage' + (i + 1) + '" value="' + (i + 1) + '" onclick="pageMemberList(event)" class="memberListBtn">';
					}
					str += '</div>';
					
					}
				
				str += '</div>';
				
				$("#memberUser").html(str);
				
			},
			error : function(xhr, status, error){
				
			}
		});
		
		/* 기업회원 리스트 기본 */
		$.ajax({
			url : "http://localhost:8888/api/company/list/1",
			method : "GET",
			dataType : "json",
			success : function(response){
				
				const totalItem = response[0].total;
				let pages = 0;
				
				if(totalItem % 4 > 0){
					pages = Math.ceil(totalItem / 4);
				}
				if(totalItem % 4 === 0){
					pages = totalItem / 4;
				}
				
				
				let str = '<div class="userList-area"><ul class="userList-title"><li>이름</li><li>가입일</li><li>아이디</li><li>연락처</li></ul>';
				
				response.forEach(company => {
					str += '<a href="/admin/company/detail/' + company.com_no + '">';
					str += '<ul class="userList-cont">';
					str += '<li>'+ company.com_name +'</li>';
					str += '<li>'+ company.make_date +'</li>';
					str += '<li>'+ company.username +'</li>';
					str += '<li>'+ company.mem_tel +'</li>';
					str += '</ul>';
					str += '</a>';
				});
				
				str += '</div>';
				
				
				if(pages > 1){
				str += '<div id="pages">';
					
				for(let i = 0; i < pages; i++){
					str += '<input type="button" id="companyPage' + (i + 1) + '" value="' + (i + 1) + '" onclick="pageCompanyList(event)" class="companyListBtn">';
				}
				str += '</div>';
				}
				
				$("#companyUser").html(str);
				
			},
			error : function(xhr, status, error){
				
			}
		});
		
	});
	
	$(document).ready(function(){
	    loadMemberList(1); // 기본적으로 첫 페이지를 로드합니다.
	    loadCompanyList(1); // 기본적으로 첫 페이지를 로드합니다.
	});

	
	/* 개인회원 리스트 페이지네이션 */
	function loadMemberList(page) {
	    $.ajax({
	        url: "http://localhost:8888/api/member/list/" + page,
	        method: "GET",
	        dataType: "json",
	        success: function(response){
	            const totalItem = response[0].total;
	            let pages = Math.ceil(totalItem / 5);
	            let str = '<div class="userList-area"><ul class="userList-title"><li>이름</li><li>가입일</li><li>아이디</li><li>연락처</li></ul>';
	            response.forEach(member => {
	                str += '<a href="/admin/member/detail/' + member.mem_no + '">';
	                str += '<ul class="userList-cont">';
	                str += '<li>'+ member.mem_name +'</li>';
	                str += '<li>'+ member.make_date +'</li>';
	                str += '<li>'+ member.username +'</li>';
	                str += '<li>'+ member.mem_tel +'</li>';
	                str += '</ul>';
	                str += '</a>';
	            });
	            if(pages > 1){
	                str += '<div id="pages">';
	                for(let i = 1; i <= pages; i++){
	                    let activeClass = (i === page) ? 'activePage' : '';
	                    str += '<input type="button" id="memberPage' + i + '" value="' + i + '" onclick="loadMemberList(' + i + ')" class="memberListBtn ' + activeClass + '">';
	                }
	                str += '</div>';
	            }
	            str += '</div>';
	            $("#memberUser").html(str);
	        },
	        error: function(xhr, status, error){
	            console.error(error);
	        }
	    });
	}

	
	/* 기업회원 리스트페이지네이션 */
	function loadCompanyList(page) {
	    $.ajax({
	        url: "http://localhost:8888/api/company/list/" + page,
	        method: "GET",
	        dataType: "json",
	        success: function(response){
	            const totalItem = response[0].total;
	            let pages = Math.ceil(totalItem / 4);
	            let str = '<div class="userList-area"><ul class="userList-title"><li>이름</li><li>가입일</li><li>아이디</li><li>연락처</li></ul>';
	            response.forEach(company => {
	                str += '<a href="/admin/company/detail/' + company.com_no + '">';
	                str += '<ul class="userList-cont">';
	                str += '<li>'+ company.com_name +'</li>';
	                str += '<li>'+ company.make_date +'</li>';
	                str += '<li>'+ company.username +'</li>';
	                str += '<li>'+ company.mem_tel +'</li>';
	                str += '</ul>';
	                str += '</a>';
	            });
	            if(pages > 1){
	                str += '<div id="pages">';
	                for(let i = 1; i <= pages; i++){
	                    let activeClass = (i === page) ? 'activePage' : '';
	                    str += '<input type="button" id="companyPage' + i + '" value="' + i + '" onclick="loadCompanyList(' + i + ')" class="companyListBtn ' + activeClass + '">';
	                }
	                str += '</div>';
	            }
	            str += '</div>';
	            $("#companyUser").html(str);
	        },
	        error: function(xhr, status, error){
	            console.error(error);
	        }
	    });
	}
</script>
</body>
</html>
