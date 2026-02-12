<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.BatchDAO"%>
<%@ page import="com.luminar.model.BatchBean"%>
<%@ page import="com.luminar.model.CourseBean"%>
<%@ page import="com.luminar.dao.CourseDAO"%>
<%@ page import="java.util.List"%>



<%@ include file="header.jsp"  %>

<%
	int batchId = Integer.parseInt(request.getParameter("batchId"));

	BatchBean batch=BatchDAO.getbatch(batchId);

	%>

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Batches</h2>

			<form name="updateDepartment" method="post" action="editBatchAction.jsp">
				<input
				type="hidden"
				name="batchId"
				value="<%= batch.getBatchId() %>"
				class="dept-input"
			  />
			  
			  <select name="courseId" class="dept-input" required>
			    <option value="">-- Select Course --</option>
			
			    <%
				    List<CourseBean> courses=CourseDAO.listCourses();
			        for (CourseBean course : courses) {
			            if (course.getCourseId() == batch.getCourseId()) {
			    %>
			        <option value="<%= course.getCourseId() %>" selected>
			            <%= course.getCourseName() %>
			        </option>
			    <%
			            } else {
			    %>
			        <option value="<%= course.getCourseId() %>">
			            <%= course.getCourseName() %>
			        </option>
			    <%
			            }
			        }
			    %>
			</select>
			  
			  
			  <input
				type="text"
				name="batchName"
				value="<%= batch.getBatchName() %>"
				placeholder="Batch name"
				class="dept-input"
				required
			  />

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update batch
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
