<%
if (session == null || session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ page errorPage="error.jsp" %>

<%@ include file="header.jsp"  %>

<%@ page import="com.luminar.model.ExamDetailsBean"%>
<%@ page import="com.luminar.dao.ExamDetailsDAO"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
ExamDetailsBean examDetails=ExamDetailsDAO.fetchUpcomingExam();
Date examDate=examDetails.getExamDetailDate();
String formattedDate = "";

if (examDate != null) {

    LocalDate localDate = examDate.toLocalDate();

    DateTimeFormatter formatter =
            DateTimeFormatter.ofPattern("MMMM dd, yyyy");

    formattedDate = localDate.format(formatter);
}
%>

<section class="home-wrapper">

		  <!-- Welcome user -->
		  <!--  -->
		  <div class="welcome-user">
			<h2><i class="fa-solid fa-user-check"></i>Welcome, <%=currentUserRole %></h2>
			<p>Here's a quick overview of your examination dashboard.</p>
		  </div>

		  <!-- System Overview -->
		  <div class="system-overview">
			<h2>System Overview</h2>
			<p>
			  Our Exam Management System offers a centralized solution to manage the
			  complete examination lifecycle. The system ensures accuracy,
			  transparency, and efficiency in exam administration.
			</p>
		  </div>

		  <!-- Main Card -->
		  <div class="overview-card">

			<!-- Notice Board -->
			<div class="notice-board">
			  <h3><i class="fa-solid fa-bullhorn"></i> Notice Board</h3>
			  <ul>
				<li>Upcoming exams on <strong><%=formattedDate %></strong></li>
				<!-- <li>Results publication on <strong>June 1, 2025</strong></li> -->
				<li>System maintenance on <strong>April 30, 2025</strong></li>
			  </ul>
			</div>

			<!-- Quick Links -->
			<div class="quick-links">
			  <h3><i class="fa-solid fa-link"></i> Quick Links</h3>
			  <ul>
				<li><a href="addExam.jsp">New Exam</a></li>
				<li><a href="addExamResult.jsp">Add new result</a></li>
				<li><a href="addStudent.jsp">Add a student</a></li>
				<li><a href="manageStudents.jsp">Student Records</a></li>
			  </ul>
			</div>

		  </div>

		</section>
     
     

<%@ include file="footer.html" %>