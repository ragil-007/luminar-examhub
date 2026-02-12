<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.DepartmentBean"%>



<%@ include file="header.jsp"  %>

<%
	int deptId = Integer.parseInt(request.getParameter("deptId"));

	DepartmentBean dept=DepartmentDAO.getDepartment(deptId);

	%>

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Departments</h2>

			<form name="updateDepartment" method="post" action="editDepartmentAction.jsp">
				<input
				type="hidden"
				name="deptId"
				value="<%= dept.getDeptId() %>"
				placeholder="Department name"
				class="dept-input"
			  />
			  
			  <input
				type="text"
				name="deptName"
				value="<%= dept.getDeptName() %>"
				placeholder="Department name"
				class="dept-input"
				required
			  />

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update department
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
