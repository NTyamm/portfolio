package kr.portfolio.odia.pagenation;

import lombok.Data;

@Data
public class Criteria {
	//현재페이지
	private int page;
	//한 페이지당 컨텐츠 갯수
	private int perPageNum;
	//검색어
	private String search;
	//게시글타입
	private String type;
	//Criteria 디폴트 생성자: 현재 페이지를 1페이리ㅗ, 한 페이지에 10개의 컨텐츠
	public Criteria() {
		this.page=1;
		this.perPageNum=10;
		this.search="";
		this.type="음료";
	}
	public Criteria(int page, int perPageNum) {
		this.page = page <= 0 ? 1 : page;
		this.perPageNum = perPageNum <= 0 ? 10 : perPageNum;
	}
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	
}
