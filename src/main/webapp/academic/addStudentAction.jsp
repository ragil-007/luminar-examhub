<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



 <%@ page import="com.luminar.dao.StudentBasicDAO"%>
 <%@ page import="com.luminar.model.StudentBasicBean"%>
 <%@ page import="com.luminar.dao.StudentExperienceDAO"%>
 <%@ page import="com.luminar.model.StudentExperienceBean"%>
 
 <%
 	String studentName=request.getParameter("studentName");
	String contactNo=request.getParameter("contactNo");
	String qualification=request.getParameter("qualification");
	int graduationYear=Integer.parseInt(request.getParameter("graduationYear"));
	boolean hasExperience=Boolean.parseBoolean(request.getParameter("hasExperience"));
	
	studentName=studentName.substring(0, 1).toUpperCase() + studentName.substring(1);
	qualification=qualification.substring(0, 1).toUpperCase() + qualification.substring(1);
	
	StudentBasicBean stuBasic=new StudentBasicBean();
	stuBasic.setStuName(studentName);
	stuBasic.setStuContact(contactNo);
	stuBasic.setStuQualification(qualification);
	stuBasic.setStuGraduationDate(graduationYear);
	
	int stuBasicId=StudentBasicDAO.insertStudentBasic(stuBasic);
	
	boolean hasStuExperienceInserted=false;
	
	if(hasExperience){
		String currentEmployer=request.getParameter("currentEmployer");
		String currentDesignation=request.getParameter("currentDesignation");
		int totalExperience=Integer.parseInt(request.getParameter("totalExperience"));
		String technology=request.getParameter("technology");
		
		currentEmployer=currentEmployer.substring(0, 1).toUpperCase() + currentEmployer.substring(1);
		currentDesignation=currentDesignation.substring(0, 1).toUpperCase() + currentDesignation.substring(1);
		technology=technology.substring(0, 1).toUpperCase() + technology.substring(1);
		
		StudentBasicBean sb=StudentBasicDAO.getStudentId(contactNo);
		
		StudentExperienceBean stuExperience=new StudentExperienceBean();
		
		stuExperience.setStuId(stuBasicId);
		stuExperience.setStuTotalExp(totalExperience);
		stuExperience.setStuCompany(currentEmployer);
		stuExperience.setStuDesignation(currentDesignation);
		stuExperience.setStuTech(technology);
		
		hasStuExperienceInserted=StudentExperienceDAO.insertStudentExperience(stuExperience);
	}
	
	if(stuBasicId > 0 || hasStuExperienceInserted )
 		response.sendRedirect("manageStudents.jsp");
 	
 %>    