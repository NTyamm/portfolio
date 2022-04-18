package kr.portfolio.odia.service;

import java.util.List;

import kr.portfolio.odia.pagenation.Criteria;
import kr.portfolio.odia.vo.MurchanVO;

public interface MurchanService {

	List<MurchanVO> getMurchanList(Criteria cri);

	int getTotalCount(Criteria cri);

}
