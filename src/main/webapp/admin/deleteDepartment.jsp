<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.DepartmentBean"%>   


<%
	int deptId = Integer.parseInt(request.getParameter("deptId"));
	
	boolean flag=DepartmentDAO.deleteDepartment(deptId);
 
 	if(flag)
		response.sendRedirect("manageDepartments.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>