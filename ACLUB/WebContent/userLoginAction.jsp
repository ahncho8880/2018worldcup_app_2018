<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID") != null){
		userID = (String)request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = (String)request.getParameter("userPassword");
	}
	
	if(userID.equals("") || userPassword.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 입력');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result= userDAO.login(userID, userPassword);
	if(result ==1){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href ='Board.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else if(result ==0){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 틀림')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}else if(result ==-1){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재 하지 않음')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}else if(result ==-2){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB 오류')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
%>