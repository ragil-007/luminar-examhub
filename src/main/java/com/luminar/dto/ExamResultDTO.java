package com.luminar.dto;

import java.sql.Date;

public class ExamResultDTO {
	
	private int examScoreId;
	private String examName;
	private Date examDate;
	private String studentName;
	private int passScore;
	private int examScore;
	private String examComments;
	
	public ExamResultDTO() {}

	public int getExamScoreId() {
		return examScoreId;
	}

	public void setExamScoreId(int examScoreId) {
		this.examScoreId = examScoreId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getExamScore() {
		return examScore;
	}

	public void setExamScore(int examScore) {
		this.examScore = examScore;
	}
	
	public int getPassScore() {
		return passScore;
	}

	public void setPassScore(int passScore) {
		this.passScore = passScore;
	};

	public String getExamComments() {
		return examComments;
	}

	public void setExamComments(String examComments) {
		this.examComments = examComments;
	}
	

}
