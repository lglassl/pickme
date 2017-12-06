package kr.or.pickme.dto;

import java.util.List;

public class CompPickInfoDTO {
	private String username;	//기업아이디
	private int pick_code;		//공고코드
	private String pick_start;	//채용시작
	private String pick_end;	//채용마감
	private int hire_code;		//채용형태코드
	private String hire_field;	//채용형태
	private int job_code;		//직무코드
	private String job_field;	//직무종류
	private String pick_ctmt;	//채용내용
	private String pick_num;	//채용인원
	private String pick_qulify;	//지원자격
	private int pick_apply_num;	//지원자수
	private String intro_no;	//항목
	private int intro_lim;		//글자수
	
	private List<CompPickInfoDTO> list;

	public List<CompPickInfoDTO> getList() {
		return list;
	}
	public void setList(List<CompPickInfoDTO> list) {
		this.list = list;
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
	public String getPick_start() {
		return pick_start;
	}
	public void setPick_start(String pick_start) {
		this.pick_start = pick_start.substring(0, 10);
	}
	public String getPick_end() {
		return pick_end;
	}
	public void setPick_end(String pick_end) {
		this.pick_end = pick_end;
	}
	public int getHire_code() {
		return hire_code;
	}
	public void setHire_code(int hire_code) {
		this.hire_code = hire_code;
	}
	public String getHire_field() {
		return hire_field;
	}
	public void setHire_field(String hire_field) {
		this.hire_field = hire_field;
	}
	public int getJob_code() {
		return job_code;
	}
	public void setJob_code(int job_code) {
		this.job_code = job_code;
	}
	public String getJob_field() {
		return job_field;
	}
	public void setJob_field(String job_field) {
		this.job_field = job_field;
	}
	public String getPick_ctmt() {
		return pick_ctmt;
	}
	public void setPick_ctmt(String pick_ctmt) {
		this.pick_ctmt = pick_ctmt;
	}
	public String getPick_num() {
		return pick_num;
	}
	public void setPick_num(String pick_num) {
		this.pick_num = pick_num;
	}
	public String getPick_qulify() {
		return pick_qulify;
	}
	public void setPick_qulify(String pick_qulify) {
		this.pick_qulify = pick_qulify;
	}
	public int getPick_apply_num() {
		return pick_apply_num;
	}
	public void setPick_apply_num(int pick_apply_num) {
		this.pick_apply_num = pick_apply_num;
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
	@Override
	public String toString() {
		return "CompPickInfoDTO [username=" + username + ", pick_code=" + pick_code + ", pick_start=" + pick_start
				+ ", pick_end=" + pick_end + ", hire_code=" + hire_code + ", hire_field=" + hire_field + ", job_code="
				+ job_code + ", job_field=" + job_field + ", pick_ctmt=" + pick_ctmt + ", pick_num=" + pick_num
				+ ", pick_qulify=" + pick_qulify + ", pick_apply_num=" + pick_apply_num + ", intro_no=" + intro_no
				+ ", intro_lim=" + intro_lim + ", list=" + list + "]";
	}

	
	
}
