package kr.portfolio.odia.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.portfolio.odia.vo.MemberVO;
import kr.portfolio.odia.service.AdminService;

@Controller

public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/index")
	public ModelAndView adminGet(ModelAndView mv
			,HttpServletRequest request) {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null || !user.getMe_auth().equals("슈퍼 관리자")) {
			mv.setViewName("redirect:/");
		}else {
			//회원 정보를 가져옴.(슈퍼관리자를 제외한 회원정보)
			List<MemberVO> userList = adminService.getMemberList();
			mv.addObject("list", userList);
			mv.setViewName("/admin/member/list");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/update/authority")
	public boolean adminUpdateGradeCode(@RequestBody MemberVO member) {
		return adminService.updateGradeCode(member);
	}
}
