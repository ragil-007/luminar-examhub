<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="com.luminar.dao.CourseDAO"%>
 <%@ page import="com.luminar.model.CourseBean"%>
 
 <%
 	String courseName=request.getParameter("courseName");

 	courseName=courseName.substring(0, 1).toUpperCase() + courseName.substring(1);
 	
	CourseBean courseBean=new CourseBean();
	 
	 courseBean.setCourseName(courseName.trim());
 	
 	boolean flag=CourseDAO.insertCourse(courseBean);
 	
 	if(flag)
 		response.sendRedirect("manageCourses.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    