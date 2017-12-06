package kr.or.pickme.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UserComPpDTO {
	private String username;		//기업아이디
	private String comp_pp_name;	//담당자이름
	private String comp_pp_job;		//담당자직책
	private String password;		//비밀번호
	private String comp_pp_phone;	//전화번호
	private String comp_pp_email;	//이메일
	private String comp_name;		//기업명
	private String comp_num;		//사업자등록번호
	private String comp_logo;		//기업로고이미지
	private int comp_count;			//사원수
	private String comp_year;		//설립연도
	
	private String comp_field;
	private String comp_addr;
	//단일파일
	private CommonsMultipartFile file;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComp_pp_name() {
		return comp_pp_name;
	}
	public void setComp_pp_name(String comp_pp_name) {
		this.comp_pp_name = comp_pp_name;
	}
	public String getComp_pp_job() {
		return comp_pp_job;
	}
	public void setComp_pp_job(String comp_pp_job) {
		this.comp_pp_job = comp_pp_job;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getComp_pp_phone() {
		return comp_pp_phone;
	}
	public void setComp_pp_phone(String comp_pp_phone) {
		this.comp_pp_phone = comp_pp_phone;
	}
	public String getComp_pp_email() {
		return comp_pp_email;
	}
	public void setComp_pp_email(String comp_pp_email) {
		this.comp_pp_email = comp_pp_email;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_num() {
		return comp_num;
	}
	public void setComp_num(String comp_num) {
		this.comp_num = comp_num;
	}
	public String getComp_logo() {
		return comp_logo;
	}
	public void setComp_logo(String comp_logo) {
		this.comp_logo = comp_logo;
	}
	public int getComp_count() {
		return comp_count;
	}
	public void setComp_count(int comp_count) {
		this.comp_count = comp_count;
	}
	public String getComp_year() {
		return comp_year;
	}
	public void setComp_year(String comp_year) {
		this.comp_year = comp_year;
	}
	public String getComp_field() {
		return comp_field;
	}
	public void setComp_field(String comp_field) {
		this.comp_field = comp_field;
	}
	public String getComp_addr() {
		return comp_addr;
	}
	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "UserComPpDTO [username=" + username + ", comp_pp_name=" + comp_pp_name + ", comp_pp_job=" + comp_pp_job
				+ ", password=" + password + ", comp_pp_phone=" + comp_pp_phone + ", comp_pp_email=" + comp_pp_email
				+ ", comp_name=" + comp_name + ", comp_num=" + comp_num + ", comp_logo=" + comp_logo + ", comp_count="
				+ comp_count + ", comp_year=" + comp_year + ", comp_field=" + comp_field + ", comp_addr=" + comp_addr
				+ ", file=" + file + "]";
	}	

}
