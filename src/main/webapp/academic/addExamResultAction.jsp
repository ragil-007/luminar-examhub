<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

 <%@ page import="com.luminar.dao.ExamScoreDAO"%>
 <%@ page import="com.luminar.model.ExamScoreBean"%>
 
 <%
 	int examDetailId=Integer.parseInt(request.getParameter("examId"));
 	int studentId=Integer.parseInt(request.getParameter("studentId"));
 	int examScore=Integer.parseInt(request.getParameter("examScore"));
 	String examComments=request.getParameter("examComments");
 	
 	ExamScoreBean examScoreBean=new ExamScoreBean();
	 
 	examScoreBean.setExamDetailId(examDetailId);
 	examScoreBean.setStudentId(studentId);
 	examScoreBean.setExamScore(examScore);
 	examScoreBean.setComments(examComments);
 	
 	boolean flag=ExamScoreDAO.insertExamScore(examScoreBean);
 	
 	if(flag)
 		response.sendRedirect("manageExamResult.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>  