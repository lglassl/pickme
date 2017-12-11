package kr.or.pickme.dto;

public class LetterDTO {
	private int letter_no;
	private String letter_title;
	private String letter_ctmt;
	private String letter_senddate;
	private String solo_username;
	private String comp_username;
	
	public int getLetter_no() {
		return letter_no;
	}
	public void setLetter_no(int letter_no) {
		this.letter_no = letter_no;
	}
	public String getLetter_title() {
		return letter_title;
	}
	public void setLetter_title(String letter_title) {
		this.letter_title = letter_title;
	}
	public String getLetter_ctmt() {
		return letter_ctmt;
	}
	public void setLetter_ctmt(String letter_ctmt) {
		this.letter_ctmt = letter_ctmt;
	}
	public String getLetter_senddate() {
		return letter_senddate;
	}
	public void setLetter_senddate(String letter_senddate) {
		this.letter_senddate = letter_senddate;
	}
	public String getSolo_username() {
		return solo_username;
	}
	public void setSolo_username(String solo_username) {
		this.solo_username = solo_username;
	}
	public String getComp_username() {
		return comp_username;
	}
	public void setComp_username(String comp_username) {
		this.comp_username = comp_username;
	}
		
	@Override
	public String toString() {
		return "LetterDTO [letter_no=" + letter_no + ", letter_title=" + letter_title + ", letter_ctmt=" + letter_ctmt
				+ ", letter_senddate=" + letter_senddate + ", solo_username=" + solo_username + ", comp_username="
				+ comp_username + "]";
	}
	
}
