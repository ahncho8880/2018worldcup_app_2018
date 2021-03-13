<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="userbet.userBetDAO"%>
<%@ page import="userbet.userBetDTO"%>
<%@ page import="answer.answerDAO"%>
<%@ page import="answer.answerDTO"%>
<%@ page import="userscore.userScoreDAO"%>
<%@ page import="userscore.userScoreDTO"%>
<%@ page import="nowuserpoint.UserPointDAO"%>
<%@ page import="nowuserpoint.UserPointDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
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
	
	if(input==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제출 실패');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
	}
	
	
	
	int results=0;
	
	UserDAO ud = new UserDAO();				
	ArrayList<UserDTO> id = ud.getUserid();		//id가져오기
	
	userBetDAO ubd = new userBetDAO();
	
	answerDAO ad = new answerDAO();
	ArrayList<answerDTO> answer = ad.getAnswer();
	
	int[] score = new int[answer.size()];
	userScoreDAO userScoreDAO = new userScoreDAO();
	
	for(int i=0;i<id.size();i++){
		ArrayList<userBetDTO> user = ubd.getUsers(id.get(i));
		for(int j=0;j<answer.size();j++){
			score[j]=0;
			if(user.get(j).getResult().equals(answer.get(j).getResult())){
				score[j]++;
				if(user.get(j).getWinScore() == answer.get(j).getWinscore() && user.get(j).getLoseScore() == answer.get(j).getLosescore()){
					score[j]++;
				}
			}
			//result=userScoreDAO.setPoint(id.get(i), score[j]);
			results=ubd.setpoint(user.get(j), score[j], id.get(i));
		}
	}
	

	if(results != 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('전송실패');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
		}
	
	int result2=0;
	
	UserDAO uds = new UserDAO();				
	ArrayList<UserDTO> ids = uds.getUserid();		//id가져오기
	
	userBetDAO ubds = new userBetDAO();
	
	userScoreDAO usd =new userScoreDAO();
	ArrayList<userScoreDTO> sum = ubds.getTotalScore(); //총합불러오기
	
	UserPointDAO upa = new UserPointDAO();	//총합 넣기
//	int total=0;
	for(int i=0;i<ids.size();i++){
		result2=upa.setTotalScore(sum.get(i));
	}
	
	if(result2 == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('전송완료');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
		}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('전송실패');");
		script.println("location.href='adminpage.jsp';");
		script.println("</script>");	
		script.close();
		return;
		}
%>