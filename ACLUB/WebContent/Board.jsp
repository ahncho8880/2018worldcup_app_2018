<%@page import="nowuserpoint.UserPointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="nowuserpoint.UserPointDAO"%>
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
	<nav class="navbar navbar-expand-lg navbar-light by light">
		<a class="navbar-brand" href="Board.jsp">ACLUBET 365</a> <a
			class="navbar-link" href="userLogout.jsp">logout</a>
	</nav>

	<div class="alert alert-info" role="alert">
	<% 
	UserPointDAO upd = new UserPointDAO();
	ArrayList<UserPointDTO> list = upd.getuserinfo() ;
	int rank=1;
	for(int i=0;i<list.size();i++){ 
	%>
		<%
			if(i>0){
				if(list.get(i).getTotalPoint()==list.get(i-1).getTotalPoint())
					rank--;
			}
			%>
	<%=list.get(i).getUserID()+" "+list.get(i).getTotalPoint()+"점" %>
	<br>
	<%
	if(i==list.size()-1){
		%>
		<hr>
		<font color="red">현재 후보</font><br>
		<%
		if(list.get(i).getUserID().equals("박대현")){
			%>
			<img src="image/park.PNG" class="img-thumbnail" width="100" height="50">
			<% 
		}else if(list.get(i).getUserID().equals("안철현")){
			%>
			<img src="image/ahn.PNG" class="img-thumbnail" width="100" height="50">
			<% 
		}else if(list.get(i).getUserID().equals("김원준")){
			%>
			<img src="image/kim.PNG" class="img-thumbnail" width="100" height="50">
			<%
		}
	}
	
	%>
	
	<%
	
		} 
	%>
</div>
	<a class="btn btn-primary btn-lg btn-block" href='registerBet.jsp'>신규
		내기 등록</a>
	<a class="btn btn-primary btn-lg btn-block" href='userbet_result.jsp'>오늘의
		내기</a>
	<a class="btn btn-primary btn-lg btn-block" href='totalscoreview.jsp'>결과 보기</a>
	<a class="btn btn-primary btn-lg btn-block" href='scoreBoard.jsp'>현재
		점수판</a>
	<a class="btn btn-primary btn-lg btn-block" href='adminonly.jsp'>ONLY
		ADMIN</a>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy 2018 ACLUB All Rights Reserved. </footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>