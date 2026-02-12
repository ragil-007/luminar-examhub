<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.CourseDAO"%>
<%@ page import="com.luminar.model.CourseBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Courses</h3>
						<p class="toolbar-desc">Create and manage educational courses</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addCourse.jsp" class="btn-primary">
						  + New Course
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th class="col-slno">Sl. No</th>
						<th class="col-name">Course Name</th>
						<th class="col-action" style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<CourseBean> courses=CourseDAO.listCourses();
						for(CourseBean course:courses){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= course.getCourseName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editCourse.jsp?courseId=<%= course.getCourseId() %>"><button class="btn-edit">Edit</button></a>
							<button class="btn-delete" onclick="confirmCourseDelete(<%= course.getCourseId() %>)">Delete</button>
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
