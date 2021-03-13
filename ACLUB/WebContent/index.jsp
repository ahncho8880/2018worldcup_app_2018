<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,shrink-to-fit=no">
<title>WELCOME TO ACLUB</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light by light color">
		<a class="navbar-brand" href="index.jsp" color="orange">ACLUBET 365</a>
	</nav>
		
		<img src="image/circle_analysis.png" class="img-fluid" width="200" height="100" alt="Responsive image" style="margin-left: auto; margin-right: auto; display: block;">
		<!-- <img src="image/Neymar-2018-FIFA-World-Cup.jpg" class="img-thumbnail" width="400" height="300" style="margin-left: auto; margin-right: auto; display: block;"> -->
	<section class="container mt-3" style="max-width: 450px;">
		<form method="post" action="./userLoginAction.jsp">
			<div class="form-group">
				<label>아이디</label> <input type="text" name="userID"
					class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" name="userPassword"
					class="form-control">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">로그인</button>
				<a class="btn btn-primary mx-1 mt2" href='NewAccount.jsp'>회원가입</a>
			</div>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>