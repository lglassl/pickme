package kr.or.pickme.dto;

import java.util.ArrayList;
import java.util.List;

public class SoloAwardDTO {
	private String username;
	private int award_no;
	private String award_name;
	private String award_co;
	private String award_year;
	private String award_activity;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAward_no() {
		return award_no;
	}
	public void setAward_no(int award_no) {
		this.award_no = award_no;
	}
	public String getAward_name() {
		return award_name;
	}
	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}
	public String getAward_co() {
		return award_co;
	}
	public void setAward_co(String award_co) {
		this.award_co = award_co;
	}
	public String getAward_year() {
		return award_year;
	}
	public void setAward_year(String award_year) {
		this.award_year = award_year;
	}
	public String getAward_activity() {
		return award_activity;
	}
	public void setAward_activity(String award_activity) {
		this.award_activity = award_activity;
	}
	@Override
	public String toString() {
		return "SoloAwardDTO [username=" + username + ", award_no=" + award_no + ", award_name=" + award_name
				+ ", award_co=" + award_co + ", award_year=" + award_year + ", award_activity=" + award_activity + "]";
	}
	
	
	

	
}
