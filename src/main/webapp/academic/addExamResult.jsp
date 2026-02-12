<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.model.ExamDetailsBean"%>
<%@ page import="com.luminar.dao.StudentBasicDAO"%>
<%@ page import="com.luminar.model.StudentBasicBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Exams</h2>

			<form name="addExam" method="post" action="addExamResultAction.jsp">
			
			  <select name="examId" id="examSelect" class="dept-input" required onchange="loadStudentsByExam()">
			        <option value="">-- Select Exam --</option>
			
			        <%
						List<ExamDetailsBean> exams=ExamDetailsDAO.listAllExams();
			            for (ExamDetailsBean exam : exams) {
			        %>
			            <option value="<%= exam.getExamDetailId() %>">
			                <%= exam.getExamDetailName() %>
			            </option>
			        <%
			            }
			        %>
			    </select>
			    
			    <select name="studentId" id="studentSelect" class="dept-input" required>
				    <option value="">-- Select Student --</option>
				</select>
			    
			    <input type="number" name="examScore" placeholder="Student exam score" class="dept-input" required/>
			
				<input type="text" name="examComments" placeholder="Comments/Remarks" class="dept-input" required/>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Add score
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
