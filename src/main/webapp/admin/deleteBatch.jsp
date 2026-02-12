<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.BatchDAO"%>
<%@ page import="com.luminar.model.BatchBean"%>   


<%
	int batchId = Integer.parseInt(request.getParameter("batchId"));
	
	boolean flag=BatchDAO.deleteBatch(batchId);
 
 	if(flag)
		response.sendRedirect("manageBatches.jsp");
	else
		response.sendRedirect("error.jsp");
  
 %>