<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isErrorPage="true" %>

<%@ include file="header.jsp"  %>

<!-- ERROR SECTION START -->
				<section class="ems-error-wrapper">
				  <div class="ems-error-panel">

					<div class="ems-error-accent"></div>

					<div class="ems-error-content">
					  <span class="ems-error-tag">System Alert</span>

					  <h1 class="ems-error-title">Something Went Wrong</h1>

					  <p class="ems-error-text">
						An unexpected issue occurred while processing your request.
						Please try again later or return to a safe page.
					  </p>

					  <div class="ems-error-actions">
						<a href="dashboard.html" class="ems-btn-primary">Go to Home</a>
						<button onclick="history.back()" class="ems-btn-back">
						  Go Back
						</button>
					  </div>
					</div>

				  </div>
				</section>


				<!-- ERROR SECTION END -->



<%@ include file="footer.html"  %>