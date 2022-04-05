package kr.portfolio.odia.service;

import kr.portfolio.odia.vo.MemberVO;

public interface MemberService {
	
	String idCheck(String me_id);

	MemberVO login(MemberVO member);

	boolean signup(MemberVO user);

	void updateAutoLogin(MemberVO user);

	MemberVO selectMemberBySessionId(String value);
	
	
}
