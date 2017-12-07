package kr.or.pickme.dto;

public class SoloLicenseDTO {
	private String username;
	private int license_no;
	private String license_name;
	private String license_co;
	private String license_getdate;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getLicense_no() {
		return license_no;
	}
	public void setLicense_no(int license_no) {
		this.license_no = license_no;
	}
	public String getLicense_name() {
		return license_name;
	}
	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}
	public String getLicense_co() {
		return license_co;
	}
	public void setLicense_co(String license_co) {
		this.license_co = license_co;
	}
	public String getLicense_getdate() {
		return license_getdate;
	}
	public void setLicense_getdate(String license_getdate) {
		this.license_getdate = license_getdate;
	}
	@Override
	public String toString() {
		return "SoloLicenseDTO [username=" + username + ", license_no=" + license_no + ", license_name=" + license_name
				+ ", license_co=" + license_co + ", license_getdate=" + license_getdate + "]";
	}
	
	
}
