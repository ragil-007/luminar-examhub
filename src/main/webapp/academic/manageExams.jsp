<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.dto.ExamDetailDTO"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Exam allotment</h3>
						<p class="toolbar-desc">Add and manage exam details</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addExam.jsp" class="btn-primary">
						  + New exam
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Exam name</th>
						<th>Date of examination</th>						
						<th>Exam mode</th>
						<th>Passing criteria</th>
						<th>Alloted to</th>
						<th style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<ExamDetailDTO> exams=ExamDetailsDAO.listExams();
						for(ExamDetailDTO exam:exams){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= exam.getExamDetailName() %></td>
						<td><%= exam.getExamDate() %></td>
						<td><%= exam.getExamModeName() %></td>
						<td><%= exam.getPassScore() %></td>						
						<td><%= exam.getStaffName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editExam.jsp?examId=<%= exam.getExamDetailId() %>"><button class="btn-edit">Edit</button></a>
							<button class="btn-delete" onclick="confirmExamDelete(<%= exam.getExamDetailId() %>)">Delete</button>
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
