package kr.or.pickme.dto;

public class EntityReplyDTO {
	private String entity_re_code;
	private String entity_code;
	private String entity_parent;
	private String entity_re_depth;
	private String entity_re_pwd;
	private String entity_re_ctmt;
	private String entity_re_date;
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "EntityReplyDTO [entity_re_pwd=" + entity_re_pwd + "]";
	}
	public String getEntity_re_code() {
		return entity_re_code;
	}
	public void setEntity_re_code(String entity_re_code) {
		this.entity_re_code = entity_re_code;
	}
	public String getEntity_code() {
		return entity_code;
	}
	public void setEntity_code(String entity_code) {
		this.entity_code = entity_code;
	}
	public String getEntity_parent() {
		return entity_parent;
	}
	public void setEntity_parent(String entity_parent) {
		this.entity_parent = entity_parent;
	}
	public String getEntity_re_depth() {
		return entity_re_depth;
	}
	public void setEntity_re_depth(String entity_re_depth) {
		this.entity_re_depth = entity_re_depth;
	}
	public String getEntity_re_pwd() {
		return entity_re_pwd;
	}
	public void setEntity_re_pwd(String entity_re_pwd) {
		this.entity_re_pwd = entity_re_pwd;
	}
	public String getEntity_re_ctmt() {
		return entity_re_ctmt;
	}
	public void setEntity_re_ctmt(String entity_re_ctmt) {
		this.entity_re_ctmt = entity_re_ctmt;
	}
	public String getEntity_re_date() {
		return entity_re_date;
	}
	public void setEntity_re_date(String entity_re_date) {
		this.entity_re_date = entity_re_date;
	}
	public String getUseranme() {
		return useranme;
	}
	public void setUseranme(String useranme) {
		this.useranme = useranme;
	}
	private String useranme;
}
