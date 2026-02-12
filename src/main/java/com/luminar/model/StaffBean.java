package com.luminar.model;

public class StaffBean {

	private int staffId;
	private int departmentId;
	private int roleId;
	private String staffRollNo;
	private String staffName;
	private String contactNo;

	public StaffBean() {
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getStaffRollNo() {
		return staffRollNo;
	}

	public void setStaffRollNo(String staffRollNo) {
		this.staffRollNo = staffRollNo;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	};

}
