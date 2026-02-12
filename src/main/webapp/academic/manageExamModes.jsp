<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<script type="text/javascript">
function confirmModeDelete(modeId) {
	   const isConfirmed = confirm("Confirm deletion");

	   if (isConfirmed) {
	     window.location.href =
	       "deleteExamMode.jsp?modeId=" + modeId;
	    }
	    // else → do nothing
	}
</script>


<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Exam modes</h3>
						<p class="toolbar-desc">Add and manage mode of examinations</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addExamMode.jsp" class="btn-primary">
						  + New exam mode
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th class="col-slno">Sl. No</th>
						<th class="col-name">Exam mode</th>
						<th class="col-action" style="width: 20%">Action</th>
					  </tr>
					</thead>
					
					<%
						int i=1;
						List<ExamModeBean> modes=ExamModeDAO.listExamModes();
						for(ExamModeBean mode:modes){
					%>

					<tbody>
					  <tr>
						<td> <%= i %> </td>
						<td><%= mode.getExamModeName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editExamMode.jsp?modeId=<%= mode.getExamModeId() %>"><button class="btn-edit">Edit</button></a>
							<button class="btn-delete" onclick="confirmModeDelete(<%= mode.getExamModeId() %>)">Delete</button>
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
