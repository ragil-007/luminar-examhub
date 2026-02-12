<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="com.luminar.model.ExamDetailsBean"%>
 <%@ page import="com.luminar.model.PassingCriteriaBean"%>
 <%@ page import="com.luminar.model.ExamEvalBean"%>
 <%@ page import="com.luminar.dao.PassCriteriaDAO"%>
 <%@ page import="com.luminar.dao.ExamDetailsDAO"%>
 <%@ page import="com.luminar.dao.ExamEvalDAO"%>
 
 <%@ page import="java.sql.Date"%>
 <%@ page import="java.time.LocalDate"%>
 
 <%
 	int examDetailId=Integer.parseInt(request.getParameter("examDetailId"));
 	String examDetailName=request.getParameter("examDetailName");
 
	LocalDate date = LocalDate.parse(request.getParameter("examDate"));
	Date examDate = Date.valueOf(date);
	
	String examModeDept = request.getParameter("examModeDept");
	String[] parts = examModeDept.split("-");
	int examModeId = Integer.parseInt(parts[0]);
	
	int passScore=Integer.parseInt(request.getParameter("passScore"));
	
	int staffId=Integer.parseInt(request.getParameter("allocatedTo"));
	
	examDetailName=examDetailName.substring(0, 1).toUpperCase() + examDetailName.substring(1);
	
	ExamDetailsBean examDetail=ExamDetailsDAO.getPassIdForUpdate(examDetailId);
	int passId=examDetail.getPassId();
	
	PassingCriteriaBean passCriteria=new PassingCriteriaBean();
	passCriteria.setPassId(passId);
	passCriteria.setPassScore(passScore);
	
	boolean hasPassCriteriaUpdated=PassCriteriaDAO.updatePassCriteria(passCriteria);
	
	ExamDetailsBean examDetails=new ExamDetailsBean();
	examDetails.setExamDetailId(examDetailId);
	examDetails.setExamModeId(examModeId);
	examDetails.setExamDetailName(examDetailName);
	examDetails.setExamDetailDate(examDate);
		
	boolean hasExamDetailsUpdated=ExamDetailsDAO.updateExamDetails(examDetails);
		
	ExamEvalBean examEval=new ExamEvalBean();
	examEval.setStaffId(staffId);
	examEval.setExamDetailsId(examDetailId);
			
	boolean hasExamEvalUpdated=ExamEvalDAO.updateExamEval(examEval);
	
	if(hasPassCriteriaUpdated && hasExamDetailsUpdated && hasExamDetailsUpdated)
 		response.sendRedirect("manageExams.jsp");
 	
 %>    