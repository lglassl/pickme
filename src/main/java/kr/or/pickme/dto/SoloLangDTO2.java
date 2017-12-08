package kr.or.pickme.dto;

public class SoloLangDTO2 {
	private int resu_code;
	private String username;
	private int lang_no;
	private String lang_field;
	private String lang_testname;
	private String lang_grade;
	private String lang_getdate;
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
	public int getLang_no() {
		return lang_no;
	}
	public void setLang_no(int lang_no) {
		this.lang_no = lang_no;
	}
	public String getLang_field() {
		return lang_field;
	}
	public void setLang_field(String lang_field) {
		this.lang_field = lang_field;
	}
	public String getLang_testname() {
		return lang_testname;
	}
	public void setLang_testname(String lang_testname) {
		this.lang_testname = lang_testname;
	}
	public String getLang_grade() {
		return lang_grade;
	}
	public void setLang_grade(String lang_grade) {
		this.lang_grade = lang_grade;
	}
	public String getLang_getdate() {
		return lang_getdate;
	}
	public void setLang_getdate(String lang_getdate) {
		this.lang_getdate = lang_getdate;
	}
	@Override
	public String toString() {
		return "SoloLangDTO2 [resu_code=" + resu_code + ", username=" + username + ", lang_no=" + lang_no
				+ ", lang_field=" + lang_field + ", lang_testname=" + lang_testname + ", lang_grade=" + lang_grade
				+ ", lang_getdate=" + lang_getdate + "]";
	}
	
	
	
}
