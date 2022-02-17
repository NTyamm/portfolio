package kr.portfolio.odia.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private int me_gr_code;
	private String me_pw;
	private String me_name;
	private String me_email;
	private int me_zip;
	private String me_address1;
	private String me_address2;
	private String me_phone;
	private String me_recommending;
	private int me_point;
	private int me_auth;
	public String getMe_id() {
		return me_id;
	}

}
