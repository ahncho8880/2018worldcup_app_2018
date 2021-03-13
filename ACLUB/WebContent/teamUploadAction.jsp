<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="answerTeam.teamDTO"%>
<%@ page import="answerTeam.teamDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

			
	String hometeam=null;
	String awayteam=null;
	int awinscore=-1;
	int alosescore=-1;
	String result=null;
	
	
	if(request.getParameter("hometeam") != null){
		hometeam = (String)request.getParameter("hometeam");
	}
	if(request.getParameter("awayteam") != null){
		awayteam = (String)request.getParameter("awayteam");
	}
	
	teamDAO teamDAO = new teamDAO();
	int input = teamDAO.setTeam(hometeam, awayteam);
	
	if(input==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제출 완료');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
		}else if(input==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제출 실패');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}
%>