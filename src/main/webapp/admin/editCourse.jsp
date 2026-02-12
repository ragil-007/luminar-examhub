<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.CourseDAO"%>
<%@ page import="com.luminar.model.CourseBean"%>



<%@ include file="header.jsp"  %>

<%
	int courseId = Integer.parseInt(request.getParameter("courseId"));

	CourseBean course=CourseDAO.getCourse(courseId);

	%>

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Courses</h2>

			<form name="updateDepartment" method="post" action="editCourseAction.jsp">
				<input
				type="hidden"
				name="courseId"
				value="<%= course.getCourseId() %>"
				class="dept-input"
			  />
			  
			  <input
				type="text"
				name="courseName"
				value="<%= course.getCourseName() %>"
				placeholder="Course name"
				class="dept-input"
				required
			  />

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update course
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
