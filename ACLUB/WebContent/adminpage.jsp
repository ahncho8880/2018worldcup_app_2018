<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="answerTeam.teamDTO"%>
<%@ page import="answerTeam.teamDAO"%>
<%@ page import="answer.answerDAO"%>
<%@ page import="answer.answerDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1,shrink-to-fit=no">
<title>WELCOME TO ACLUB</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light by light">
		<a class="navbar-brand" href="Board.jsp">ADMIN</a>
	</nav>

	<section class="container mt-3">
		<form action="./teamUploadAction.jsp">
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputCity">hometeam</label> <input type="text"
						class="form-control" name="hometeam">
				</div>

				<div class="form-group col-md-2">
					<label for="inputCity">awayteam</label> <input type="text"
						class="form-control" name="awayteam">
				</div>
			</div>

			<button type="submit" class="btn btn-primary">경기 제목 업로드</button>
		</form>

		<form action="./AdminSubmitAction.jsp">
			<%
				teamDAO dao = new teamDAO();
				ArrayList<teamDTO> list = dao.getTeam();
				answerDAO dao2 = new answerDAO();
				ArrayList<answerDTO> lists = dao2.getAnswer();
				
				
			%>
			
			<div class="form-row">
				<div class="form-group col-md-1">
					<label for="inputZip"><%=list.size() != lists.size() ? list.get(lists.size()).getHome() : "제출"%></label> <input type="text"
						class="form-control" name="awinscore">
				</div>
				<div class="form-group col-md-1">
					<label for="inputZip"><%=list.size() != lists.size() ? list.get(lists.size()).getAway() : "완료"%></label> <input type="text"
						class="form-control" name="alosescore">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">결과 스코어 업로드</button>
		</form>
<!-- 		<a class="btn btn-primary" href='calPointAction.jsp'>승무패 점수 계산</a> <a
			class="btn btn-primary" href='totalCalAction.jsp'>점수 합산</a> -->
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>