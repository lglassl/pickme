package kr.or.pickme.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class SoloPortpolioDTO {
	private String username;
	private int portpolio_no;
	private String portpolio_file;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getPortpolio_no() {
		return portpolio_no;
	}
	public void setPortpolio_no(int portpolio_no) {
		this.portpolio_no = portpolio_no;
	}
	public String getPortpolio_file() {
		return portpolio_file;
	}
	public void setPortpolio_file(String portpolio_file) {
		this.portpolio_file = portpolio_file;
	}
	@Override
	public String toString() {
		return "SoloPortpolioDTO [username=" + username + ", portpolio_no=" + portpolio_no + ", portpolio_file="
				+ portpolio_file + "]";
	}
	
	

}
