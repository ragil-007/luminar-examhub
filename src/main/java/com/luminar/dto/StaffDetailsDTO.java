package com.luminar.dto;

public class StaffDetailsDTO {
	
	private int staffId;
	private int roleId;
	private String staffName;
	private String staffRollNo;
	private String StaffContactNo;
	private String deptName;
	
	public StaffDetailsDTO() {}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffRollNo() {
		return staffRollNo;
	}

	public void setStaffRollNo(String staffRollNo) {
		this.staffRollNo = staffRollNo;
	}

	public String getStaffContactNo() {
		return StaffContactNo;
	}

	public void setStaffContactNo(String staffContactNo) {
		StaffContactNo = staffContactNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	};
	
	

}
