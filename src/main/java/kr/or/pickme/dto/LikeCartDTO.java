package kr.or.pickme.dto;

public class LikeCartDTO {
	private int like_no;
	private String username;
	private int pick_code;
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
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

	@Override
	public String toString() {
		return "LikeCartDTO [like_no=" + like_no + ", username=" + username + ", pick_code=" + pick_code
				+ "]";
	}
	
	
}
