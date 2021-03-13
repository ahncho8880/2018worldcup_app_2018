<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="nowuserpoint.UserPointDTO"%>
<%@ page import="nowuserpoint.UserPointDAO"%>
<%@ page import="java.util.ArrayList"%>
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
		<a class="navbar-brand" href="Board.jsp">ACLUBET 365</a> <a class="navbar"
			href="userLogout.jsp">logout</a>
	</nav>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">이름</th>
				<th scope="col">현재점수</th>
			</tr>
		</thead>
		<tbody>

			<%
			
	UserPointDAO upd = new UserPointDAO();
	ArrayList<UserPointDTO> list = upd.getuserinfo() ;
	int rank=1;
	for(int i=0;i<list.size();i++){
%>
			<tr>
			<%
			if(i>0){
				if(list.get(i).getTotalPoint()==list.get(i-1).getTotalPoint())
					rank--;
			}
			%>
				<td><%=rank%></td>
				<td><%=list.get(i).getUserID() %></td>
				<td><%=list.get(i).getTotalPoint() %></td>
			</tr>
			<%
			rank++;
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