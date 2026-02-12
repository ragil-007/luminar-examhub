<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.luminar.dao.CourseDAO"%>
<%@ page import="com.luminar.model.CourseBean"%>
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

			<h2 class="dept-title">Batches</h2>

			<form name="addBatch" method="post" action="addBatchAction.jsp">
			  
			  <select name="courseId" id="department" class="dept-input" required>
			        <option value="">-- Select course --</option>
			
			        <%
						List<CourseBean> courses=CourseDAO.listCourses();
			            for (CourseBean course : courses) {
			        %>
			            <option value="<%= course.getCourseId() %>">
			                <%= course.getCourseName() %>
			            </option>
			        <%
			            }
			        %>
			    </select>
			  
			  
			  <input
				type="text"
				name="batchName"
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
