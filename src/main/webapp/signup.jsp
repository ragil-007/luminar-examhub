<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.luminar.model.DepartmentBean"%>
<%@ page import="com.luminar.dao.DepartmentDAO"%>
<%@ page import="com.luminar.model.RoleBean"%>
<%@ page import="com.luminar.dao.RoleDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-up</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/signup.css" rel="stylesheet" type="text/css" />

<!--<script language="javascript">
	document.onmousedown=disableclick;
	status="Welcome to Demo Project";
	function disableclick(event)
	{
	if(event.button==2)
	{
	alert(status);
	return false;
	}
	}
	</script>-->

<!--<script type = "text/javascript" >
	function preventBack()
	{
	window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload=function(){null};
	</script>-->

</head>
<body>

	<div class="page-wrapper">

  <!-- LEFT SIDE ILLUSTRATION -->
  <div class="left-bg">

    <!-- LOGO OVERLAY -->
    <div class="brand-overlay">
      <img src="images/login-side.png" alt="Luminar Logo">
      <p>Kerala's No.1 Software Training Institute</p>
    </div>

  </div>

  <!-- RIGHT SIDE FORM -->
  <div class="right-form">
    <div class="login">
		<h2>Signup</h2>
		<form name="signup" id="signup" method="post" action="signupAction.jsp">
		
		<!-- Department dropdown -->
			    <select name="departmentId" id="department" class="dropdown" required>
			        <option value="">-- Select Department --</option>
			
			        <%
						List<DepartmentBean> departments=DepartmentDAO.listDepartments();
			            for (DepartmentBean dept : departments) {
			        %>
			            <option value="<%= dept.getDeptId() %>">
			                <%= dept.getDeptName() %>
			            </option>
			        <%
			            }
			        %>
			    </select>

		  <input type="text" class="textfield" name="rollno" placeholder="Enter your roll no" required/>
		  <input type="text" class="textfield" name="staffName" placeholder="Enter your name" required/>
		  <input type="text" class="textfield" name="contact" placeholder="Enter your contact no" required/>
		  <input type="text" class="textfield" name="username" placeholder="Enter your desired username" required/>
		  <input type="password" class="textfield" name="password" placeholder="Enter your desired password" required/>

		  <input type="submit" value="Signup" />

		  <div class="sign-up">
			<label>Already have an account?</label>
			<a href="index.html">Login</a>
		  </div>

		</form>

    </div>
  </div>

</div>

</body>
</html>