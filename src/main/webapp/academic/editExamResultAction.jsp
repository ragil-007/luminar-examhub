<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.luminar.dao.ExamScoreDAO"%>
 <%@ page import="com.luminar.model.ExamScoreBean"%>
    
 <% 
 	int examScoreId=Integer.parseInt(request.getParameter("examScoreId"));
 	int examDetailId=Integer.parseInt(request.getParameter("examId"));
	int studentId=Integer.parseInt(request.getParameter("studentId"));
	int examScore=Integer.parseInt(request.getParameter("examScore"));
	String examComments=request.getParameter("examComments");
	
	ExamScoreBean examScoreBean=new ExamScoreBean();
	
	examScoreBean.setExamScoreId(examScoreId);
	examScoreBean.setExamDetailId(examDetailId);
	examScoreBean.setStudentId(studentId);
	examScoreBean.setExamScore(examScore);
	examScoreBean.setComments(examComments);
	
	boolean flag=ExamScoreDAO.updateExamScore(examScoreBean);
	
	if(flag)
		response.sendRedirect("manageExamResult.jsp");
	else
		response.sendRedirect("error.jsp");
 
 
 
 %>