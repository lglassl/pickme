package kr.or.pickme.dto;

public class BoardQaDTO {
	
	private int qa_code;
	private String qa_title;
	private String username;
	private String qa_ctmt;
	private String qa_file1;
	private String qa_file2;
	private String qa_date;
	private int qa_ref;
	private int qa_ref_step;
	private String qa_ref_level;
	private String qa_status;
	private int qa_notice;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getQa_code() {
		return qa_code;
	}
	public void setQa_code(int qa_code) {
		this.qa_code = qa_code;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	
	public String getQa_ctmt() {
		return qa_ctmt;
	}
	public void setQa_ctmt(String qa_ctmt) {
		this.qa_ctmt = qa_ctmt;
	}
	public String getQa_file1() {
		return qa_file1;
	}
	public void setQa_file1(String qa_file1) {
		this.qa_file1 = qa_file1;
	}
	public String getQa_file2() {
		return qa_file2;
	}
	public void setQa_file2(String qa_file2) {
		this.qa_file2 = qa_file2;
	}
	public String getQa_date() {
		return qa_date;
	}
	public void setQa_date(String qa_date) {
		this.qa_date = qa_date;
	}
	public int getQa_ref() {
		return qa_ref;
	}
	public void setQa_ref(int qa_ref) {
		this.qa_ref = qa_ref;
	}
	public int getQa_ref_step() {
		return qa_ref_step;
	}
	public void setQa_ref_step(int qa_ref_step) {
		this.qa_ref_step = qa_ref_step;
	}
	public String getQa_ref_level() {
		return qa_ref_level;
	}
	public void setQa_ref_level(String qa_ref_level) {
		this.qa_ref_level = qa_ref_level;
	}
	public String getQa_status() {
		return qa_status;
	}
	public void setQa_status(String qa_status) {
		this.qa_status = qa_status;
	}
	public int getQa_notice() {
		return qa_notice;
	}
	public void setQa_notice(int qa_notice) {
		this.qa_notice = qa_notice;
	}
	@Override
	public String toString() {
		return "BoardQaDTO [qa_code=" + qa_code + ", qa_title=" + qa_title + ", qa_ctmt=" + qa_ctmt + ", qa_file1=" + qa_file1 + ", qa_file2="
				+ qa_file2 + ", qa_date=" + qa_date + ", qa_ref=" + qa_ref + ", qa_ref_step=" + qa_ref_step
				+ ", qa_ref_level=" + qa_ref_level + ", qa_status=" + qa_status + ", qa_notice=" + qa_notice + "]";
	}
	
}