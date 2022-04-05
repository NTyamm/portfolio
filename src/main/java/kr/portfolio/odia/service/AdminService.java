package kr.portfolio.odia.service;

import java.util.List;

import kr.portfolio.odia.vo.MemberVO;

public interface AdminService {

	List<MemberVO> getMemberList();

	boolean updateGradeCode(MemberVO member);

}
