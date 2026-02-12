package com.luminar.model;

public class StudentExperienceBean {
	
	private int StuExpId;
	private int stuId;
	private String stuCompany;
	private String stuDesignation;
	private int stuTotalExp;
	private String stuTech;
	
	public StudentExperienceBean() {}

	public int getStuExpId() {
		return StuExpId;
	}

	public void setStuExpId(int stuExpId) {
		StuExpId = stuExpId;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public String getStuCompany() {
		return stuCompany;
	}

	public void setStuCompany(String stuCompany) {
		this.stuCompany = stuCompany;
	}

	public String getStuDesignation() {
		return stuDesignation;
	}

	public void setStuDesignation(String stuDesignation) {
		this.stuDesignation = stuDesignation;
	}

	public int getStuTotalExp() {
		return stuTotalExp;
	}

	public void setStuTotalExp(int stuTotalExp) {
		this.stuTotalExp = stuTotalExp;
	}

	public String getStuTech() {
		return stuTech;
	}

	public void setStuTech(String stuTech) {
		this.stuTech = stuTech;
	};
	
	

}
