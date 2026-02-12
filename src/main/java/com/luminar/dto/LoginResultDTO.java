package com.luminar.dto;

public class LoginResultDTO {
	
	    private int userId;
	    private String userName;
	    private String role;
	    
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}

}
