package kr.portfolio.odia.dao;

import org.apache.ibatis.annotations.Param;
import kr.portfolio.odia.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO selectMember(@Param("me_id")String me_id);

}
