<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: #2E95EF;
    background-image: -moz-radial-gradient(center 45deg,circle cover, #9BD1FF, #2E95EF);
    background-image: -webkit-gradient(radial, 50% 50%, 0, 50% 50%,800, from(#9BD1FF), to(#2E95EF));
    padding-top: 15%;
}
.img-error{
width:220px;
height:220px;
}
</style>
</head>
<body>
<!-- 준비중입니다 메세지 페이지 -->
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right" style="margin-top:10px;">
                <div class="col-md-10 col-md-offset-1 pull-right">
                    <img class="img-error" src="https://bootdey.com/img/Content/fdfadfadsfadoh.png">
                    <h2>준비중인 페이지 입니다</h2>
                    <p>죄송합니다, 기업메인 페이지로 돌아가셔야 합니다.</p>
                    <div class="error-actions">
                        <a href="/company" class="btn btn-primary btn-lg">
                            <span class="glyphicon glyphicon-arrow-left"></span>
                            기업 페이지로
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>