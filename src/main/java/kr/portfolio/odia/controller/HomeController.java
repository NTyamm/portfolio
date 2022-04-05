package kr.portfolio.odia.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.portfolio.odia.service.MemberService;
import kr.portfolio.odia.vo.MemberVO;


@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value="/")
	public ModelAndView openTilesView(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/home");
	    return mv;
	}
	
	@ResponseBody
	@RequestMapping(value= "/idcheck")
	public String idCheck(String me_id){
		return memberService.idCheck(me_id);
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member, HttpServletRequest request) {
		MemberVO user = memberService.login(member);
		mv.addObject("user",user);
		String prevUrl = (String)request.getSession().getAttribute("prevUrl");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		memberService.signup(user);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(user != null) {
			//세션의 유저정보 삭제
			request.getSession().removeAttribute("user");
			//request에 있는 쿠키들 중 loginCookie 가져옴
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			//자동로그인 했다가 로그아웃하는 경우(loginCookie정보가 있음)
			if(cookie != null) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//자동로그인 해제를 위해 세션아이디에 none 저장, 만료시간 현재로 설정
				user.setMe_session_id("none");
				user.setMe_session_limit(new Date());
				memberService.updateAutoLogin(user);
			}
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value = "/mypage")
	public ModelAndView mypageGet(ModelAndView mv, MemberVO input
			,HttpServletRequest request) {
		System.out.println("마이페이지");
		mv.setViewName("/member/mypage");
		return mv;
	}
} 