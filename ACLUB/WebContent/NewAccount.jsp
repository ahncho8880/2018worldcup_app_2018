<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,shrink-to-fit=no">
<title>JOIN TO ACLUB</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light by light">
		<a class="navbar-brand" href="index.jsp">신규회원가입</a>
	</nav>
	<section class="container mt-3" style="max-width: 450px;">
		<form method="post" action="./userJoinAction.jsp">
			<div class="form-group">
				<label>아이디</label> <input type="text" name="userID"
					class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="text" name="userPassword"
					class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">신규가입</button>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>