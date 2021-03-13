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
	
	userScoreDAO usd =new userScoreDAO();
	ArrayList<userScoreDTO> sum = ubd.getTotalScore(); //총합불러오기
	
	UserPointDAO upa = new UserPointDAO();	//총합 넣기
//	int total=0;
	for(int i=0;i<id.size();i++){
		result=upa.setTotalScore(sum.get(i));
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