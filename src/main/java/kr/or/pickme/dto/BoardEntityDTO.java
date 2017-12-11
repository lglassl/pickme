package kr.or.pickme.dto;

public class BoardEntityDTO {
	private int entity_code;
	private String entity_title;
	private String username;
	private String entity_ctmt;
	private String entity_date;
	private int entity_ref;
	private int entity_ref_step;
	private int entity_ref_level;
	private int entity_status;
	private int entity_notice;
	
	public int getEntity_notice() {
		return entity_notice;
	}
	public void setEntity_notice(int entity_notice) {
		this.entity_notice = entity_notice;
	}
	public int getEntity_code() {
		return entity_code;
	}
	public void setEntity_code(int entity_code) {
		this.entity_code = entity_code;
	}
	public String getEntity_title() {
		return entity_title;
	}
	public void setEntity_title(String entity_title) {
		this.entity_title = entity_title;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEntity_ctmt() {
		return entity_ctmt;
	}
	public void setEntity_ctmt(String entity_ctmt) {
		this.entity_ctmt = entity_ctmt;
	}
	public String getEntity_date() {
		return entity_date;
	}
	public void setEntity_date(String entity_date) {
		this.entity_date = entity_date;
	}
	public int getEntity_ref() {
		return entity_ref;
	}
	public void setEntity_ref(int entity_ref) {
		this.entity_ref = entity_ref;
	}
	public int getEntity_ref_step() {
		return entity_ref_step;
	}
	public void setEntity_ref_step(int entity_ref_step) {
		this.entity_ref_step = entity_ref_step;
	}
	public int getEntity_ref_level() {
		return entity_ref_level;
	}
	public void setEntity_ref_level(int entity_ref_level) {
		this.entity_ref_level = entity_ref_level;
	}
	public int getEntity_status() {
		return entity_status;
	}
	public void setEntity_status(int entity_status) {
		this.entity_status = entity_status;
	}
	@Override
	public String toString() {
		return "BoardEntityDTO [entity_code=" + entity_code + ", entity_title=" + entity_title + ", username="
				+ username + ", entity_ctmt=" + entity_ctmt + ", entity_date=" + entity_date + ", entity_ref="
				+ entity_ref + ", entity_ref_step=" + entity_ref_step + ", entity_ref_level=" + entity_ref_level
				+ ", entity_status=" + entity_status + ", entity_notice=" + entity_notice + "]";
	}
	
	
}
