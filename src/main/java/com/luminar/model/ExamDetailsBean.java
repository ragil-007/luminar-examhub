package com.luminar.model;

import java.sql.Date;

public class ExamDetailsBean {
	
	private int examDetailId;
	private int examModeId;
	private int passId;
	private String examDetailName;
	private Date examDetailDate;
	
	public ExamDetailsBean() {}

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

	public int getPassId() {
		return passId;
	}

	public void setPassId(int passId) {
		this.passId = passId;
	}

	public String getExamDetailName() {
		return examDetailName;
	}

	public void setExamDetailName(String examDetailName) {
		this.examDetailName = examDetailName;
	}

	public Date getExamDetailDate() {
		return examDetailDate;
	}

	public void setExamDetailDate(Date examDetailDate) {
		this.examDetailDate = examDetailDate;
	};
	
	

}
