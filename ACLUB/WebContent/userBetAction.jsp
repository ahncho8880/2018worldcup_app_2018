<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="userbet.userBetDAO"%>
<%@ page import="userbet.userBetDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userID=null;
	String team=null;
	int winScore=-1;
	int loseScore=-1;
	String result=null;
	int getPoint=0;	
	
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
	
	if(request.getParameter("team") != null){
		team = (String)request.getParameter("team");
	}
	
	
	if(request.getParameter("winScore") != null){
		try{
			winScore = Integer.parseInt(request.getParameter("winScore"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	if(request.getParameter("loseScore") != null){
		try{
			loseScore =Integer.parseInt(request.getParameter("loseScore"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	
	if(team.equals("") || winScore==-1 || loseScore==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된거 있음');");
		script.println("location.href='registerBet.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}
	
	if(winScore>loseScore){
		result="w";
	}else if(winScore<loseScore){
		result="l";
	}else if(winScore == loseScore){
		result="d";
	}
	int no=0;
	userBetDAO userBetDAO = new userBetDAO(); 
	int matchnum;
	userBetDTO mat = userBetDAO.setmatchNo(userID);
	matchnum=mat.getMatchNo();
	int input = userBetDAO.uploadBet(matchnum, userID, team, winScore, loseScore, result);

	if(input==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제출 완료');");
		script.println("location.href='registerBet.jsp';");
		script.println("</script>");	
		script.close();
		return;
		}else if(input==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제출 실패');");
		script.println("location.href='registerBet.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}
%>