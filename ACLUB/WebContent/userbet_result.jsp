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
		<a class="navbar-brand" href="Board.jsp">ACLUBET 365</a> <a
			class="navbar-link" href="userLogout.jsp">logout</a>
	</nav>
	<% 
		
		answerDAO score = new answerDAO();
		ArrayList<answerDTO> showscore = score.getAnswer();
		
		UserDAO ud = new UserDAO();
  		ArrayList<UserDTO> id= ud.getUserid();
  		
		userBetDAO ubd = new userBetDAO();
		
		teamDAO td = new teamDAO();
		ArrayList<teamDTO> team = td.getTeam();
		
	%>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<% 
      	for(int i=0;i<id.size();i++){
      %>
				<th scope="col"><%=id.get(i).getUserID() %></th>
				<%
      	}
      %>
			</tr>
		</thead>
		<tbody>
			<%
    for(int i=showscore.size();i<team.size();i++){
    %>
			<tr>
				<th scope="row"><font size="2"> <%=team.get(i).getHome() %> vs <%=team.get(i).getAway()%></font></th>
				<%
      
      for(int j=0;j<id.size();j++){
  		try{ 
    	  ArrayList<userBetDTO> list = ubd.getusergame(id.get(j), team.get(i));
    	  %>
				<td><font size="2"><%=list.get(0).getTeam() %> <%=list.get(0).getWinScore() %>
					: <%=list.get(0).getLoseScore() %></font></td>
				<%
  		}catch(Exception e){
  			PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('제출하지 않은 사람이 있습니다. 잠시만 기다려주세요');");
    		script.println("history.back();");
    		script.println("</script>");
    		script.close();
  		}
     	 }
      %>
			</tr>
			<%
  		  }
      %>
		</tbody>
	</table>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>