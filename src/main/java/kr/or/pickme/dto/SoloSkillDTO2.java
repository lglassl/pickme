package kr.or.pickme.dto;

public class SoloSkillDTO2 {
	private int resu_code;
	private String username;
	private int skill_no;
	private String skill_name;
	

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
	public int getSkill_no() {
		return skill_no;
	}
	public void setSkill_no(int skill_no) {
		this.skill_no = skill_no;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	@Override
	public String toString() {
		return "SoloSkillDTO2 [resu_code=" + resu_code + ", username=" + username + ", skill_no=" + skill_no
				+ ", skill_name=" + skill_name + "]";
	}
	
	
}
