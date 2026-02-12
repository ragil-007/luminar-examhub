<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>



<%@ include file="header.jsp"  %>

<%
	int examModeId = Integer.parseInt(request.getParameter("modeId"));

	ExamModeBean examMode=ExamModeDAO.getExamMode(examModeId);

	%>

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Exam modes</h2>

			<form name="updateExamMode" method="post" action="editExamModeAction.jsp">
				<input
				type="hidden"
				name="examModeId"
				value="<%= examMode.getExamModeId() %>"
				class="dept-input"
			  />
			  
			  <input
				type="text"
				name="examModeName"
				value="<%= examMode.getExamModeName() %>"
				placeholder="Exam mode name"
				class="dept-input"
				required
			  />

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update exam mode
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
