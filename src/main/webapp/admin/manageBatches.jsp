<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.BatchDAO"%>
<%@ page import="com.luminar.dto.BatchResultDTO"%>
<%@ page import="java.util.List"%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<!-- end header -->

			<section class="page-section">
			  <div class="container">
				<div class="data-card">

					<div class="table-toolbar">

					  <div class="toolbar-left">
						<h3 class="toolbar-title">Batches</h3>
						<p class="toolbar-desc">Create and manage Batch batches</p>
					  </div>

					  <div class="toolbar-right">
						<a href="addBatch.jsp" class="btn-primary">
						  + New Batch
						</a>
					  </div>
					</div>

				  <div class="table-wrapper">
					<table class="data-table department-table">
					<thead>
					  <tr>
						<th class="col-slno">Sl. No</th>
						<th class="col-name">Course Name</th>
						<th class="col-name-2">Batch Name</th>
						<th class="col-action">Action</th>
					  </tr>
					</thead>
					
					<tbody>
					<%
						int i=1;
						List<BatchResultDTO> batches=BatchDAO.listBatches();
						for(BatchResultDTO Batch:batches){
					%>
					
					  <tr>
						<td> <%= i %> </td>
						<td><%= Batch.getCourseName() %></td>
						<td><%= Batch.getBatchName() %></td>
						<td>
						  <div class="table-actions">
							<a href="editBatch.jsp?batchId=<%= Batch.getBatchId() %>"><button class="btn-edit">Edit</button></a>
							<button class="btn-delete" onclick="confirmBatchDelete(<%= Batch.getBatchId() %>)">Delete</button>
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
