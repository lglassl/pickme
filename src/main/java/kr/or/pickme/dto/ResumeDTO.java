package kr.or.pickme.dto;

public class ResumeDTO {
	@Override
	public String toString() {
		return "ResumeDTO [resu_code=" + resu_code + ", username=" + username + ", pick_code=" + pick_code
				+ ", resu_ctmt=" + resu_ctmt + ", resu_edit=" + resu_edit + ", portpoilo_no=" + portpoilo_no
				+ ", portpolio_file=" + portpolio_file + ", resu_pick_job=" + resu_pick_job + ", paper_status="
				+ paper_status + ", paper_status_name=" + paper_status_name + ", edit_status=" + edit_status
				+ ", edit_status_name=" + edit_status_name + ", stat_male=" + stat_male + ", stat_fem=" + stat_fem
				+ ", stat_edu1=" + stat_edu1 + ", stat_edu2=" + stat_edu2 + ", stat_edu3=" + stat_edu3 + ", stat_edu4="
				+ stat_edu4 + ", stat_edu5=" + stat_edu5 + ", stat_edu6=" + stat_edu6 + ", stat_toeic1=" + stat_toeic1
				+ ", stat_toeic2=" + stat_toeic2 + ", stat_toeic3=" + stat_toeic3 + ", stat_toeic4=" + stat_toeic4
				+ ", stat_toeic5=" + stat_toeic5 + ", stat_tos1=" + stat_tos1 + ", stat_tos2=" + stat_tos2
				+ ", stat_tos3=" + stat_tos3 + ", stat_opic1=" + stat_opic1 + ", stat_opic2=" + stat_opic2
				+ ", stat_opic3=" + stat_opic3 + ", stat_opic4=" + stat_opic4 + "]";
	}
	private int resu_code;
	private String username;
	private int pick_code;
	private String resu_ctmt;
	private String resu_edit;
	private int portpoilo_no ;
	private String portpolio_file;
	private String resu_pick_job;
	private int pick_no;
	private int paper_status;
	private String paper_status_name;
	private int edit_status;
	private String edit_status_name;
	private int stat_male;
	private int stat_fem;
	private int stat_edu1;
	private int stat_edu2;
	private int stat_edu3;
	private int stat_edu4;
	private int stat_edu5;
	private int stat_edu6;
	private int stat_toeic1;
	private int stat_toeic2;
	private int stat_toeic3;
	private int stat_toeic4;
	private int stat_toeic5;
	private int stat_tos1;
	private int stat_tos2;
	private int stat_tos3;
	private int stat_opic1;
	private int stat_opic2;
	private int stat_opic3;
	private int stat_opic4;
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
	public int getPick_code() {
		return pick_code;
	}
	public void setPick_code(int pick_code) {
		this.pick_code = pick_code;
	}
	public String getResu_ctmt() {
		return resu_ctmt;
	}
	public void setResu_ctmt(String resu_ctmt) {
		this.resu_ctmt = resu_ctmt;
	}
	public int getPaper_status() {
		return paper_status;
	}
	public void setPaper_status(int paper_status) {
		this.paper_status = paper_status;
	}
	public int getEdit_status() {
		return edit_status;
	}
	public void setEdit_status(int edit_status) {
		this.edit_status = edit_status;
	}
	public String getResu_edit() {
		return resu_edit;
	}
	public void setResu_edit(String resu_edit) {
		this.resu_edit = resu_edit;
	}
	public int getPick_no() {
		return pick_no;
	}
	public void setPick_no(int pick_no) {
		this.pick_no = pick_no;
	}

	
}
