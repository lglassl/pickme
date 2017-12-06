package kr.or.pickme.dto;

import java.util.List;

public class CoverletterDTO2 {
	
	private int cover_no;
	private int resu_code;
	private String username;
	private int pick_code;
	private int pick_no;
	private String intro_no;
	private int intro_lim;
	private String resu_ctmt;
	private String resu_edit;
	
	public int getCover_no() {
		return cover_no;
	}
	public void setCover_no(int cover_no) {
		this.cover_no = cover_no;
	}
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
	public int getPick_no() {
		return pick_no;
	}
	public void setPick_no(int pick_no) {
		this.pick_no = pick_no;
	}
	public String getIntro_no() {
		return intro_no;
	}
	public void setIntro_no(String intro_no) {
		this.intro_no = intro_no;
	}
	public int getIntro_lim() {
		return intro_lim;
	}
	public void setIntro_lim(int intro_lim) {
		this.intro_lim = intro_lim;
	}
	public String getResu_ctmt() {
		return resu_ctmt;
	}
	public void setResu_ctmt(String resu_ctmt) {
		this.resu_ctmt = resu_ctmt;
	}
	public String getResu_edit() {
		return resu_edit;
	}
	public void setResu_edit(String resu_edit) {
		this.resu_edit = resu_edit;
	}
	@Override
	public String toString() {
		return "CoverletterDTO [cover_no=" + cover_no + ", resu_code=" + resu_code + ", username=" + username
				+ ", pick_code=" + pick_code + ", pick_no=" + pick_no + ", intro_no=" + intro_no + ", intro_lim="
				+ intro_lim + ", resu_ctmt=" + resu_ctmt + ", resu_edit=" + resu_edit + "]";
	}
	
	
	
}
