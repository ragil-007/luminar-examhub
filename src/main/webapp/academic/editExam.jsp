<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ExamModeDAO"%>
<%@ page import="com.luminar.model.ExamModeBean"%>
<%@ page import="com.luminar.model.DepartmentBean"%>
<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.dto.ExamDetailDTO"%>
<%@ page import="java.util.List"%>

<%@ include file="header.jsp"  %>

<%	int examDetailId= Integer.parseInt(request.getParameter("examId"));
	ExamDetailDTO examDetails= ExamDetailsDAO.getExamDetails(examDetailId);
	int examModeId= examDetails.getExamModeId();
	int deptId = examDetails.getDeptId();
	int staffId = examDetails.getStaffId();

	String selectedExamModeDept = examModeId + "-" + deptId;
%>

<script>
    const existingStaffId = "<%= staffId %>";

    window.onload = function () {
        if (existingStaffId) {
            loadStaff(existingStaffId);
        }
    };
</script>

<!-- end header -->

<!-- Testimonial -->
			  <div id="testimonial" class="testimonial">
			  <div class="dept-header">
				  <button type="button" class="icon-back-btn back-arrow-btn" onclick="history.back()">
					</button>

				</div>

		  <div class="dept-card">

			<h2 class="dept-title">Exams</h2>

			<form name="editExam" method="post" action="editExamAction.jsp">
			
			<input type="hidden" name="examDetailId" 
			value="<%=examDetailId%>" class="dept-input" />
			
			<input type="text" name="examDetailName" placeholder="Exam name" 
			value="<%=examDetails.getExamDetailName()%>" class="dept-input" required/>
			
			<input type="date" name="examDate" placeholder="Date of examination" 
			value="<%=examDetails.getExamDate()%>" class="dept-input" required/>
			
			
			  <select name="examModeDept" id="examModeDept" class="dept-input" required 
			  onchange="loadStaff()">
		
		    <option value="">-- Select exam mode --</option>
		
		    <%
		        List<ExamModeBean> examModes = ExamModeDAO.listExamModes();
		        List<DepartmentBean> departments = DepartmentDAO.listDepartmentsforExam();
		
		        for (ExamModeBean examMode : examModes) {
		            for (DepartmentBean dept : departments) {
		                String value = examMode.getExamModeId() + "-" + dept.getDeptId();
		    %>
		        <option value="<%= value %>"
		            <%= value.equals(selectedExamModeDept) ? "selected" : "" %>>
		            <%= examMode.getExamModeName() %> - <%= dept.getDeptName() %>
		        </option>
		    <%
		            }
		        }
		    %>
		</select>
		
		<input type="number" name="passScore" placeholder="Passing criteria(in score)" 
		value="<%=examDetails.getPassScore()%>" class="dept-input" required/>
			  
			  <select id="allocatedTo" name="allocatedTo" class="dept-input">
				  <option value="">Select Staff</option>
				</select>

			  <button type="submit" class="dept-btn" onclick="return validateItem()">
				Edit department
			  </button>
			</form>

		  </div>
		</div>

      <!-- end Testimonial --> 

<%@ include file="footer.html" %>


