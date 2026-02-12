<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.StaffDAO"%>
<%@ page import="com.luminar.model.StaffBean"%>
<%@ page import="com.luminar.dto.StaffDetailsDTO"%>
<%@ page import="com.luminar.dao.RoleDAO"%>
<%@ page import="com.luminar.model.RoleBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<script type="text/javascript">
function confirmStaffDelete(staffId) {
	   const isConfirmed = confirm("Confirm deletion");

	   if (isConfirmed) {
	     window.location.href =
	       "deleteStaff.jsp?staffId=" + staffId;
	    }
	    // else → do nothing
	}
</script>


<!-- end header -->

<%
String roleIdParam = request.getParameter("roleId");
Integer selectedRoleId = null;

if (roleIdParam != null && !roleIdParam.isEmpty()) {
	selectedRoleId = Integer.parseInt(roleIdParam);
}
%>


			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
					  <h3 class="toolbar-title">Staffs</h3>
					  <p class="toolbar-desc">Manage staffs and roles</p>
					
					  <form method="get" style="margin-top:12px;">
					    <select name="roleId"
					            class="exam-filter-select"
					            onchange="this.form.submit()">
					
					      <option value="">All staffs</option>
					
					      <%
					        List<RoleBean> roles=RoleDAO.listRolesExceptPending();
					        for (RoleBean role : roles) {
					      %>
					        <option value="<%= role.getRoleId() %>"
					          <%= (selectedRoleId != null &&
					        		  role.getRoleId() == selectedRoleId )
					              ? "selected" : "" %>>
					          <%= role.getRoleName() %>
					        </option>
					      <%
					        }
					      %>
					
					    </select>
					  </form>
					</div>


					  <div class="toolbar-right">
						<a href="addStaffRole.jsp" class="btn-primary">
						  + Allocate role
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th style="width: 10%">Sl. No</th>
						<th>Staff name</th>
						<th>Staff roll no</th>
						<th>Contact no</th>
						<th>Department</th>
						<th style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<StaffDetailsDTO> staffs;

						if (selectedRoleId != null) {
							staffs = StaffDAO.listStaffsByRole(selectedRoleId);
						} else {
						    staffs = StaffDAO.listRoleAllocatedStaffDetails();
						}
						for(StaffDetailsDTO staff:staffs){
							if(staff.getRoleId()!=1 ){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= staff.getStaffName() %></td>
						<td><%= staff.getStaffRollNo() %></td>
						<td><%= staff.getStaffContactNo() %></td>
						<td><%= staff.getDeptName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editStaffRole.jsp?staffId=<%= staff.getStaffId() %>"><button class="btn-edit">Change role</button></a>
							<button type="button" class="btn-delete" onclick="confirmStaffDelete(<%= staff.getStaffId() %>)">Delete staff</button>

						  </div>
						</td>
					  </tr>
					  	<%	}else{ %>
					  		<tbody>
							  <tr>
								<td> <%= i %> </td>
								<td><%= staff.getStaffName() %></td>
								<td><%= staff.getStaffRollNo() %></td>
								<td><%= staff.getStaffContactNo() %></td>
								<td><%= staff.getDeptName() %></td>
								<td>
								  <div class="table-actions">
								  </div>
								</td>
							  </tr>
						<%	  
					  	}
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
