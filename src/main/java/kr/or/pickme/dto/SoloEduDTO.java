package kr.or.pickme.dto;

import java.util.List;

public class SoloEduDTO {
	
	private String username;
	private int edu_no;
	private String edu_institute;
	private String edu_start;
	private String edu_end;
	private String edu_category;
	private String edu_major;
	private String edu_grade;
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getEdu_no() {
		return edu_no;
	}

	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}

	public String getEdu_institute() {
		return edu_institute;
	}

	public void setEdu_institute(String edu_institute) {
		this.edu_institute = edu_institute;
	}

	public String getEdu_start() {
		return edu_start;
	}

	public void setEdu_start(String edu_start) {
		this.edu_start = edu_start;
	}

	public String getEdu_end() {
		return edu_end;
	}

	public void setEdu_end(String edu_end) {
		this.edu_end = edu_end;
	}

	public String getEdu_category() {
		return edu_category;
	}

	public void setEdu_category(String edu_category) {
		this.edu_category = edu_category;
	}

	public String getEdu_major() {
		return edu_major;
	}

	public void setEdu_major(String edu_major) {
		this.edu_major = edu_major;
	}

	public String getEdu_grade() {
		return edu_grade;
	}

	public void setEdu_grade(String edu_grade) {
		this.edu_grade = edu_grade;
	}

	@Override
	public String toString() {
		return "SoloEduDTO [username=" + username + ", edu_no=" + edu_no + ", edu_institute=" + edu_institute
				+ ", edu_start=" + edu_start + ", edu_end=" + edu_end + ", edu_category=" + edu_category
				+ ", edu_major=" + edu_major + ", edu_grade=" + edu_grade + "]";
	}

	


	
}
