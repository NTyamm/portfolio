package kr.portfolio.odia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.portfolio.odia.dao.MemberDAO;
import kr.portfolio.odia.vo.MemberVO;

@Service
public class AdminServiceImp implements AdminService {

	@Autowired
	MemberDAO memberDao;
	
	@Override
	public List<MemberVO> getMemberList() {
		return memberDao.selectMemberList();
	}
	
	@Override
	public boolean updateGradeCode(MemberVO member) {
		if(member==null || member.getMe_id()==null
				|| member.getMe_auth()==null
				|| member.getMe_auth().equals("슈퍼관리자"))
			return false;
		MemberVO dbUser = memberDao.selectMember(member.getMe_id());
		if(dbUser == null)
			return false;
		dbUser.setMe_gr_code(member.getMe_gr_code());
		memberDao.updateMember(dbUser);
		return true;
		
	}

}
