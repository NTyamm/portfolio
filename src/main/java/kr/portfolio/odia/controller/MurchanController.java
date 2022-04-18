package kr.portfolio.odia.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.portfolio.odia.pagenation.Criteria;
import kr.portfolio.odia.pagenation.PageMaker;
import kr.portfolio.odia.service.MurchanService;
import kr.portfolio.odia.vo.MurchanVO;

@Controller
@RequestMapping(value="/shop")
public class MurchanController {

	@Autowired
	MurchanService murchanService;
	
	@RequestMapping(value="/murchanlist")
	public ModelAndView murchanlist(ModelAndView mv, Criteria cri, HttpServletRequest request) {
		
		cri.setPerPageNum(5);
		//등록된 게시글 중 현재 페이지와 일치하는 게시글 가져오기
		List<MurchanVO> list = murchanService.getMurchanList(cri);
		//페이지메이커를 만들어서 화면에 전달
		int totalCount = murchanService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("pm",pm);
		mv.addObject("list",list);
		mv.setViewName("/shop/murchanlist");
		return mv;
	}
}
