<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.StudentBasicDAO"%>
<%@ page import="com.luminar.dto.StudentResultDTO"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Student informations</h3>
						<p class="toolbar-desc">Add and manage Student details</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addStudent.jsp" class="btn-primary">
						  + New Student
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Stdudent name</th>
						<th>Contact no.</th>
						<th>Qualification</th>
						<th>Graduation year</th>
						<th>Current employer</th>
						<th>Current designation</th>
						<th>Total experience</th>
						<th>Technology</th>
						<th style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<StudentResultDTO> students=StudentBasicDAO.listStudents();
						for(StudentResultDTO std:students){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= std.getStuName() %></td>
						<td><%= std.getStuContact() %></td>
						<td><%= std.getStuQualification() %></td>
						<td><%= std.getStuGraduationDate() %></td>
						<td><%if(std.getStuCompany()==null){%>
								na
							<%}else{%>						
								<%= (std.getStuCompany()) %>
							<%}%>
						</td>
						<td><%if(std.getStuDesignation()==null){%>
								na
							<%}else{%>						
								<%= (std.getStuDesignation()) %>
							<%}%>
						</td>
						<td><%= std.getStuTotalExp() %></td>
						<td><%if(std.getStuTech()==null){%>
								na
							<%}else{%>						
								<%= (std.getStuTech()) %>
							<%}%>
						</td>
						<td>
						  <div class="table-actions">
							<a href="editStudent.jsp?stuId=<%= std.getStuId() %>"><button class="btn-edit">Edit</button></a>
							<button class="btn-delete" onclick="confirmStudentDelete(<%= std.getStuId() %>)">Delete</button>
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
