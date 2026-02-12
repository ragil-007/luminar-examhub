<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.luminar.model.LoginBean" %>
<%@page import="com.luminar.dao.LoginDAO" %>
<%@page import="com.luminar.dto.LoginResultDTO" %>

<%

String userName=request.getParameter("username");
String passWord=request.getParameter("pass");

LoginBean lb=new LoginBean();
lb.setUserName(userName);
lb.setPassWord(passWord);

LoginResultDTO loginResult=LoginDAO.checkLogin(lb);

if(loginResult==null ||loginResult.getRole()=="" ){
	response.sendRedirect("index.html");
}else if("admin".equals(loginResult.getRole())){
	session.setAttribute("user", loginResult.getUserName());
	session.setAttribute("role", loginResult.getRole());
	response.sendRedirect("admin/adminHome.jsp");
}else if("academic".equals(loginResult.getRole())){
	session.setAttribute("user", loginResult.getUserName());
	session.setAttribute("role", loginResult.getRole());
	response.sendRedirect("academic/academicHome.jsp");
}else if("hr".equals(loginResult.getRole())){
	session.setAttribute("userId", loginResult.getUserId());
	session.setAttribute("user", loginResult.getUserName());
	session.setAttribute("role", loginResult.getRole());
	response.sendRedirect("hr-trainer/hrAndTrainerHome.jsp");
}else if("trainer".equals(loginResult.getRole())){
	session.setAttribute("userId", loginResult.getUserId());
	session.setAttribute("user", loginResult.getUserName());
	session.setAttribute("role", loginResult.getRole());
	response.sendRedirect("hr-trainer/hrAndTrainerHome.jsp");
}else{
	response.sendRedirect("index.html");
}


%>
