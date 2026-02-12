<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

 <%@ page import="com.luminar.dao.DepartmentDAO"%>
 <%@ page import="com.luminar.model.DepartmentBean"%>
 
 <%
 	String deptName=request.getParameter("deptName");
 	
 	DepartmentBean deptBean=new DepartmentBean();
 	
 	deptBean.setDeptName(deptName.toUpperCase().trim());
 	
 	boolean flag=DepartmentDAO.insertDepartment(deptBean);
 	
 	if(flag)
 		response.sendRedirect("manageDepartments.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    