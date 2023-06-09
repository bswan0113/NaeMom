package kr.dbp.naemom.pagination;

import lombok.Data;

@Data
public class Criteria {
		//현재 페이지
		private int page; 
		//한 페이지 당 컨텐츠 갯수
		private int perPageNum;
		//검색어
		private String search;
		private int searchFilter;
		private int pc_category;
		//게시판 번호
		private int type;
		
		private String orderBy;
		
		private int rc_re_num;
		//여기에 피시넘 추까햬야햬요 끄럐야 아까 꺼끼써 쩐쏭햬써 빠ㄸ을쑤 잇어
		private int pc_num;

		//Criteria 디폴트 생성자 : 현재 페이지를 1페이지로, 한 페이지에 10개의 컨텐츠
		public Criteria() {
			this.page = 1;
			this.perPageNum = 10;
			this.search ="";
			this.type=0;
			this.orderBy="co_num";
		}
		
		/* 쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter */
		public int getPageStart() {
			return (this.page -1) * perPageNum;
		}
}
