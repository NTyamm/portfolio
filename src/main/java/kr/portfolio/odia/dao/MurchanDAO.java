package kr.portfolio.odia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.portfolio.odia.pagenation.Criteria;
import kr.portfolio.odia.vo.MurchanVO;

public interface MurchanDAO {

	List<MurchanVO> getMurchanList (@Param("cri")Criteria cri); 
	int selectCountMurchan(@Param("cri")Criteria cri); 
}
