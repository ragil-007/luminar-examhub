package com.luminar.model;

public class ExamScoreBean {
	
	private int examScoreId;
	private int examDetailId;
	private int studentId;
	private int examScore;
	private String Comments;
	
	public ExamScoreBean() {}

	public int getExamScoreId() {
		return examScoreId;
	}

	public void setExamScoreId(int examScoreId) {
		this.examScoreId = examScoreId;
	}

	public int getExamDetailId() {
		return examDetailId;
	}

	public void setExamDetailId(int examDetailId) {
		this.examDetailId = examDetailId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getExamScore() {
		return examScore;
	}

	public void setExamScore(int examScore) {
		this.examScore = examScore;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	};
	
	

}
