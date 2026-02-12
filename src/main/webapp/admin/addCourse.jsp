<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

			<h2 class="dept-title">Courses</h2>

			<form name="addCourse" method="post" action="addCourseAction.jsp">
			  <input
				type="text"
				name="courseName"
				placeholder="course name"
				class="dept-input"
				required
			  />

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Add course
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
