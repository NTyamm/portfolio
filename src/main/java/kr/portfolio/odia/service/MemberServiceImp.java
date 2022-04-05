package kr.portfolio.odia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.portfolio.odia.dao.MemberDAO;
import kr.portfolio.odia.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	public String idCheck(String me_id) {
		MemberVO user = memberDao.selectMember(me_id);
		if(user == null)
			return "true";
		else
			return "false";
	}


	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null)
			return null;
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user == null)
			return null;
		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		return null;
	}


	@Override
	public boolean signup(MemberVO user) {
		if(user == null)
			return false;
		if(user.getMe_id() == null || user.getMe_id().length() == 0)
			return false;
		if(user.getMe_pw() == null || user.getMe_pw().length() == 0)
			return false;
		if(user.getMe_name()==null || user.getMe_name().length() == 0)
			return false;
		if(user.getMe_phone()==null || user.getMe_phone().length() == 0)
			return false;
		if(user.getMe_zip() == null || user.getMe_zip().length() !=5 || user.getMe_address1() == null)
			return false;
		//아이디 중복검사 한 번 더
		if(memberDao.selectMember(user.getMe_id())!=null)
			return false;
		//비밀번호 암호화
		String encPw = passwordEncoder.encode(user.getMe_pw());
		user.setMe_pw(encPw);
		memberDao.insertMember(user);
		return true;
	}


	@Override
	public void updateAutoLogin(MemberVO user) {
		if(user==null)
			return;
		memberDao.updateAutoLogin(user);
		
	}


	@Override
	public MemberVO selectMemberBySessionId(String me_session_id) {
		return memberDao.selectMemberBySessionId(me_session_id);
	}
}
