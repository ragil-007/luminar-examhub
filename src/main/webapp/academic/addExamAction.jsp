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
 	String examDetailName=request.getParameter("examDetailName");
 
	LocalDate date = LocalDate.parse(request.getParameter("examDate"));
	Date examDate = Date.valueOf(date);
	
	String examModeDept = request.getParameter("examModeDept");
	String[] parts = examModeDept.split("-");
	int examModeId = Integer.parseInt(parts[0]);
	
	int passScore=Integer.parseInt(request.getParameter("passScore"));
	
	int staffId=Integer.parseInt(request.getParameter("allocatedTo"));
	
	boolean hasExamEvalInserted=false;
	int examDetailId=0;
	
	examDetailName=examDetailName.substring(0, 1).toUpperCase() + examDetailName.substring(1);
	
	PassingCriteriaBean passCriteria=new PassingCriteriaBean();
	passCriteria.setPassScore(passScore);
	
	int passId=PassCriteriaDAO.insertPassingCriteria(passCriteria);
	
	if(passId>0){
		ExamDetailsBean examDetails=new ExamDetailsBean();
		examDetails.setExamModeId(examModeId);
		examDetails.setExamDetailName(examDetailName);
		examDetails.setExamDetailDate(examDate);
		examDetails.setPassId(passId);
		
		examDetailId=ExamDetailsDAO.insertExamDetails(examDetails);
		
		if(examDetailId > 0){
			ExamEvalBean examEval=new ExamEvalBean();
			examEval.setExamDetailsId(examDetailId);
			examEval.setStaffId(staffId);
			
			hasExamEvalInserted=ExamEvalDAO.insertExamEval(examEval);
		}
	}
	
	if(passId > 0 && examDetailId > 0 && hasExamEvalInserted)
 		response.sendRedirect("manageExams.jsp");
 	
 %>    