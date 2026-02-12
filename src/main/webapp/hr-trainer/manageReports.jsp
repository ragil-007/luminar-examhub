<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.luminar.dao.ReportDAO"%>


<%@ include file="header.jsp" %>

<%
    int totalStudents = ReportDAO.getTotalStudents();
    int totalDepartments = ReportDAO.getTotalDepartments();
    int totalStaff = ReportDAO.getTotalStaff();
    int totalExams = ReportDAO.getTotalExams();
%>

<section class="reports-section">
  <div class="reports-container">

    <h2 class="reports-title">System Reports</h2>
    <p class="reports-subtitle">Overall summary and statistics</p>

    <div class="reports-grid">

      <div class="report-card">
        <p class="report-label">Total Students</p>
        <h3 class="report-value"><%= totalStudents %></h3>
      </div>

      <div class="report-card">
        <p class="report-label">Total Departments</p>
        <h3 class="report-value"><%= totalDepartments %></h3>
      </div>

      <div class="report-card">
        <p class="report-label">Total Staff</p>
        <h3 class="report-value"><%= totalStaff %></h3>
      </div>

      <div class="report-card">
        <p class="report-label">Total Exams</p>
        <h3 class="report-value"><%= totalExams %></h3>
      </div>

    </div>

  </div>
</section>

<%@ include file="footer.html" %>
