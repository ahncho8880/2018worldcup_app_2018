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
		UserDAO ud = new UserDAO();
  		ArrayList<UserDTO> id= ud.getUserid();
		userBetDAO ubd = new userBetDAO();
		teamDAO td = new teamDAO();
		ArrayList<teamDTO> team = td.getTeam();
		
		answerDAO score = new answerDAO();
		ArrayList<answerDTO> showscore = score.getAnswer();
	%>
	<font color="black">0pt</font>
	<font color="blue">1pt</font>
	<font color="red">2pt</font>
	<table class="table table-striped" data-page-size="1">
		<thead>
			<tr>
				<th scope="col">결과</th>
				<% 
      	for(int i=id.size()-1;i>=0;i--){
      %>
				<th scope="col"><%=id.get(i).getUserID() %></th>
				<%
      	}
      %>
			</tr>
		</thead>
		<tbody>
			<%
    for(int i=showscore.size()-1;i>=0;i--){
    %>
			<tr>
				<th scope="row"><font size="2"><%="["+team.get(i).getNo() %>round] 
				<%=team.get(i).getHome() %> vs <%=team.get(i).getAway() %>
				<%="("+showscore.get(i).getWinscore()+":"+showscore.get(i).getLosescore()+")"%></font></th>
				<%
      
      for(int j=id.size()-1;j>=0;j--){
  		
    	  ArrayList<userBetDTO> list = ubd.getusergame(id.get(j), team.get(i));
    	  if(list.get(0).getPoint()==1){
    		  %>
    			<td><font color="blue" size="2"><%=list.get(0).getTeam() %> <%=list.get(0).getWinScore() %>
					: <%=list.get(0).getLoseScore() %></font></td>
    		  <%
    	  }
    	  else if(list.get(0).getPoint()==2){
    		  %>
    			<td><font color="red" size="2"><%=list.get(0).getTeam() %> <%=list.get(0).getWinScore() %>
					: <%=list.get(0).getLoseScore() %></font></td>
    		  <%
    	  }
    	  else{
    	  %>
				<td><font size="2"><%=list.get(0).getTeam() %> <%=list.get(0).getWinScore() %>
					: <%=list.get(0).getLoseScore() %></font></td>
				<%
    	  }
     	 }
      %>
			</tr>
			<%
  		  }
      %>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
    		<li class="page-item"><a class="page-link" href="#"><%="<<" %></a></li>
    		<li class="page-item"><a class="page-link" href="#"><%=">>" %></a></li>
  		</ul>
	</nav>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>