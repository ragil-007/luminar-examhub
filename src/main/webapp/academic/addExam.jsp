<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.DepartmentBean"%>
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

			<h2 class="dept-title">Exams</h2>

			<form name="addExam" method="post" action="addExamAction.jsp">
			
			<input type="text" name="examDetailName" placeholder="Exam name" class="dept-input" required/>
			
			<input type="date" name="examDate" placeholder="Date of examination" class="dept-input" required/>
			
			  <select name="examModeDept" id="examModeDept" class="dept-input" onchange="loadStaff()" required>
			        <option value="">-- Select exam mode --</option>
			
			        <%
						List<ExamModeBean> examModes=ExamModeDAO.listExamModes();
			        	List<DepartmentBean> departments=DepartmentDAO.listDepartmentsforExam();
			            for (ExamModeBean examMode : examModes) {
			            	for (DepartmentBean dept:departments){
			        %>
			             <option value="<%=examMode.getExamModeId()%>-<%=dept.getDeptId()%>">
						      <%=examMode.getExamModeName()%> - <%=dept.getDeptName()%>
						    </option>
			        <%
			            }
			            }
			        %>
			    </select>
			    
			    <input type="number" name="passScore" placeholder="Passing criteria(in score)" class="dept-input" required/>
			  
			  <select id="allocatedTo" name="allocatedTo" class="dept-input">
				  <option value="">Select Staff</option>
				</select>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Add exam
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>
