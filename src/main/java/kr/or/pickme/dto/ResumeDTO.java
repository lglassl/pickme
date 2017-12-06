package kr.or.pickme.dto;

import java.util.List;

public class ResumeDTO {
	
	private int resu_code;
	private String username;
	private int pick_code;
	private int paper_status;
	private int edit_status;

	
	/////////////////////////////////////////////////////
	
	private List<CoverletterDTO2> coverletterList2;
	private List<SoloAwardDTO2> awardList2;
	private List<SoloCareerDTO2> careerList2;
	private List<SoloEduDTO2> eduList2;
	private List<SoloLangDTO2> langList2;
	private List<SoloLicenseDTO2> licenseList2;
	private List<SoloSkillDTO2> skillList2;
	
	///////////////// ** 파일 업로드 객체 추가**/// 단일 파일 업로드 //////////////////
	private String portpolio_file;
	
	public String getPortpolio_file() {
		return portpolio_file;
	}
	public void setPortpolio_file(String portpolio_file) {
		this.portpolio_file = portpolio_file;
	}
	
////////////////////////////////////////////////////////
	
	
	public int getResu_code() {
		return resu_code;
	}
	
	public int getPick_code() {
		return pick_code;
	}
	public void setPick_code(int pick_code) {
		this.pick_code = pick_code;
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
	public List<CoverletterDTO2> getCoverletterList2() {
		return coverletterList2;
	}
	public void setCoverletterList(List<CoverletterDTO2> coverletterList2) {
		this.coverletterList2 = coverletterList2;
	}
	public List<SoloAwardDTO2> getAwardList2() {
		return awardList2;
	}
	public void setAwardList2(List<SoloAwardDTO2> awardList2) {
		this.awardList2 = awardList2;
	}
	public List<SoloCareerDTO2> getCareerList2() {
		return careerList2;
	}
	public void setCareerList2(List<SoloCareerDTO2> careerList2) {
		this.careerList2 = careerList2;
	}
	public List<SoloEduDTO2> getEduList2() {
		return eduList2;
	}
	public void setEduList2(List<SoloEduDTO2> eduList2) {
		this.eduList2 = eduList2;
	}
	public List<SoloLangDTO2> getLangList2() {
		return langList2;
	}
	public void setLangList2(List<SoloLangDTO2> langList2) {
		this.langList2 = langList2;
	}
	public List<SoloLicenseDTO2> getLicenseList2() {
		return licenseList2;
	}
	public void setLicenseList2(List<SoloLicenseDTO2> licenseList2) {
		this.licenseList2 = licenseList2;
	}
	public List<SoloSkillDTO2> getSkillList2() {
		return skillList2;
	}
	public void setSkillList2(List<SoloSkillDTO2> skillList2) {
		this.skillList2 = skillList2;
	}
	public void setCoverletterList2(List<CoverletterDTO2> coverletterList2) {
		this.coverletterList2 = coverletterList2;
	}
	@Override
	public String toString() {
		return "ResumeDTO [resu_code=" + resu_code + ", username=" + username + ", paper_status=" + paper_status
				+ ", edit_status=" + edit_status + ", coverletterList2=" + coverletterList2 + ", awardList2="
				+ awardList2 + ", careerList2=" + careerList2 + ", eduList2=" + eduList2 + ", langList2=" + langList2
				+ ", licenseList2=" + licenseList2 + ", skillList2=" + skillList2 + ", portpolio_file=" + portpolio_file
				+ "]";
	}

	

	
	

}
