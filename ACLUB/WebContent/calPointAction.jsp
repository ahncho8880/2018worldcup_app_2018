<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	int result=0;
	
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
			result=ubd.setpoint(user.get(j), score[j], id.get(i));
		}
	}
	

	if(result == 1){
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