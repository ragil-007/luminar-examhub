<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if (session == null || session.getAttribute("user") == null) {
    response.sendRedirect("../index.html");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Luminar</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
	  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
	  
	  <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	 
	  <link rel="stylesheet" href="css/custom.css">
	  <link rel="stylesheet" href="css/homepage.css">
	  <link rel="stylesheet" href="css/tablestyle.css">
	  <link rel="stylesheet" href="css/formstyle.css">
	  <link rel="stylesheet" href="css/errorstyle.css">
	  <link rel="stylesheet" href="css/reports.css">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <script src="js/confirmation.js"></script>
	  
	  <script>
		  document.addEventListener("DOMContentLoaded", function () {
			const trigger = document.getElementById("profileTrigger");
			const dropdown = document.getElementById("profileDropdown");

			trigger.addEventListener("click", function (e) {
			  e.stopPropagation();
			  dropdown.classList.toggle("show");
			});

			document.addEventListener("click", function () {
			  dropdown.classList.remove("show");
			});
		  });
		</script>
		
		


   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#" width="90px" height="90px"/></div>
      </div>
      <!-- end loader --> 
		<!-- header -->
			<header>
				 <div class="header">
					<div class="container header-inner">

					  <!-- LOGO (LEFT) -->
					  <div class="header-logo">
						<a href="hrAndTrainerHome.jsp">
						  <img src="images/logo.png" alt="Luminar Logo">
						</a>
					  </div>

					  <!-- NAV MENU (CENTER) -->
					  <nav class="header-nav">
						<ul class="menu-area-main">
						  <li class="active"><a href="hrAndTrainerHome.jsp">Home</a></li>
						  <li><a href="AllocatedExams.jsp">Allocated exams</a></li>
						  <li><a href="viewExamResults.jsp">Exam results</a></li>
						  <li><a href="manageReports.jsp">Reports</a></li>
						</ul>
					  </nav>
					  
					  <%
						String currentUser=(String) session.getAttribute("user");
					  	currentUser=currentUser.substring(0, 1).toUpperCase() + currentUser.substring(1);
					  	String currentUserRole=(String) session.getAttribute("role");
						%>

					  <!-- PROFILE (RIGHT) -->
					  <div class="header-profile" id="profileTrigger">
						<img src="images/user-avatar.png" class="user-avatar" alt="User">
						<span class="user-name"><%=currentUser %></span>
					  </div>
						<div class="profile-dropdown" id="profileDropdown">
						  <div class="dropdown-header">
							<img src="images/user-avatar.png" class="dropdown-avatar">
							<div>
							  <div class="dropdown-name"><%= currentUser %></div>
							  <div class="dropdown-email"><%=currentUserRole %></div>
							</div>
						  </div>

						  <div class="dropdown-divider"></div>

						  
						  <a href="logout.jsp" class="dropdown-item logout">Log out</a>
						</div>
					</div>
				 </div>
			</header>

      <!-- end header -->
			