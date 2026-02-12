<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="com.luminar.dao.LoginDAO"%>
 <%@ page import="com.luminar.model.LoginBean"%>
  <%@ page import="com.luminar.dao.StaffDAO"%>
 <%@ page import="com.luminar.model.StaffBean"%>
 
 <%
 	int departmentId=Integer.parseInt(request.getParameter("departmentId"));
 	int roleId=5;
 	String rollno=request.getParameter("rollno");
 	String staffName=request.getParameter("staffName");
 	String contact=request.getParameter("contact");
 	String username=request.getParameter("username");
 	String password=request.getParameter("password");

 	staffName=staffName.substring(0, 1).toUpperCase() + staffName.substring(1);
 	
	StaffBean staffBean=new StaffBean();
	 
	staffBean.setDepartmentId(departmentId);
	staffBean.setRoleId(roleId);
	staffBean.setStaffRollNo(rollno.trim());
	staffBean.setStaffName(staffName.trim());
	staffBean.setContactNo(contact.trim());
	
	boolean staffInserted=StaffDAO.insertStaff(staffBean);
	
	StaffBean staff=StaffDAO.getStaffId(rollno);
	int staffId=staff.getStaffId();
	
	LoginBean loginBean=new LoginBean();
	
	loginBean.setStaffId(staffId);
	loginBean.setUserName(username);
	loginBean.setPassWord(password);
	
	boolean loginInserted=LoginDAO.insertLogin(loginBean);
 	
 	
 	if(staffInserted && loginInserted)
 		response.sendRedirect("index.html");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    