<%@ page import="java.util.List" %>
<%@ page import="com.luminar.dao.StudentBasicDAO" %>
<%@ page import="com.luminar.model.StudentBasicBean" %>

<%
String examIdStr = request.getParameter("examId");
String currentStudentIdStr = request.getParameter("currentStudentId");

if (examIdStr == null || currentStudentIdStr == null) return;

int examId = Integer.parseInt(examIdStr);
int currentStudentId = Integer.parseInt(currentStudentIdStr);

List<StudentBasicBean> students =
    StudentBasicDAO.getStudentsforEditExamResult(examId, currentStudentId);

out.print("<option value=''>-- Select Student --</option>");

for (StudentBasicBean student : students) {
    out.print("<option value='" + student.getStuId() + "'>" +
    		student.getStuName() +
              "</option>");
}
%>
