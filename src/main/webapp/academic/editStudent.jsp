<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.luminar.dao.StudentBasicDAO"%>
<%@ page import="com.luminar.model.StudentBasicBean"%>
<%@ page import="com.luminar.dto.StudentResultDTO"%>
<%@ page import="com.luminar.dao.StudentExperienceDAO"%>
<%@ page import="com.luminar.model.StudentExperienceBean"%>
<%@ page import="java.util.List"%>



<%@ include file="header.jsp"%>

<%
int stuId = Integer.parseInt(request.getParameter("stuId"));

StudentResultDTO student = StudentBasicDAO.getStudent(stuId);

boolean hasExperience=false;

if(student.getStuTotalExp()>0){
	hasExperience=true;
}

%>

<!-- Testimonial -->
<div id="testimonial" class="testimonial">
	<div class="dept-header">
		<button type="button" class="icon-back-btn back-arrow-btn"
			onclick="history.back()"></button>

	</div>

	<div class="dept-card">

		<h2 class="dept-title">Students</h2>

		<form method="post" action="editStudentAction.jsp">

			<!-- Basic fields -->
			<input type="hidden" name="stuId"
				value="<%=student.getStuId()%>" class="dept-input" required />
				
			<input type="text" name="studentName"
				value="<%=student.getStuName()%>" class="dept-input" required />

			<input type="text" name="contactNo"
				value="<%=student.getStuContact()%>" class="dept-input" required />

			<input type="text" name="qualification"
				value="<%=student.getStuQualification()%>" class="dept-input"
				required /> 
				
				<select name="graduationYear" class="dept-input" required>
				  <option value="">Select graduation year</option>
				
				  <%
				    int currentYear = java.time.Year.now().getValue();
				    int selectedYear = student.getStuGraduationDate();
				
				    for (int year = currentYear; year >= 1990; year--) {
				  %>
				      <option value="<%= year %>"
				        <%= (year == selectedYear) ? "selected" : "" %>>
				        <%= year %>
				      </option>
				  <%
				    }
				  %>
				</select>


			<!-- Experience radio -->
			<div class="exp-radio-group">
				<label>Any additional experience?</label>

				<div class="exp-radio">
					<label> <input type="radio" name="hasExperience"
						value="true" <%=hasExperience ? "checked" : ""%>
						onclick="toggleExperience(true)"> Yes
					</label> <label> <input type="radio" name="hasExperience"
						value="false" <%=!hasExperience ? "checked" : ""%>
						onclick="toggleExperience(false)"> No
					</label>
				</div>
			</div>

			<!-- Experience section -->
			<div id="experienceSection" class="experience-section"
				style="<%=hasExperience ? "display:block;" : "display:none;"%>">

				<input type="text" name="totalExperience"
					value="<%=student.getStuTotalExp()%>" placeholder="Total experience (in years)" class="dept-input" />

				<input type="text" name="currentEmployer"
					value="<%=student.getStuCompany()%>" placeholder="Current employer" class="dept-input" />

				<input type="text" name="currentDesignation"
					value="<%=student.getStuDesignation()%>" placeholder="Current designation" class="dept-input" />

				<input type="text" name="technology"
					value="<%=student.getStuTech()%>" placeholder="Technology" class="dept-input" />

			</div>

			<button type="submit" class="dept-btn">Update Student</button>

		</form>

	</div>
</div>

<!-- end Testimonial -->

<%@ include file="footer.html"%>
