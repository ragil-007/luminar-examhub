<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.dto.ExamDetailDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<%
 int userId=(Integer) session.getAttribute("userId");
%>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Allocated exams</h3>
						
					  </div>

					  <div class="toolbar-right">
						
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Exam name</th>
						<th>Exam date</th>
						<th>Exam mode</th>
						<th>Passing criteria</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						boolean isDateCrossed=false;
						LocalDate today = LocalDate.now();
						List<ExamDetailDTO> exams=ExamDetailsDAO.listAllocatedExams(userId);
						for(ExamDetailDTO exam:exams){
							Date dbDate = exam.getExamDate();
							LocalDate examDate = dbDate.toLocalDate();
							if (!examDate.isBefore(today)){
							
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= exam.getExamDetailName() %></td>
						<td><%= exam.getExamDate() %></td>
						<td><%= exam.getExamModeName() %></td>
						<td><%= exam.getPassScore() %></td>
					  </tr>
					  	<%	
					  		}
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
