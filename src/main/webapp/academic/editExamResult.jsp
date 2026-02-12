<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.model.ExamDetailsBean"%>
<%@ page import="com.luminar.dao.StudentBasicDAO"%>
<%@ page import="com.luminar.model.StudentBasicBean"%>
<%@ page import="com.luminar.model.ExamScoreBean"%>
<%@ page import="com.luminar.dao.ExamScoreDAO"%>
<%@ page import="java.util.List"%>



<%@ include file="header.jsp"  %>

<%
	int resultId = Integer.parseInt(request.getParameter("resultId"));

	ExamScoreBean examScore=ExamScoreDAO.getExamScore(resultId);
	int studentId=examScore.getStudentId();

	%>
	
<script>
window.onload = function () {
    loadStudentsByExam(<%= studentId %>);
};
</script>


<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Exam score</h2>

			<form name="updateExamResult" method="post" action="editExamResultAction.jsp">
			
				<input
				type="hidden"
				name="examScoreId"
				value="<%= examScore.getExamScoreId() %>"
				class="dept-input"
			  />
			  
			  <select name="examId" id="examSelect" class="dept-input" required onchange="loadStudentsByExam(<%= studentId %>)">
			    <option value="">-- Select Exam --</option>
			
			    <%
				    List<ExamDetailsBean> exams=ExamDetailsDAO.listAllExams();
		            for (ExamDetailsBean exam : exams) {
			            if (exam.getExamDetailId() == examScore.getExamDetailId()) {
			    %>
			        <option value="<%= exam.getExamDetailId() %>" selected>
			            <%= exam.getExamDetailName() %>
			        </option>
			    <%
			            } else {
			    %>
			        <option value="<%= exam.getExamDetailId() %>">
			            <%= exam.getExamDetailName() %>
			        </option>
			    <%
			            }
			        }
			    %>
			</select>
			
			<select name="studentId" id="studentSelect" class="dept-input" required>
		    <option value="">-- Select Student --</option>
			</select>
			
			<input type="number" name="examScore" value="<%= examScore.getExamScore() %>"
			placeholder="Student exam score" class="dept-input" required/>
			
			<input type="text" name="examComments" value="<%= examScore.getComments() %>" 
			placeholder="Comments/Remarks" class="dept-input" required/>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update exam score
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
