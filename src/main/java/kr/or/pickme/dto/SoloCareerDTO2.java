package kr.or.pickme.dto;

public class SoloCareerDTO2 {
	private int resu_code;
	private String username;
	private int career_no;
	private String career_institute;
	private String career_start;
	private String career_end;
	private String career_task;
	private String career_activity;
	public int getResu_code() {
		return resu_code;
	}
	public void setResu_code(int resu_code) {
		this.resu_code = resu_code;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getCareer_no() {
		return career_no;
	}
	public void setCareer_no(int career_no) {
		this.career_no = career_no;
	}
	public String getCareer_institute() {
		return career_institute;
	}
	public void setCareer_institute(String career_institute) {
		this.career_institute = career_institute;
	}
	public String getCareer_start() {
		return career_start;
	}
	public void setCareer_start(String career_start) {
		this.career_start = career_start;
	}
	public String getCareer_end() {
		return career_end;
	}
	public void setCareer_end(String career_end) {
		this.career_end = career_end;
	}
	public String getCareer_task() {
		return career_task;
	}
	public void setCareer_task(String career_task) {
		this.career_task = career_task;
	}
	public String getCareer_activity() {
		return career_activity;
	}
	public void setCareer_activity(String career_activity) {
		this.career_activity = career_activity;
	}
	@Override
	public String toString() {
		return "SoloCareerDTO2 [resu_code=" + resu_code + ", username=" + username + ", career_no=" + career_no
				+ ", career_institute=" + career_institute + ", career_start=" + career_start + ", career_end="
				+ career_end + ", career_task=" + career_task + ", career_activity=" + career_activity + "]";
	}
	
	
	
	
}
