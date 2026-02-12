<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.DepartmentBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Departments</h3>
						<p class="toolbar-desc">Create and manage organization departments</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addDepartment.jsp" class="btn-primary">
						  + New Department
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Department Name</th>
						<th style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<DepartmentBean> departments=DepartmentDAO.listDepartments();
						for(DepartmentBean dept:departments){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= dept.getDeptName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editDepartment.jsp?deptId=<%= dept.getDeptId() %>"><button class="btn-edit">Edit</button></a>
							<a href="deleteDepartment.jsp?deptId=<%= dept.getDeptId() %>"><button class="btn-delete" onclick="confirmDeptDelete(event)">Delete</button></a>
						  </div>
						</td>
					  </tr>
					  	<%
							i++;
							}
						%>
						
					</tbody>
				  </table>

				  </div>

				</div>
			  </div>
			</section>

<%@ include file="footer.html" %>
