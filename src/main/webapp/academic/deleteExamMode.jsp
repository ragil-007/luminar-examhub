<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>

<%@ page errorPage="error.jsp" %>

<%
	int examModeId = Integer.parseInt(request.getParameter("modeId"));
	
	boolean flag=ExamModeDAO.deleteExamMode(examModeId);
 
 	if(flag)
		response.sendRedirect("manageExamModes.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>