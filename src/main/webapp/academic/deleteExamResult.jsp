<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamScoreDAO"%>
<%@ page import="com.luminar.model.ExamScoreBean"%>   


<%
	int resultId = Integer.parseInt(request.getParameter("resultId"));
	
	boolean flag=ExamScoreDAO.deleteExamScore(resultId);
 
 	if(flag)
		response.sendRedirect("manageExamResult.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>