package kr.portfolio.odia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.portfolio.odia.dao.MurchanDAO;
import kr.portfolio.odia.pagenation.Criteria;
import kr.portfolio.odia.vo.MurchanVO;

@Service
public class MurchanServiceImp implements MurchanService{

	@Autowired
	MurchanDAO murchanDao;
	
	@Override
	public List<MurchanVO> getMurchanList(Criteria cri) {
		return murchanDao.getMurchanList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return murchanDao.selectCountMurchan(cri);
	}

}
