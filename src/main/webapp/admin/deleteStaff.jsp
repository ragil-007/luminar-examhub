<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.luminar.dao.StaffDAO"%>
 <%@ page import="com.luminar.model.StaffBean"%> 
  <%@ page import="com.luminar.dao.LoginDAO"%>
 <%@ page import="com.luminar.model.LoginBean"%> 


<%
	int staffId = Integer.parseInt(request.getParameter("staffId"));
	LoginBean loginBean=LoginDAO.getLoginIdForDelete(staffId);
	int loginId=loginBean.getLoginId();
	
	boolean hasLoginDeleted=LoginDAO.deleteLogin(loginId);
	boolean hasStaffDeleted=StaffDAO.deleteStaff(staffId);
 
 	if(hasLoginDeleted && hasStaffDeleted)
		response.sendRedirect("manageStaffs.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>