<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.luminar.dao.ExamDetailsDAO"%>
 <%@ page import="com.luminar.model.ExamDetailsBean"%>
 <%@ page import="com.luminar.dao.PassCriteriaDAO"%>
 <%@ page import="com.luminar.dao.ExamEvalDAO"%>

<%@ page errorPage="error.jsp" %>

<%
	int examDetailId = Integer.parseInt(request.getParameter("examId"));

	ExamDetailsBean examDetail=ExamDetailsDAO.getPassIdForUpdate(examDetailId);
	int passId=examDetail.getPassId();
		
	boolean hasPassCriteriaDeleted=PassCriteriaDAO.deletePassCriteria(passId);
	boolean hasExamEvalDeleted=ExamEvalDAO.deleteExamEval(examDetailId);
	boolean hasExamDetailsDeleted=ExamDetailsDAO.deleteExamDetails(examDetailId);
	
		
	if(hasPassCriteriaDeleted && hasExamDetailsDeleted && hasExamEvalDeleted)
		response.sendRedirect("manageExams.jsp");
	else
		response.sendRedirect("error.jsp");
 
  
 %>