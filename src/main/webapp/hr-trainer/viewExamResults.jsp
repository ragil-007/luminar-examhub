<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamScoreDAO"%>
<%@ page import="com.luminar.dto.ExamResultDTO"%>
<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.model.ExamDetailsBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

<%
String examIdParam = request.getParameter("examId");
Integer selectedExamId = null;

if (examIdParam != null && !examIdParam.isEmpty()) {
    selectedExamId = Integer.parseInt(examIdParam);
}
%>


			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
					  <h3 class="toolbar-title">Exam results</h3>
					
					  <form method="get" style="margin-top:12px;">
					    <select name="examId"
					            class="exam-filter-select"
					            onchange="this.form.submit()">
					
					      <option value="">All exams</option>
					
					      <%
					        List<ExamDetailsBean> exams=ExamDetailsDAO.listAllExams();
					        for (ExamDetailsBean exam : exams) {
					      %>
					        <option value="<%= exam.getExamDetailId() %>"
					          <%= (selectedExamId != null &&
					               exam.getExamDetailId() == selectedExamId)
					              ? "selected" : "" %>>
					          <%= exam.getExamDetailName() %>
					        </option>
					      <%
					        }
					      %>
					
					    </select>
					  </form>
					</div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Exam name</th>
						<th>Date of examination</th>
						<th>Student name</th>
						<th>Exam score</th>
						<th>Pass/fail</th>
						<th>Comments</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						String result="";
						List<ExamResultDTO> examResults;

						if (selectedExamId != null) {
						    examResults = ExamScoreDAO.listExamResultsByExam(selectedExamId);
						} else {
						    examResults = ExamScoreDAO.listExamResults();
						}

						for(ExamResultDTO examResult:examResults){
							if(examResult.getExamScore()>=examResult.getPassScore()){
								result="Pass";
							}else{
								result="Fail";
							}
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= examResult.getExamName() %></td>
						<td><%= examResult.getExamDate() %></td>
						<td><%= examResult.getStudentName() %></td>
						<td><%= examResult.getExamScore() %></td>
						<td><%= result %></td>
						<td><%= examResult.getExamComments() %></td>
						
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
