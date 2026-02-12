package com.luminar.dto;

import java.sql.Date;

public class ExamDetailDTO {
	
	private int examDetailId;
	private String examDetailName;
	private int examModeId;
	private String examModeName;
	private Date examDate;
	private int passScore;
	private int staffId;
	private int deptId;
	private String staffName;
	
	public ExamDetailDTO() {}

	public int getExamDetailId() {
		return examDetailId;
	}

	public void setExamDetailId(int examDetailId) {
		this.examDetailId = examDetailId;
	}
	
	public int getExamModeId() {
		return examModeId;
	}

	public void setExamModeId(int examModeId) {
		this.examModeId = examModeId;
	}
	
	public void setExamModeName(String examModeName) {
		this.examModeName = examModeName;
	}

	public String getExamDetailName() {
		return examDetailName;
	}

	public String getExamModeName() {
		return examModeName;
	}

	public void setExamDetailName(String examDetailName) {
		this.examDetailName = examDetailName;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	
	public int getPassScore() {
		return passScore;
	}

	public void setPassScore(int passScore) {
		this.passScore = passScore;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	
	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	};
	
}
