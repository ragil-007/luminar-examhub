<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.luminar.dao.StudentBasicDAO" %>
<%@ page import="com.luminar.model.StudentBasicBean" %>
<%@ page import="java.util.List"%>

<%
String examIdStr = request.getParameter("examId");

if (examIdStr == null || examIdStr.trim().isEmpty()) {
    return;
}

int examId = Integer.parseInt(examIdStr);

List<StudentBasicBean> students = StudentBasicDAO.getStudentsNotInExam(examId);

//default option
out.print("<option value=''>-- Select Student --</option>");

//staff selection based on department
for (StudentBasicBean student : students) {
    out.print("<option value='" + student.getStuId() + "'>" +
    		student.getStuName() +
              "</option>");
}
%>
