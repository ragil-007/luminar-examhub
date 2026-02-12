<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.luminar.model.StaffBean"%>
<%@ page import="com.luminar.dto.StaffDetailsDTO"%>
<%@ page import="com.luminar.dao.StaffDAO"%>
<%@ page import="com.luminar.model.RoleBean"%>
<%@ page import="com.luminar.dao.RoleDAO"%>
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

			<h2 class="dept-title">Allocate role for new staff signups</h2>

			<form name="addStaffRole" method="post" action="AllocateStaffRoleAction.jsp">
			  
			  <select name="staffId" id="department" class="dept-input" required>
			        <option value="">-- Select staff --</option>
			
			        <%
						List<StaffDetailsDTO> staffs=StaffDAO.listStaffByPendingRole();
			            for (StaffDetailsDTO staff : staffs) {
			        %>
			            <option value="<%= staff.getStaffId() %>">
			                <%= staff.getStaffName()+" - "+staff.getStaffRollNo()+" - "+staff.getDeptName() %>
			            </option>
			        <%
			            }
			        %>
			    </select>
			    
			    <select name="roleId" id="department" class="dept-input" required>
			        <option value="">-- Select role --</option>
			
			        <%
						List<RoleBean> roles=RoleDAO.listRolesExceptAdmin();
			            for (RoleBean role : roles) {
			        %>
			            <option value="<%= role.getRoleId() %>">
			                <%= role.getRoleName() %>
			            </option>
			        <%
			            }
			        %>
			    </select>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Add role
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
