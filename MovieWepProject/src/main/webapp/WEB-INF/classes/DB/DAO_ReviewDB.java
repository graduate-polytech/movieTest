package DB;

import java.sql.*;
import java.util.*;

public class DAO_ReviewDB extends DatabaseConnection {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

//userid, movieCode, score, review, date
	public static void main(String[] args) {
		DAO_ReviewDB d = new DAO_ReviewDB();
//		ArrayList<Data_Review> reviewList = d.getReviewList();
//		ArrayList<Data_Review> reviewList = d.getReviewList("userID");
		ArrayList<Data_Review> reviewList = d.getReviewList("user0001", "아바타: 물의 길", "제임스 카메론");
		for (Data_Review review : reviewList) {
			System.out.println(review.toString());
		}
	}

	public ArrayList<Data_Review> getReviewList() {
		return getReviewList("", "", "");
	}

	public ArrayList<Data_Review> getReviewList(String userid) {
		return getReviewList(userid, "", "");
	}

	public ArrayList<Data_Review> getReviewList(String in_userid, String in_title, String in_director) {
		ArrayList<Data_Review> reviewList = new ArrayList<Data_Review>();
		String userid = in_userid.trim();
		String title = in_title.trim();
		String director = in_director.trim();
		try {

			conn = getConnection();
			// "SELECT * FROM moviedb.review WHERE ? = ?"
			String checkIdSql = "";

			int dataCount = 0;

			if (in_userid.length() == 0) {
				dataCount = 0;
			} else {
				dataCount = 1;
			}

			if (title.length() > 0 && director.length() > 0) {
				dataCount = 2;
			}

			if (dataCount == 0) {
				checkIdSql = "SELECT * FROM moviedb.review";
				System.out.println("리뷰 불러오기(전체)");
			} else if (dataCount == 1) {
				checkIdSql = "SELECT * FROM moviedb.review WHERE userid = ?";
				System.out.println("리뷰 불러오기(아이디)");
			} else if (dataCount == 2) {
				checkIdSql = "SELECT * FROM moviedb.review WHERE title = ? and director = ? ORDER BY (userid = ?) DESC";
				System.out.println("리뷰 불러오기(영화 본인)");
			}

			pstmt = conn.prepareStatement(checkIdSql);

			if (dataCount == 1) {
				pstmt.setString(1, userid);
			} else if (dataCount == 2) {
				pstmt.setString(1, title);
				pstmt.setString(2, director);
				pstmt.setString(3, userid);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 중복된 아이디가 이미 존재하는 경우
				Data_Review review = new Data_Review();
				review.setNo(rs.getInt(1));
				review.setUserid(rs.getString(2));
				review.setTitle(rs.getString(3));
				review.setDirector(rs.getString(4));
				review.setScore(rs.getInt(5));
				review.setReview(rs.getString(6));
				review.setDate(rs.getDate(7));
				reviewList.add(review);
			}

		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("finally : " + e.getMessage());
			}
		}
		if (reviewList != null) {
			for (Data_Review review : reviewList) {
				System.out.println("클래스에서 실행" + review.toString());
			}
		}
		return reviewList;
	}
}
