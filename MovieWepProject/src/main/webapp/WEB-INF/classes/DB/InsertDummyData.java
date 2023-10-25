package DB;

import java.sql.*;
import java.util.*;

public class InsertDummyData extends DatabaseConnection {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	class movieData {
		String title;
		String director;

		movieData(String title, String director) {
			this.title = title;
			this.director = director;
		}

		public String getTitle() {
			return title;
		}

		public String getDirector() {
			return director;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public void setDirector(String director) {
			this.director = director;
		}
	}

	ArrayList<movieData> movieList = new ArrayList<movieData>();
	int insertCount = 0;
	public static void main(String[] args) {
		new InsertDummyData();
	}

	InsertDummyData() {
		

		//System.out.println(movieList.size());
		//movieListCopy = movieList;
		//System.out.println(movieListCopy.size());
		conn = getConnection();
		for (int idCount = 1; idCount <= 200; idCount++) {
			String id = createUserId(idCount);
			
			listReset();
			System.out.println(id + "의 데이터 추가중");
			insertSql(id);
		}
		System.err.println("추가 완료 : " + insertCount);

	}
	
	public void listReset() {
		movieList = new ArrayList<movieData>();
		movieList.add(new movieData("아바타: 물의 길", "제임스 카메론"));
		movieList.add(new movieData("아이언 맨 3", "셰인 블랙"));
		movieList.add(new movieData("사일런스", "사일런스"));
		movieList.add(new movieData("극장판 또봇: 로봇군단의 습격", "이달"));
		movieList.add(new movieData("스파이더맨: 어크로스 더 유니버스", "호아킴 도스 산토스"));
		movieList.add(new movieData("스파이더맨: 파 프롬 홈", "존 왓츠"));
		movieList.add(new movieData("어벤져스: 엔드게임", "안소니 루소"));
		movieList.add(new movieData("더 배트맨", "맷 리브스"));
		movieList.add(new movieData("다크 나이트 라이즈", "크리스토퍼 놀란"));
		movieList.add(new movieData("조커", "토드 필립"));
		movieList.add(new movieData("백두산", "이해준"));
		movieList.add(new movieData("30일", "남대중"));
		movieList.add(new movieData("뉴 문", "크리스 웨이츠"));
		movieList.add(new movieData("트와일라잇", "캐서린 하드윅"));
		movieList.add(new movieData("이클립스", "데이빗 슬레이드"));
		movieList.add(new movieData("신과함께-인과 연", "김용화"));
		movieList.add(new movieData("존 윅 4", "채드 스타헬스키"));
		movieList.add(new movieData("기생충", "봉준호"));
		movieList.add(new movieData("인어공주", "로브 마샬"));
		movieList.add(new movieData("겨울왕국 2", "크리스 벅"));
		movieList.add(new movieData("닥터 스트레인지", "스코트 데릭슨"));
		movieList.add(new movieData("이터널스", "클로이 자오"));
		movieList.add(new movieData("노인을 위한 나라는 없다", "조엘 코엔"));
		movieList.add(new movieData("마션", "마션"));
		movieList.add(new movieData("트랜스포머 3", "마이클 베이"));
		movieList.add(new movieData("인터스텔라", "크리스토퍼 놀란"));
		movieList.add(new movieData("타짜", "최동훈"));
		movieList.add(new movieData("데드풀", "팀 밀러"));
		movieList.add(new movieData("엑스맨 탄생: 울버린", "개빈 후드"));
		movieList.add(new movieData("블랙 팬서: 와칸다 포에버", "라이언 쿠글러"));
	}
	
	public void insertSql(String id) {
		for (int i = 0; i < 5	; i++) {
			int index = rand(0, movieList.size()-1);
			String title = movieList.get(index).getTitle();
			String director = movieList.get(index).getDirector();
			
			int score = rand(0, 10);
			String sql = setSql(id, title, director, score);
			insertDummyReviews(sql);
			movieList.remove(index);
		}
	}

	public String setSql(String userid, String title, String director, int score) {
		String review = userid + "가 작성한 [" + director + "]감독의 영화[" + title + "]에 대한 " + score + "점 리뷰 입니다.";
		return "insert into moviedb.review(userid,title,director,score,review) value(\'" + userid.trim() + "\',\'"
				+ title.trim() + "\',\'" + director.trim() + "\'," + score + ",\'" + review.trim() + "\')";
	}

	public String createUserId(int c) {

		String count = c + "";
		while (count.length() <= 3) {
			count = "0" + count;
		}

		return "user" + count;
	}

	public int rand(int in_min, int in_max) {
		Random rand = new Random();
		int min = Math.min(in_min, in_max);
		int max = Math.max(in_min, in_max);
		return rand.nextInt((max - min) + 1) + min;
	}

	public void insertDummyReviews(String sql) {
		
		try {
			// "SELECT * FROM moviedb.review WHERE ? = ?"
			String checkIdSql = sql;

			pstmt = conn.prepareStatement(checkIdSql);

			int rs = pstmt.executeUpdate();
			insertCount++;
			if (rs > 0) {
				//System.out.println("추가 완료 : " + insertCount++);
			}

		} catch (SQLException e) {
			System.out.println("에러발생 : " + sql);
			e.printStackTrace();
		}
	}
}
