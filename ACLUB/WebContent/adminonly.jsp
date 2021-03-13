<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="userbet.userBetDAO"%>
<%@ page import="userbet.userBetDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String tmp = (String)session.getAttribute("userID");
	
	
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

	if(tmp.equals("안철현")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('only admin');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
%>