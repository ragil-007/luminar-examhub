<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="header.jsp"%>

<!-- end header -->

<!-- Testimonial -->
<div id="testimonial" class="testimonial">
	<div class="dept-header">
		<button type="button" class="icon-back-btn back-arrow-btn"
			onclick="history.back()"></button>

	</div>

	<div class="dept-card">

		<h2 class="dept-title">Students</h2>

		<form name="addStudent" method="post" action="addStudentAction.jsp">

			<!-- Default fields -->
			<input type="text" name="studentName" placeholder="Student name"
				class="dept-input" required />
			<input type="text" name="contactNo" placeholder="Contact number" 
			class="dept-input" required /> 
			<input type="text" name="qualification" placeholder="Qualification" 
			class="dept-input" required />
			<select name="graduationYear" class="dept-input" required>
			  <option value="">Select graduation year</option>
			
			  <%
			    int currentYear = java.time.Year.now().getValue();
			    for (int year = currentYear; year >= 1990; year--) {
			  %>
			      <option value="<%= year %>"><%= year %></option>
			  <%
			    }
			  %>
			</select>


			<!-- Experience radio -->
			<div class="exp-radio-group">
				<label>Any additional experience?</label>

				<div class="exp-radio">
					<label> <input type="radio" name="hasExperience"
						value="true" onclick="toggleExperience(true)"> Yes
					</label> <label> <input type="radio" name="hasExperience"
						value="false" checked onclick="toggleExperience(false)"> No
					</label>
				</div>
			</div>

			<!-- Experience section (hidden by default) -->
			<div id="experienceSection" class="experience-section">

				<input type="text" name="totalExperience"
					placeholder="Total experience (in years)" class="dept-input" />

				<input type="text" name="currentEmployer"
					placeholder="Current employer" class="dept-input" /> 
				<input type="text" name="currentDesignation"
					placeholder="Current designation" class="dept-input" /> 
				<input type="text" name="technology" placeholder="Technology"
					class="dept-input" />

			</div>

			<button type="submit" class="dept-btn">Add Student</button>

		</form>


	</div>
</div>

<!-- end Testimonial -->

<%@ include file="footer.html"%>
