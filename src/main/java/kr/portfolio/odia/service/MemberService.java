package kr.portfolio.odia.service;

import kr.portfolio.odia.vo.MemberVO;

public interface MemberService {
	
	boolean signup(MemberVO user);

	MemberVO login(MemberVO user);
}
