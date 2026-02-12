<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>
 
 <%
 	String examModeName=request.getParameter("examModeName");

 	examModeName=examModeName.substring(0, 1).toUpperCase() + examModeName.substring(1);
 	
 	ExamModeBean examModeBean=new ExamModeBean();
	 
 	examModeBean.setExamModeName(examModeName.trim());
 	
 	boolean flag=ExamModeDAO.insertExamMode(examModeBean);
 	
 	if(flag)
 		response.sendRedirect("manageExamModes.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    