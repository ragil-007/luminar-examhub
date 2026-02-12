<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.CourseDAO"%>
<%@ page import="com.luminar.model.CourseBean"%>   

<%@ page errorPage="error.jsp" %>

<%
	int courseId = Integer.parseInt(request.getParameter("courseId"));
	
	boolean flag=CourseDAO.deleteCourse(courseId);
 
 	if(flag)
		response.sendRedirect("manageCourses.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>