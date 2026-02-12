<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.luminar.dao.StaffDAO"%>
<%@ page import="com.luminar.model.StaffBean"%>
<%@ page import="java.util.List"%>

<%
String deptIdStr = request.getParameter("deptId");

if (deptIdStr == null || deptIdStr.trim().isEmpty()) {
    return;
}

int deptId = Integer.parseInt(deptIdStr);

List<StaffBean> staffs = StaffDAO.getStaffByDepartment(deptId);

//default option
out.print("<option value=''>Select Staff</option>");

//staff selection based on department
for (StaffBean staff : staffs) {
    out.print(
        "<option value='" + staff.getStaffId() + "'>" +
        staff.getStaffName() +
        "</option>"
    );
}
%>
