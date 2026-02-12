<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.StaffDAO"%>
<%@ page import="com.luminar.model.StaffBean"%>
<%@ page import="com.luminar.model.RoleBean"%>
<%@ page import="com.luminar.dao.RoleDAO"%>
<%@ page import="java.util.List"%>



<%@ include file="header.jsp"  %>

<%
	int staffId = Integer.parseInt(request.getParameter("staffId"));

	StaffBean staff=StaffDAO.getStaffDetailsforRoleChange(staffId);

	%>

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Staff role</h2>

			<form name="updateDepartment" method="post" action="editStaffRoleAction.jsp">
				<input
				type="hidden"
				name="staffId"
				value="<%= staffId %>"
				class="dept-input"
			  />
			  
			  <input type="text"
       			name="staffName"
      			value="<%= staff.getStaffName() %>"
      			readonly
       			class="dept-input" />
			  
			  <select name="roleId" class="dept-input" required>
			    <option value="">-- Select role --</option>
			
			    <%
				    List<RoleBean> roles=RoleDAO.listRolesExceptAdmin();
			        for (RoleBean role : roles) {
			            if (role.getRoleId() == staff.getRoleId()) {
			    %>
			        <option value="<%= role.getRoleId() %>" selected>
			            <%= role.getRoleName() %>
			        </option>
			    <%
			            } else {
			    %>
			        <option value="<%= role.getRoleId() %>">
			            <%= role.getRoleName() %>
			        </option>
			    <%
			            }
			        }
			    %>
			</select>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Update role
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
