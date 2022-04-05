package kr.portfolio.odia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import kr.portfolio.odia.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);

	void insertMember(@Param("user") MemberVO user);

	void updateAutoLogin(@Param("user")MemberVO user);

	MemberVO selectMemberBySessionId(@Param("me_session_id")String me_session_id);

	void updateMember(@Param("user")MemberVO input);

	List<MemberVO> selectMemberList();
	
}
