<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    // Invalidate the current session
    if (session != null) {
        session.invalidate();
    }

    // Redirect to login page
    response.sendRedirect("../index.html");
%>
