<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

 <%@ page import="com.luminar.dao.BatchDAO"%>
 <%@ page import="com.luminar.model.BatchBean"%>
 
 <%
 	int courseId=Integer.parseInt(request.getParameter("courseId"));
 	String batchName=request.getParameter("batchName");
    

 	batchName=batchName.substring(0, 1).toUpperCase() + batchName.substring(1);
 	
	BatchBean batchBean=new BatchBean();
	 
	 batchBean.setBatchName(batchName.trim());
	 batchBean.setCourseId(courseId);
 	
 	boolean flag=BatchDAO.insertBatch(batchBean);
 	
 	if(flag)
 		response.sendRedirect("manageBatches.jsp");
 	else
 		response.sendRedirect("error.jsp");
 	
 %>    