<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="user.UserDTO" %>
<%@ page import ="user.UserDAO" %>
<%@ page import ="userbet.userBetDAO" %>
<%@ page import ="userbet.userBetDTO" %>
<%@ page import ="answer.answerDAO" %>
<%@ page import ="answer.answerDTO" %>
<%@ page import ="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

			
	String awinteam=null;
	String aloseteam=null;
	int awinscore=-1;
	int alosescore=-1;
	String result=null;
	
	

	if(request.getParameter("awinscore") != null){
		try{
			awinscore = Integer.parseInt(request.getParameter("awinscore"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	if(request.getParameter("alosescore") != null){
		try{
			alosescore =Integer.parseInt(request.getParameter("alosescore"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	
	if(awinscore==-1 || alosescore==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('헤헤헤');");
		script.println("history.back();");
		script.println("</script>");	
		script.close();
		return;
	}
	
	if(awinscore>alosescore){
		result="w";
	}else if(awinscore<alosescore){
		result="l";
	}else if(awinscore == alosescore){
		result="d";
	}
	
	answerDAO answerDAO = new answerDAO(); 	
	
	int input = answerDAO.uploadAnswer(awinscore, alosescore, result);
	
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