<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.luminar.dao.StudentBasicDAO"%>
 <%@ page import="com.luminar.model.StudentBasicBean"%>
 <%@ page import="com.luminar.dao.StudentExperienceDAO"%>
 <%@ page import="com.luminar.model.StudentExperienceBean"%>

<%@ page errorPage="error.jsp" %>

<%
	int stuId = Integer.parseInt(request.getParameter("stuId"));

	boolean hasExperience=StudentExperienceDAO.checkExperience(stuId);
	
	if(!hasExperience){
		boolean hasStuBasicDeleted=StudentBasicDAO.deleteStudentBasic(stuId);
		
		if(hasStuBasicDeleted)
			response.sendRedirect("manageStudents.jsp");
		else
			response.sendRedirect("error.jsp");
	}else{
		
		boolean hasStuBasicDeleted=StudentBasicDAO.deleteStudentBasic(stuId);
		boolean hasStuExperienceDeleted=StudentExperienceDAO.deleteStudentExperience(stuId);
		
		if(hasStuBasicDeleted && hasStuExperienceDeleted)
			response.sendRedirect("manageStudents.jsp");
		else
			response.sendRedirect("error.jsp");
	}
 
  
 %>