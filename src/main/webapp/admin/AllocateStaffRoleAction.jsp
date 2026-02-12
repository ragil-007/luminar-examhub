<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

 <%@ page import="com.luminar.dao.StaffDAO"%>
 <%@ page import="com.luminar.model.StaffBean"%>
 
 <%
 	int staffId=Integer.parseInt(request.getParameter("staffId"));
 	int roleId=Integer.parseInt(request.getParameter("roleId"));
 	
 	StaffBean staff=new StaffBean();
	 
 	staff.setStaffId(staffId);
 	staff.setRoleId(roleId);
 	
 	boolean flag=StaffDAO.AssignStaffRole(staff);
 	
 	if(flag)
 		response.sendRedirect("manageStaffs.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    