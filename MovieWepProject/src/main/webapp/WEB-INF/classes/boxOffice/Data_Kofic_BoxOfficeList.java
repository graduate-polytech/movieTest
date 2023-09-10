package boxOffice;

import java.util.ArrayList;
import java.util.List;

public class Data_Kofic_BoxOfficeList {
	
	//주간|주말 박스오피스 전용
	private String yearWeekTime;	//조회일자에 해당하는 연도와 주차를 출력합니다.(YYYY|W)
	public String getYearWeekTime() { return yearWeekTime; }
	public void setYearWeekTime(String yearWeekTime) { this.yearWeekTime = yearWeekTime; }
	ArrayList<weeklyBoxOffice> weeklyBoxOffices = new ArrayList<>();
	
	private String boxofficeType;	//박스오피스 종류를 출력합니다.
	private String showRange;		//대상 상영기간을 출력합니다.
	
	public String getBoxofficeType() { return boxofficeType; }
	public String getShowRange() { return showRange; }
	
	public void setBoxofficeType(String boxofficeType) { this.boxofficeType = boxofficeType; }
	public void setShowRange(String showRange) { this.showRange = showRange; }

	public class weeklyBoxOffice{

		private String audiAcc;	//누적관객수를 출력합니다.
		private String audiChange;	//전일 대비 관객수 증감 비율을 출력합니다.
		private String audiCnt;	//해당일의 관객수를 출력합니다.
		private String audiInten;	//전일 대비 관객수 증감분을 출력합니다.
		private String movieCd;	//영화의 대표코드를 출력합니다.
		private String movieNm;	//영화명(국문)을 출력합니다.
		private String openDt;	//영화의 개봉일을 출력합니다.
		private String rank;	//해당일자의 박스오피스 순위를 출력합니다.
		private String rankInten;	//전일대비 순위의 증감분을 출력합니다.
		private String rankOldAndNew;	//랭킹에 신규진입여부를 출력합니다. “OLD” : 기존 , “NEW” : 신규
		private String rnum;	//순번을 출력합니다.
		private String salesAcc;	//누적매출액을 출력합니다.
		private String salesAmt;	//해당일의 매출액을 출력합니다.
		private String salesChange;	//전일 대비 매출액 증감 비율을 출력합니다.
		private String salesInten;	//전일 대비 매출액 증감분을 출력합니다.
		private String salesShare;	//해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
		private String scrnCnt;	//해당일자에 상영한 스크린수를 출력합니다.
		private String showCnt;	//해당일자에 상영된 횟수를 출력합니다.

		public String getAudiacc() { return audiAcc; }
		public String getAudichange() { return audiChange; }
		public String getAudicnt() { return audiCnt; }
		public String getAudiinten() { return audiInten; }
		public String getMoviecd() { return movieCd; }
		public String getMovienm() { return movieNm; }
		public String getOpendt() { return openDt; }
		public String getRank() { return rank; }
		public String getRankinten() { return rankInten; }
		public String getRankoldandnew() { return rankOldAndNew; }
		public String getRnum() { return rnum; }
		public String getSalesacc() { return salesAcc; }
		public String getSalesamt() { return salesAmt; }
		public String getSaleschange() { return salesChange; }
		public String getSalesinten() { return salesInten; }
		public String getSalesshare() { return salesShare; }
		public String getScrncnt() { return scrnCnt; }
		public String getShowcnt() { return showCnt; }

		public void setAudiacc(String audiAcc) { this.audiAcc = audiAcc; }
		public void setAudichange(String audiChange) { this.audiChange = audiChange; }
		public void setAudicnt(String audiCnt) { this.audiCnt = audiCnt; }
		public void setAudiinten(String audiInten) { this.audiInten = audiInten; }
		public void setMoviecd(String movieCd) { this.movieCd = movieCd; }
		public void setMovienm(String movieNm) { this.movieNm = movieNm; }
		public void setOpendt(String openDt) { this.openDt = openDt; }
		public void setRank(String rank) { this.rank = rank; }
		public void setRankinten(String rankInten) { this.rankInten = rankInten; }
		public void setRankoldandnew(String rankOldAndNew) { this.rankOldAndNew = rankOldAndNew; }
		public void setRnum(String rnum) { this.rnum = rnum; }
		public void setSalesacc(String salesAcc) { this.salesAcc = salesAcc; }
		public void setSalesamt(String salesAmt) { this.salesAmt = salesAmt; }
		public void setSaleschange(String salesChange) { this.salesChange = salesChange; }
		public void setSalesinten(String salesInten) { this.salesInten = salesInten; }
		public void setSalesshare(String salesShare) { this.salesShare = salesShare; }
		public void setScrncnt(String scrnCnt) { this.scrnCnt = scrnCnt; }
		public void setShowcnt(String showCnt) { this.showCnt = showCnt; }
	}
}
