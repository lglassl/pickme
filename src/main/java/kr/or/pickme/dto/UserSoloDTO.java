package kr.or.pickme.dto;

import java.util.List;

public class UserSoloDTO {
	private String username;
	private String solo_name;
	private String password;
	private String solo_birth;
	private String solo_gender;
	private String solo_email;
	private String solo_cphone;
	private String solo_addr;
	private String solo_lastedu;
	private String solo_enabled;
	private int solo_count;

	/////////////////////////////////////////////////////
	
	private List<SoloAwardDTO> awardList;
	private List<SoloCareerDTO> careerList;
	private List<SoloEduDTO> eduList;
	private List<SoloLangDTO> langList;
	private List<SoloLicenseDTO> licenseList;
	private List<SoloSkillDTO> skillList;
	///////////////// ** 파일 업로드 객체 추가**/// 단일 파일 업로드 //////////////////
	private String portpolio_file;
	
	public String getPortpolio_file() {
		return portpolio_file;
	}
	
	public void setPortpolio_file(String portpolio_file) {
		this.portpolio_file = portpolio_file;
	}
	
	private String portpolio_update;
	
	public String getPortpolio_update() {
		return portpolio_update;
	}
	public void setPortpolio_update(String portpolio_update) {
		this.portpolio_update = portpolio_update;
	}
	
//////////////////////////////////////////////////////////////////////////	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSolo_name() {
		return solo_name;
	}
	public void setSolo_name(String solo_name) {
		this.solo_name = solo_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSolo_birth() {
		return solo_birth;
	}
	public void setSolo_birth(String solo_birth) {
		this.solo_birth = solo_birth;
	}
	public String getSolo_gender() {
		return solo_gender;
	}
	public void setSolo_gender(String solo_gender) {
		this.solo_gender = solo_gender;
	}
	public String getSolo_email() {
		return solo_email;
	}
	public void setSolo_email(String solo_email) {
		this.solo_email = solo_email;
	}
	public String getSolo_cphone() {
		return solo_cphone;
	}
	public void setSolo_cphone(String solo_cphone) {
		this.solo_cphone = solo_cphone;
	}
	public String getSolo_addr() {
		return solo_addr;
	}
	public void setSolo_addr(String solo_addr) {
		this.solo_addr = solo_addr;
	}
	public String getSolo_lastedu() {
		return solo_lastedu;
	}
	public void setSolo_lastedu(String solo_lastedu) {
		this.solo_lastedu = solo_lastedu;
	}
	public String getSolo_enabled() {
		return solo_enabled;
	}
	public void setSolo_enabled(String solo_enabled) {
		this.solo_enabled = solo_enabled;
	}
	public int getSolo_count() {
		return solo_count;
	}
	public void setSolo_count(int solo_count) {
		this.solo_count = solo_count;
	}
	public List<SoloAwardDTO> getAwardList() {
		return awardList;
	}
	public void setAwardList(List<SoloAwardDTO> awardList) {
		this.awardList = awardList;
	}
	public List<SoloCareerDTO> getCareerList() {
		return careerList;
	}
	public void setCareerList(List<SoloCareerDTO> careerList) {
		this.careerList = careerList;
	}
	public List<SoloEduDTO> getEduList() {
		return eduList;
	}
	public void setEduList(List<SoloEduDTO> eduList) {
		this.eduList = eduList;
	}
	public List<SoloLangDTO> getLangList() {
		return langList;
	}
	public void setLangList(List<SoloLangDTO> langList) {
		this.langList = langList;
	}
	public List<SoloLicenseDTO> getLicenseList() {
		return licenseList;
	}
	public void setLicenseList(List<SoloLicenseDTO> licenseList) {
		this.licenseList = licenseList;
	}
	public List<SoloSkillDTO> getSkillList() {
		return skillList;
	}
	public void setSkillList(List<SoloSkillDTO> skillList) {
		this.skillList = skillList;
	}
	@Override
	public String toString() {
		return "UserSoloDTO [username=" + username + ", solo_name=" + solo_name + ", password=" + password
				+ ", solo_birth=" + solo_birth + ", solo_gender=" + solo_gender + ", solo_email=" + solo_email
				+ ", solo_cphone=" + solo_cphone + ", solo_addr=" + solo_addr + ", solo_lastedu=" + solo_lastedu
				+ ", solo_enabled=" + solo_enabled + ", solo_count=" + solo_count + ", portpolio_file=" + portpolio_file
				+ "]";
	}
	
	////////////////////////////////////////////////////////

	
}
