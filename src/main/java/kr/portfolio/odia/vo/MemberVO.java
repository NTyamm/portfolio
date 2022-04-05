package kr.portfolio.odia.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_gr_code;
	private String me_pw;
	private String me_name;
	private String me_email;
	private String me_zip;
	private String me_address1;
	private String me_address2;
	private String me_phone;
	private String me_recommending;
	private int me_point;
	private String me_auth;
	private String me_auto_login;
	private String me_session_id;
	private Date me_session_limit;
	public String getMe_id() {
		return me_id;
	}

}
