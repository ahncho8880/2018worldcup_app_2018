<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="userbet.userBetDTO"%>
<%@ page import="userbet.userBetDAO"%>
<%@ page import="answer.answerDAO"%>
<%@ page import="answer.answerDTO"%>
<%@ page import="answerTeam.teamDTO"%>
<%@ page import="answerTeam.teamDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
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
	<nav class="navbar navbar-expand-lg navbar-light by light">
		<a class="navbar-brand" href="Board.jsp">ACLUBET 365</a> 
		<a href="https://www.google.co.kr/search?q=%EC%9B%94%EB%93%9C%EC%BB%B5+%EB%8C%80%EC%A7%84%ED%91%9C&source=lnms&sa=X&ved=0ahUKEwin3_6KvbXbAhVDKZQKHcDcCKEQ_AUICSgA&biw=1536&bih=710&dpr=1.25#sie=lg;/m/06qjc4;2;/m/030q7;mt;fp;1" class="navbar">go google</a>
		<a class="navbar" href="userLogout.jsp">logout</a>
	</nav>
	<div class="alert alert-primary" role="alert">
		
 		 <%
 		 	answerDAO answer = new answerDAO();
 		 	ArrayList<answerDTO> list = answer.getAnswer();
 		 	teamDAO dao = new teamDAO();
 		 	ArrayList<teamDTO> team = dao.getTeam();
 		 	
 		 	UserDTO user = new UserDTO();
 		 	
 		 	String userID = null;
 			if(session.getAttribute("userID")!=null){
 				userID=(String)session.getAttribute("userID");	
 			}else{
 				PrintWriter script = response.getWriter();
 				script.println("<script>");
 				script.println("alert('로그인하셈');");
 				script.println("location.href='index.jsp';");
 				script.println("</script>");
 				script.close();
 				return;
 			}
 		 	user.setUserID(userID);
 		 	
 			userBetDAO match = new userBetDAO();
 			ArrayList<userBetDTO> matchNo = match.getUsers(user);
 		 %>
 		<%--  <h4><%=userID+"의 경기" %></h4> --%>
 			<h4>오늘의 경기</h4>
 		 <%
 		 for(int i = matchNo.size() ; i < team.size(); i++){
 			 %>
 			 <h6>
 			<%=team.get(i).getNo() +"Round"%>
 		 	<%=team.get(i).getHome()%> vs <%=team.get(i).getAway() %>    
 		 	</h6>
 		 	<% 
 		 }
 		 %>
	</div>
	<section class="container mt-3">
		<form action="./userBetAction.jsp">
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputCity">승리팀 or무승부</label> <input type="text"
						class="form-control" name="team">
				</div>
				<div class="form-group col-md-1">
					<label for="inputZip">home</label> <input type="text"
						class="form-control" name="winScore">
				</div>
				<div class="form-group col-md-1">
					<label for="inputZip">away</label> <input type="text"
						class="form-control" name="loseScore">
				</div>
			</div>

			<button type="submit" class="btn btn-primary">제출하기</button>
		</form>
	</section>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>