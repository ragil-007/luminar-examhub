<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.DepartmentBean"%>
    
 <% 
 
 int deptId=Integer.parseInt(request.getParameter("deptId"));
 String deptName=request.getParameter("deptName");
 
 DepartmentBean deptBean=new DepartmentBean();
 
 deptBean.setDeptId(deptId);
 deptBean.setDeptName(deptName.toUpperCase().trim());
 
 boolean flag=DepartmentDAO.updateDepartment(deptBean);
 
 if(flag)
		response.sendRedirect("manageDepartments.jsp");
	else
		response.sendRedirect("error.jsp");
 
 
 
 %>